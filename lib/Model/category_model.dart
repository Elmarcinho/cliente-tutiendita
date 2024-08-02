import 'dart:convert';

CategoryModel productoModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String productoModelToJson(CategoryModel data) => json.encode(data.toJson());


class CategoryModel {
    
  String id;
  String title;
  String image;
  bool state;

  CategoryModel({
      this.id ='',
      this.title = '',
      this.image = '',
      this.state = false,
  });


  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
      id          : json["id"],
      title       : json["title"],
      image       : json["image"],
      state       : json["state"],
  );

  Map<String, dynamic> toJson() => {
      "id"           : id,
      "title"        : title,
      "image"        : image,
      "state"        : state,
  };
}