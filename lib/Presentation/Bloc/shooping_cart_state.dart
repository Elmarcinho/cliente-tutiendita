part of 'shooping_cart_bloc.dart';

class ShoopingCartState extends Equatable {

  final int quantity;
  final double total;
  final List<DetailOrderModel> listDetailOrder;
  
  const ShoopingCartState({

    this.quantity = 0,
    this.total = 0.0,
    this.listDetailOrder= const [],
  });

  ShoopingCartState copyWith({
    int? quantity,
    double? total,
    List<DetailOrderModel>? listDetailOrder,
    bool? visible

  }) => ShoopingCartState(
    quantity: quantity ?? this.quantity,
    total: total ?? this.total,
    listDetailOrder: listDetailOrder ?? this.listDetailOrder,
  );
  
  @override
  List<Object> get props => [ quantity, total, listDetailOrder ];
}
