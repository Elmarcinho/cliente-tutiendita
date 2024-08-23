part of 'product_bloc.dart';

class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}


class GetProductsEvent extends ProductEvent{ 
  const GetProductsEvent();
}

class GetCategoryProductsEvent extends ProductEvent{ 
  final CategoryModel category;
  const GetCategoryProductsEvent(this.category);
}

class OnSearchProduct extends ProductEvent{
  final String query;
  const OnSearchProduct(this.query);
}

class OnSearchProductCategory extends ProductEvent{
  final String query;
  const OnSearchProductCategory(this.query);
}

class OnSelectNavigationBar extends ProductEvent{
  final int index;
  const OnSelectNavigationBar(this.index);
}

class AddProductShoopingCartEvent extends ProductEvent{
  final ProductModel product;
  const AddProductShoopingCartEvent(this.product);
}

class OnQuantityUpdate extends ProductEvent{
  final ProductModel product;
  const OnQuantityUpdate(this.product);
}

class OnVisibility extends ProductEvent{
  final ProductModel product;
  const OnVisibility(this.product);
}

class DeleteProductShoopingCartEvent extends ProductEvent{
  final ProductModel product;
  const DeleteProductShoopingCartEvent(this.product);
}

class OnTitleQuery extends ProductEvent{
  final String titleQuery;
  const OnTitleQuery(this.titleQuery);
}

class OnTitleQuery2 extends ProductEvent{
  final String titleQuery2;
  const OnTitleQuery2(this.titleQuery2);
}

class OnScreenCategoryProduct extends ProductEvent{
  final bool semaforo;
  const OnScreenCategoryProduct(this.semaforo);
  
}

class OnResetShoopingCart extends ProductEvent{ }
class OnResetQuery extends ProductEvent{ }
class OnResetQuery2 extends ProductEvent{ }

class OnUltimoQuery extends ProductEvent{
  final String ultimoQuery;
  const OnUltimoQuery(this.ultimoQuery);
}



