import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/product_model.dart';

part 'shooping_cart_event.dart';
part 'shooping_cart_state.dart';

class ShoopingCartBloc extends Bloc<ShoopingCartEvent, ShoopingCartState> {

  ShoopingCartBloc() : super( const ShoopingCartState()) {

    on<AddProductEvent>( _addProduct);
  }

  void _addProduct( AddProductEvent event, Emitter emit){

    //DetailOrderModel detail = DetailOrderModel();

    if( state.listProduct.isEmpty || !state.listProduct.any((element) => element.id == event.product.id)){

      // detail.idProduct = event.product.id;
      // detail.title = event.product.title;
      // detail.description1 = event.product.description1;
      // detail.description2 = event.product.description2;
      // detail.price = event.product.price;
      // detail.image = event.product.image;
      // detail.quantity = event.quantity;

      emit(
        state.copyWith(
          listProduct  : List<ProductModel>.from(state.listProduct)..add(event.product),
        )
      );
    }else{

    }

   
  }

  
}
