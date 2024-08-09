part of 'product_bloc.dart';

class ProductState extends Equatable {

  final bool formStatus;
  final bool isFormValid;
  final bool isEnabled;
  final ProductModel? product;
  final List<ProductModel> listProduct;
  final bool isCreate;
  final TitleQuery titleQuery;
  final List<CategoryModel> listCategory;
  final List<CategoryModel> listCategoryFiltro;
  final List<String> selectCategory;
  final List<ProductModel> listProductRepository;

  const ProductState({
    this.formStatus = false,
    this.isFormValid = false,
    this.isEnabled = false,
    this.product,
    this.listProduct= const [],
    this.isCreate = false,
    this.titleQuery = const TitleQuery.dirty(''),
    this.listCategory = const[],
    this.listCategoryFiltro = const[],
    this.selectCategory = const [],
    this.listProductRepository= const []
  });

  ProductState copyWith({
    bool? formStatus,
    bool? isFormValid,
    bool? isEnabled,
    ProductModel?  product,
    List<ProductModel>? listProduct,
    bool? isCreate,
    TitleQuery? titleQuery,
    List<CategoryModel>? listCategory,
    List<CategoryModel>? listCategoryFiltro,
    List<String>? selectCategory,
    List<ProductModel>? listProductRepository

  }) => ProductState(
    formStatus: formStatus ?? this.formStatus,
    isFormValid: isFormValid ?? this.isFormValid,
    isEnabled: isEnabled ?? this.isEnabled,
    product: product ?? this.product,
    listProduct: listProduct ?? this.listProduct,
    isCreate: isCreate ?? this.isCreate,
    titleQuery: titleQuery ?? this.titleQuery,
    listCategory: listCategory ?? this.listCategory,
    listCategoryFiltro: listCategoryFiltro ?? this.listCategoryFiltro,
    selectCategory: selectCategory ?? this.selectCategory,
    listProductRepository: listProductRepository ?? this.listProductRepository

  );
  
  @override
  List<Object?> get props => [formStatus, isFormValid, isEnabled, product, listProduct, isCreate, titleQuery, 
    listCategory,listCategoryFiltro, selectCategory, listProductRepository];
}


