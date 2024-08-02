import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cliente_tutiendita/Model/product_model.dart';



class ProductProvider{

  final _firestore = FirebaseFirestore.instance;


  Future<List<ProductoModel>> getProductos() async{

    return await _firestore.collection('product')
      .where('state', isEqualTo: true)
      .get()
      .then((value) => value.docs
      .map((e) => ProductoModel
      .fromJson(e.data())).toList());

  }


  Future<List<ProductoModel>> buscarProducto(String query) async{
    
    if(query.isEmpty) return [];
    
    return await _firestore.collection('product') 
      .where('title', isGreaterThanOrEqualTo: query) 
      .where('title', isLessThanOrEqualTo:'${query}z')  
      .get().then((value) => value.docs.map((e) => ProductoModel.fromJson(e.data())).toList());

  }



}