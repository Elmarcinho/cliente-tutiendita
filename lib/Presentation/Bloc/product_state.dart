part of 'product_bloc.dart';

class ProductState extends Equatable {

  final bool formStatus;
  final bool isFormValid;
  final bool isEnabled;
  final ProductModel? product;
  final List<ProductModel> listProduct;
  final List<ProductModel> listProductRepository;
  final List<ProductModel> listProductShoopingCart;
  final bool isCreate;
  final TitleQuery titleQuery;
  final int quantity;
  final double total;

  const ProductState({
    this.formStatus = false,
    this.isFormValid = false,
    this.isEnabled = false,
    this.product,
    this.listProduct= const [],
    this.listProductRepository= const [],
    this.listProductShoopingCart= const [],
    this.isCreate = false,
    this.titleQuery = const TitleQuery.dirty(''),
    this.quantity = 0,
    this.total = 0.0
  });

  ProductState copyWith({
    bool? formStatus,
    bool? isFormValid,
    bool? isEnabled,
    ProductModel?  product,
    List<ProductModel>? listProduct,
    List<ProductModel>? listProductRepository,
    List<ProductModel>? listProductShoopingCart,
    bool? isCreate,
    TitleQuery? titleQuery,
    int? quantity,
    double? total

  }) => ProductState(
    formStatus: formStatus ?? this.formStatus,
    isFormValid: isFormValid ?? this.isFormValid,
    isEnabled: isEnabled ?? this.isEnabled,
    product: product ?? this.product,
    listProduct: listProduct ?? this.listProduct,
    listProductRepository: listProductRepository ?? this.listProductRepository,
    listProductShoopingCart: listProductShoopingCart ?? this.listProductShoopingCart,
    isCreate: isCreate ?? this.isCreate,
    titleQuery: titleQuery ?? this.titleQuery,
    quantity: quantity ?? this.quantity,
    total: total ?? this.total
  );
  
  @override
  List<Object?> get props => [formStatus, isFormValid, isEnabled, product, listProduct, listProductRepository,
                              listProductShoopingCart, isCreate, titleQuery, quantity, total];
}


