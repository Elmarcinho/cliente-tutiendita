part of 'shooping_cart_bloc.dart';

class ShoopingCartState extends Equatable {

  final int quantity;
  final double total;
  final List<ProductModel> listProduct;
  //final List<DetailOrderModel> listDetailOrder;
  
  const ShoopingCartState({

    this.quantity = 0,
    this.total = 0.0,
    this.listProduct = const []
    //this.listDetailOrder= const [],
  });

  ShoopingCartState copyWith({
    int? quantity,
    double? total,
    List<ProductModel>? listProduct
    //List<DetailOrderModel>? listDetailOrder,

  }) => ShoopingCartState(
    quantity: quantity ?? this.quantity,
    total: total ?? this.total,
    listProduct: listProduct ?? this.listProduct
    //listDetailOrder: listDetailOrder ?? this.listDetailOrder,
  );
  
  @override
  List<Object> get props => [ quantity, total, listProduct ];
}
