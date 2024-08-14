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
  String idCategory;
  String titleCategory;

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
    this.titleCategory = '',
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
    idCategory  : json["idCategory"],
    titleCategory: json["titleCategory"],
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
    "idCategory"   : idCategory,
    "titleCategory": titleCategory,
  };
}