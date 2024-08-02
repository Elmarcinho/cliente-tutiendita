import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());


class ProductoModel {
    
  String id;
  String title;
  String description;
  double price;
  int stock;
  String image;
  bool state;
  String idCategory;
  String titleCategory;

  ProductoModel({
      this.id ='',
      this.title ='',
      this.description ='',
      this.price = 0.0,
      this.stock = 0,
      this.image = '',
      this.state = false,
      this.idCategory = '',
      this.titleCategory = ''
  });


  factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
      id          : json["id"],
      title       : json["title"],
      description : json["description"],
      price       : json["price"].toDouble(),
      stock       : json["stock"].toInt(),
      image       : json["image"],
      state       : json["state"],
      idCategory  : json["idCategory"],
      titleCategory: json["titleCategory"]
  );

  Map<String, dynamic> toJson() => {
      "id"           : id,
      "title"        : title,
      "description"  : description,
      "price"        : price,
      "stock"        : stock,
      "image"        : image,
      "state"        : state,
      "idCategory"   : idCategory,
      "titleCategory": titleCategory
  };
}