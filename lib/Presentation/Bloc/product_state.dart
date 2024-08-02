part of 'product_bloc.dart';

class ProductState extends Equatable {

  final bool formStatus;
  final bool isFormValid;
  final bool isEnabled;
  final ProductoModel? product;
  final List<ProductoModel> listProduct;
  final bool isCreate;
  final String ultimoQuery;
  final List<CategoryModel> listCategory;
  final List<CategoryModel> listCategoryFiltro;
  final List<String> selectCategory;
  final List<ProductoModel> listRepository;

  const ProductState({
    this.formStatus = false,
    this.isFormValid = false,
    this.isEnabled = false,
    this.product,
    this.listProduct= const [],
    this.isCreate = false,
    this.ultimoQuery = '',
    this.listCategory = const[],
    this.listCategoryFiltro = const[],
    this.selectCategory = const [],
    this.listRepository= const []
  });

  ProductState copyWith({
    bool? formStatus,
    bool? isFormValid,
    bool? isEnabled,
    ProductoModel?  product,
    List<ProductoModel>? listProduct,
    bool? isCreate,
    String? ultimoQuery,
    List<CategoryModel>? listCategory,
    List<CategoryModel>? listCategoryFiltro,
    List<String>? selectCategory,
    List<ProductoModel>? listRepository

  }) => ProductState(
    formStatus: formStatus ?? this.formStatus,
    isFormValid: isFormValid ?? this.isFormValid,
    isEnabled: isEnabled ?? this.isEnabled,
    product: product ?? this.product,
    listProduct: listProduct ?? this.listProduct,
    isCreate: isCreate ?? this.isCreate,
    ultimoQuery: ultimoQuery ?? this.ultimoQuery,
    listCategory: listCategory ?? this.listCategory,
    listCategoryFiltro: listCategoryFiltro ?? this.listCategoryFiltro,
    selectCategory: selectCategory ?? this.selectCategory,
    listRepository: listRepository ?? this.listRepository

  );
  
  @override
  List<Object?> get props => [formStatus, isFormValid, isEnabled, product, listProduct, isCreate, ultimoQuery, 
    listCategory,listCategoryFiltro, selectCategory, listRepository];
}


