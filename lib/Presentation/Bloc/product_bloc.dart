import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:cliente_tutiendita/Negocio/validation/validation.dart';
import 'package:cliente_tutiendita/Model/product_model.dart';
import 'package:cliente_tutiendita/Provider/category_provider.dart';
import 'package:cliente_tutiendita/Provider/product_provider.dart';




part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  final ProductProvider productProvider;
  final CategoryProvider categoryProvider;

  ProductBloc(this.productProvider, this.categoryProvider) : super(const ProductState()) {

    on<GetProductsEvent>( _onGetProducts);
    on<OnSearchProduct>( _onSearchProduct);
    on<AddProductShoopingCartEvent>( _addProductShoopingCart);
    on<OnQuantityUpdate>( _onQuantityUpdate);
    on<OnVisibility>( _onVisibility);
    on<DeleteProductShoopingCartEvent>( _deleteProductShoopingCartEvent);
    on<OnTitleQuery>( _onTitleQuery);
    on<OnResetQuery>( _onResetQuery);
    on<OnUltimoQuery>( _onUltimoQuery);

  }

  void _onGetProducts( GetProductsEvent event, Emitter emit) async{
    
    final productos = await productProvider.getProductos();

    emit( 
      state.copyWith(
        listProduct: productos,
        listProductRepository: productos
      )
    );
  }

  void _onSearchProduct( OnSearchProduct event, Emitter emit){
    
    final query =  state.listProduct.where((element) => element.title.contains( event.query)).toList();
   
    emit( 
      state.copyWith(
        listProductRepository: query,
      )
    );
  }

  void _addProductShoopingCart( AddProductShoopingCartEvent event, Emitter emit){

    if( state.listProductShoopingCart.isEmpty || !state.listProductShoopingCart.any((element) => element.id == event.product.id)){

      emit(
        state.copyWith(
          quantity: state.quantity + event.product.quantity,
          listProductShoopingCart  : List<ProductModel>.from(state.listProductShoopingCart)..add(event.product),
        ),
      );
      emit(
        state.copyWith(
          total: state.listProductShoopingCart.fold<double>( 0.0, (previousValue, element) => previousValue + (element.quantity * element.price)),
        )
      );
    }
  }

  void _onQuantityUpdate( OnQuantityUpdate event, Emitter emit){
    
    final quantity = state.listProductShoopingCart.fold<int>( 0, (previousValue, element) => previousValue + element.quantity);
    final listUpdate = List<ProductModel>.from(state.listProduct.map((e) => e.id == event.product.id? event.product : e));
    final total = state.listProductShoopingCart.fold<double>( 0.0, (previousValue, element) => previousValue + (element.quantity * element.price));

    emit(
      state.copyWith( 
        quantity: quantity,
        listProduct: listUpdate,
        total: total
      )
    );
  }

  void _onVisibility( OnVisibility event, Emitter emit ){

    final listUpdate = List<ProductModel>.from(state.listProduct.map((e) => e.id == event.product.id? event.product : e));

    emit(
      state.copyWith(
        listProduct: listUpdate
      )
    );
  }

  void _deleteProductShoopingCartEvent( DeleteProductShoopingCartEvent event, Emitter emit){

    state.listProductShoopingCart.removeAt(event.index);
    final total = state.listProductShoopingCart.fold<double>( 0.0, (previousValue, element) => previousValue + (element.quantity * element.price));
    event.product.quantity = 0;
    final listUpdate = List<ProductModel>.from(state.listProduct.map((e) => e.id == event.product.id? event.product : e));

    emit(
      state.copyWith(
        quantity: state.quantity - event.product.quantity,
        total: total,
        listProduct: listUpdate
      )
    );
  }

  void _onTitleQuery( OnTitleQuery event, Emitter emit){

    final titleQuery = TitleQuery.dirty(event.titleQuery);
    
    emit( 
      state.copyWith(
        titleQuery: titleQuery,
        isFormValid: Formz.validate([titleQuery])
      )
    );

  }

  void _onUltimoQuery( OnUltimoQuery event, Emitter emit){
    
    emit( 
      state.copyWith(
        titleQuery: TitleQuery.dirty(event.ultimoQuery)
      )
    );

  }

  void _onResetQuery ( OnResetQuery event, Emitter emit){
    emit(
      state.copyWith(
        titleQuery: const TitleQuery.dirty('')
      )
    );
  }

}
