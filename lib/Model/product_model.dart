import 'dart:convert';

ProductModel productoModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productoModelToJson(ProductModel data) => json.encode(data.toJson());


class ProductModel {
    
  String id;
  String title;
  String description1;
  String description2;
  double price;
  int stock;
  String image;
  bool state;
  int quantity;
  String idCategory;
  String titleCategory;
  bool visible;
  bool clic;

  ProductModel({
    this.id ='',
    this.title ='',
    this.description1 ='',
    this.description2 ='',
    this.price = 0.0,
    this.stock = 0,
    this.image = '',
    this.state = false,
    this.idCategory = '',
    this.quantity = 0,
    this.titleCategory = '',
    this.visible = false,
    this.clic = false
  });


  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id          : json["id"],
    title       : json["title"],
    description1 : json["description1"],
    description2 : json["description2"],
    price       : json["price"].toDouble(),
    stock       : json["stock"].toInt(),
    image       : json["image"],
    state       : json["state"],
    quantity    : 0,
    idCategory  : json["idCategory"],
    titleCategory: json["titleCategory"],
    visible     : false,
    clic        : false
  );

  Map<String, dynamic> toJson() => {
    "id"           : id,
    "title"        : title,
    "description1" : description1,
    "description2" : description2,
    "price"        : price,
    "stock"        : stock,
    "image"        : image,
    "state"        : state,
    "quantity"     : 0,
    "idCategory"   : idCategory,
    "titleCategory": titleCategory,
    "visible"      : false,
    "clic"         : false
  };
}