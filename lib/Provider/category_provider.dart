import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cliente_tutiendita/Model/category_model.dart';



class CategoryProvider{

  final _firestore = FirebaseFirestore.instance;
 

  Future<List<CategoryModel>> getCategorias() async{

  return await _firestore.collection('category')
    .where('state', isEqualTo: true)
    .get()
    .then((value) => value.docs
    .map((e) => CategoryModel
    .fromJson(e.data())).toList());

  }


}