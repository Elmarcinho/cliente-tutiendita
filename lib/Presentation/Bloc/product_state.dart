part of 'product_bloc.dart';

class ProductState extends Equatable {

  final bool isEnabled;
  final List<ProductModel> listProduct;
  final List<ProductModel> listProductRepository;
  final List<ProductModel> listProductShoopingCart;
  final List<ProductModel> listCategoryProducts;
  final List<ProductModel> listCategoryProductsRepository;
  final bool isCreate;
  final String titleQuery;
  final String titleQuery2;
  final int quantity;
  final double total;
  final int selectIndex;
  final List screens;
  final bool screenCategoryProduct;

  const ProductState({
    this.isEnabled = false,
    this.listProduct= const [],
    this.listProductRepository = const [],
    this.listProductShoopingCart = const [],
    this.listCategoryProducts = const [],
    this.listCategoryProductsRepository = const [],
    this.isCreate = false,
    this.titleQuery = '',
    this.titleQuery2 = '',
    this.quantity = 0,
    this.total = 0.0,
    this.selectIndex = 1,
    this.screens = const [
      SearchProductScreen(),
      ProductListSreen(),
      ShoopingCartScreen()
    ],
    this.screenCategoryProduct = false
  });

  ProductState copyWith({
    bool? autoFocus,
    bool? isEnabled,
    ProductModel?  product,
    List<ProductModel>? listProduct,
    List<ProductModel>? listProductRepository,
    List<ProductModel>? listProductShoopingCart,
    List<ProductModel>? listCategoryProducts,
    List<ProductModel>? listCategoryProductsRepository,
    bool? isCreate,
    String? titleQuery,
    String? titleQuery2,
    int? quantity,
    double? total,
    int? selectIndex,
    List? screens,
    bool? screenCategoryProduct

  }) => ProductState(
    isEnabled: isEnabled ?? this.isEnabled,
    listProduct: listProduct ?? this.listProduct,
    listProductRepository: listProductRepository ?? this.listProductRepository,
    listProductShoopingCart: listProductShoopingCart ?? this.listProductShoopingCart,
    listCategoryProducts: listCategoryProducts ?? this.listCategoryProducts,
    listCategoryProductsRepository: listCategoryProductsRepository ?? this.listCategoryProductsRepository,
    isCreate: isCreate ?? this.isCreate,
    titleQuery: titleQuery ?? this.titleQuery,
    titleQuery2: titleQuery2 ?? this.titleQuery2,
    quantity: quantity ?? this.quantity,
    total: total ?? this.total,
    selectIndex: selectIndex ?? this.selectIndex,
    screens: screens ?? this.screens,
    screenCategoryProduct: screenCategoryProduct ?? this.screenCategoryProduct
  );
  
  @override
  List<Object> get props => [isEnabled, listProduct, listProductRepository,listProductShoopingCart, listCategoryProducts,
                    listCategoryProductsRepository, isCreate, titleQuery, titleQuery2, quantity, total, selectIndex, screens,
                    screenCategoryProduct];
}


