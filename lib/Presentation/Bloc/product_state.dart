part of 'product_bloc.dart';

class ProductState extends Equatable {

  final bool isEnabled;
  final List<ProductModel> listProduct;
  final List<ProductModel> listProductRepository;
  final List<ProductModel> listProductShoopingCart;
  final bool isCreate;
  final String titleQuery;
  final int quantity;
  final double total;
  final int selectIndex;
  final List screens;

  const ProductState({
    this.isEnabled = false,
    this.listProduct= const [],
    this.listProductRepository= const [],
    this.listProductShoopingCart= const [],
    this.isCreate = false,
    this.titleQuery = '',
    this.quantity = 0,
    this.total = 0.0,
    this.selectIndex = 1,
    this.screens = const [
      SearchProductScreen(),
      ProductListSreen(),
      ShoopingCartScreen()
    ]
  });

  ProductState copyWith({
    bool? autoFocus,
    bool? isEnabled,
    ProductModel?  product,
    List<ProductModel>? listProduct,
    List<ProductModel>? listProductRepository,
    List<ProductModel>? listProductShoopingCart,
    bool? isCreate,
    String? titleQuery,
    int? quantity,
    double? total,
    int? selectIndex,
    List? screens

  }) => ProductState(
    isEnabled: isEnabled ?? this.isEnabled,
    listProduct: listProduct ?? this.listProduct,
    listProductRepository: listProductRepository ?? this.listProductRepository,
    listProductShoopingCart: listProductShoopingCart ?? this.listProductShoopingCart,
    isCreate: isCreate ?? this.isCreate,
    titleQuery: titleQuery ?? this.titleQuery,
    quantity: quantity ?? this.quantity,
    total: total ?? this.total,
    selectIndex: selectIndex ?? this.selectIndex,
    screens: screens ?? this.screens
  );
  
  @override
  List<Object> get props => [isEnabled, listProduct, listProductRepository,
                              listProductShoopingCart, isCreate, titleQuery, quantity, 
                              total, selectIndex, screens];
}


