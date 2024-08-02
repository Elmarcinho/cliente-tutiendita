import 'dart:convert';


ClientModel clientModelFromJson(String str) => ClientModel.fromJson(json.decode(str));

String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
    String id;
    String name;
    String email;
    String cellphone;
    String? token;

    ClientModel({
      this.id='',
      this.name='',
      this.email='',
      this.cellphone='',
      this.token='',

    });

    factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id      : json["id"],
        name    : json["name"],
        email   : json["email"],
        cellphone : json["cellphone"],
        token   : json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id"           : id,
        "name"         : name,
        "email"        : email,
        "cellphone"    : cellphone,
        "token"        : token
    };
}