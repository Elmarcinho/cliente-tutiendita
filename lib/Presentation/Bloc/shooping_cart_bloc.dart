
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

    if( state.listProduct.isEmpty || !state.listProduct.any((element) => element.id == event.product.id)){

      emit(
        state.copyWith(
          listProduct: List<ProductModel>.from(state.listProduct)..add(event.product)
        )
      );
    }else{

    }

   
  }

  
}
