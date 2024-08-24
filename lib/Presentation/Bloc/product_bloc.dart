import 'package:cliente_tutiendita/Model/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cliente_tutiendita/Model/product_model.dart';
import 'package:cliente_tutiendita/Provider/category_provider.dart';
import 'package:cliente_tutiendita/Provider/product_provider.dart';

import '../Screens/screen.dart';


part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  final ProductProvider productProvider;
  final CategoryProvider categoryProvider;

  ProductBloc(this.productProvider, this.categoryProvider) : super(const ProductState()) {

    on<GetProductsEvent>( _onGetProducts);
    on<GetCategoryProductsEvent> ( _getCategoryProducts);
    on<OnSearchProduct>( _onSearchProduct);
    on<OnSearchProductCategory>( _onSearchProductCategory);
    on<AddProductShoopingCartEvent>( _addProductShoopingCart);
    on<OnQuantityUpdate>( _onQuantityUpdate);
    on<OnVisibility>( _onVisibility);
    on<DeleteProductShoopingCartEvent>( _deleteProductShoopingCartEvent);
    on<OnTitleQuery>( _onTitleQuery);
    on<OnTitleQuery2>( _onTitleQuery2);
    on<OnScreenCategoryProduct>( _onScreenCategoryProduct);
    on<OnResetQuery>( _onResetQuery);
    on<OnResetQuery2>( _onResetQuery2);
    on<OnResetShoopingCart>( _onResetShoopingCart);
    on<OnSelectNavigationBar>( _onSelectNavigationBar);

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

  void _getCategoryProducts( GetCategoryProductsEvent event, Emitter emit){

    final listFilter = state.listProduct.where((element) => element.idCategory == event.category.id).toList();

    emit( 
      state.copyWith(
        listCategoryProducts: listFilter,
        listCategoryProductsRepository: listFilter
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

  void _onSearchProductCategory( OnSearchProductCategory event, Emitter emit){
    
    final query =  state.listCategoryProducts.where((element) => element.title.contains( event.query)).toList();
   
    emit( 
      state.copyWith(
        listCategoryProductsRepository: query,
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

    state.listProductShoopingCart.removeWhere((element) => element.id == event.product.id);
    final total = state.listProductShoopingCart.fold<double>( 0.0, (previousValue, element) => previousValue + (element.quantity * element.price));
    final quantity = state.quantity - event.product.quantity;
    event.product.quantity = 0;
    final listUpdate = List<ProductModel>.from(state.listProduct.map((e) => e.id == event.product.id? event.product : e));

    emit(
      state.copyWith(
        quantity: quantity,
        total: total,
        listProduct: listUpdate
      )
    );
  }

  void _onTitleQuery( OnTitleQuery event, Emitter emit){

    final titleQuery = event.titleQuery;
    
    emit( 
      state.copyWith(
        titleQuery: titleQuery,
      )
    );

  }

    void _onTitleQuery2( OnTitleQuery2 event, Emitter emit){

    final titleQuery2 = event.titleQuery2;
    
    emit( 
      state.copyWith(
        titleQuery2: titleQuery2,
      )
    );
  }

  void _onScreenCategoryProduct( OnScreenCategoryProduct event, Emitter emit){

    emit(
      state.copyWith(
        screenCategoryProduct: event.semaforo
      )
    );
  }

  void _onResetShoopingCart( OnResetShoopingCart event, Emitter emit) async{

    final productos = await productProvider.getProductos();

    emit(
      state.copyWith(
        listProduct: productos,
        listProductRepository: productos,
        listProductShoopingCart: [],
        total: 0.0,
        quantity: 0
      )
    );
  }


  void _onResetQuery( OnResetQuery event, Emitter emit){
    
    emit(
      state.copyWith(
        titleQuery: '',
      )
    );
  }

  void _onResetQuery2( OnResetQuery2 event, Emitter emit){
    
    emit(
      state.copyWith(
        titleQuery2: '',
      )
    );
  }

  void _onSelectNavigationBar( OnSelectNavigationBar event, Emitter emit){

    emit(
      state.copyWith(
        selectIndex: event.index
      )
    );
  }

}
