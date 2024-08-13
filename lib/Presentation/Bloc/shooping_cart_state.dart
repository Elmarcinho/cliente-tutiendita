part of 'shooping_cart_bloc.dart';

class ShoopingCartState extends Equatable {

  final int cantidad;
  final double total;
  final List<ProductModel> listProduct;
  
  const ShoopingCartState({

    this.cantidad = 0,
    this.total = 0.0,
    this.listProduct= const [],
  });

  ShoopingCartState copyWith({
    int? cantidad,
    double? total,
    List<ProductModel>? listProduct

  }) => ShoopingCartState(
    cantidad: cantidad ?? this.cantidad,
    total: total ?? this.total,
    listProduct: listProduct ?? this.listProduct
  );
  
  @override
  List<Object> get props => [ cantidad, total, listProduct ];
}
