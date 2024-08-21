part of 'product_bloc.dart';

class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}


class GetProductsEvent extends ProductEvent{ 
  const GetProductsEvent();
}

class OnSearchProduct extends ProductEvent{
  final String query;
  const OnSearchProduct(this.query);
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
  final int index;
  const DeleteProductShoopingCartEvent(this.product, this.index);
}

class OnResetQuery extends ProductEvent{ }

class OnTitleQuery extends ProductEvent{
  final String titleQuery;
  const OnTitleQuery(this.titleQuery);
}

class OnUltimoQuery extends ProductEvent{
  final String ultimoQuery;
  const OnUltimoQuery(this.ultimoQuery);
}



