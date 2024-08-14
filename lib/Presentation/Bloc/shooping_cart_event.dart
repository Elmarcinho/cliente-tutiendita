part of 'shooping_cart_bloc.dart';

class ShoopingCartEvent extends Equatable {
  const ShoopingCartEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends ShoopingCartEvent{
  final ProductModel product;
  final int quantity;
  final bool visible;
  const AddProductEvent(this.product, this.quantity, this.visible);
}
