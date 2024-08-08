import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cliente_tutiendita/Model/product_model.dart';
import 'package:cliente_tutiendita/Model/category_model.dart';
import 'package:cliente_tutiendita/Provider/category_provider.dart';
import 'package:cliente_tutiendita/Provider/product_provider.dart';




part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  final ProductProvider productProvider;
  final CategoryProvider categoryProvider;

  ProductBloc(this.productProvider, this.categoryProvider) : super(const ProductState()) {

    on<GetProductsEvent>( _onGetProducts);
    on<ProductoEvent>( _onProducto);
    on<OnSearchProduct>( _onSearchProduct);
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

   void _onProducto( ProductoEvent event, Emitter emit){
    
    emit(
      state.copyWith(
        product: event.product
      )
    );
  }

  void _onSearchProduct( OnSearchProduct event, Emitter emit) async{
    
    
    final query =  state.listProduct.where((element) => element.title.contains( event.query)).toList();
   
    emit( 
      state.copyWith(
        listProductRepository: query,
      )
    );
  }


  void _onUltimoQuery( OnUltimoQuery event, Emitter emit) async{
    
    emit( 
      state.copyWith(
        ultimoQuery: event.ultimoQuery
      )
    );

  }

}
