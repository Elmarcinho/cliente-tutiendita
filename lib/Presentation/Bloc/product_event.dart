part of 'product_bloc.dart';

class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

//*Eventos para obtener data
class GetProductsEvent extends ProductEvent{ 
  const GetProductsEvent();
}

class ProductoEvent extends ProductEvent{ 
  final ProductModel product;
  const ProductoEvent(this.product);
}

class OnSearchProduct extends ProductEvent{
  final String query;
  const OnSearchProduct(this.query);
}

//*Eventos del formulario Producto
class OnTitleQuery extends ProductEvent{
  final String titleQuery;
  const OnTitleQuery(this.titleQuery);
}

//*Evento

class OnUltimoQuery extends ProductEvent{
  final String ultimoQuery;
  const OnUltimoQuery(this.ultimoQuery);
}

class OnResetQuery extends ProductEvent{ }

