part of 'product_bloc.dart';

class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}
//*Eventos buttom


//*Eventos Query
class OnUltimoQuery extends ProductEvent{
  final String ultimoQuery;
  const OnUltimoQuery(this.ultimoQuery);
}

//*Eventos para obtener data
class GetProductsEvent extends ProductEvent { 
  const GetProductsEvent();
}

class ProductoEvent extends ProductEvent { 
  final ProductModel product;
  const ProductoEvent(this.product);
}

//*Eventos del formulario Producto
