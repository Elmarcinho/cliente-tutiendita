part of 'shooping_cart_bloc.dart';

class ShoopingCartEvent extends Equatable {
  const ShoopingCartEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends ShoopingCartEvent{
  final ProductModel product;
  const AddProductEvent(this.product);
}
