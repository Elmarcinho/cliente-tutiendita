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

    on<GetProductosEvent>( _onGetProductos);
    on<ProductoEvent>( _onProducto);
    on<OnUltimoQuery>( _onUltimoQuery);

  }

  void _onGetProductos( GetProductosEvent event, Emitter emit) async{
    
    final productos = await productProvider.getProductos();

    emit( 
      state.copyWith(
        listProduct: productos,
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

  void _onUltimoQuery( OnUltimoQuery event, Emitter emit) async{
    
    emit( 
      state.copyWith(
        ultimoQuery: event.ultimoQuery
      )
    );

  }

}
