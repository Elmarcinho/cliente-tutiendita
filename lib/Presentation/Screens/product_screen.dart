import 'dart:io';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';

import 'package:cliente_tutiendita/Model/product_model.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Producto'),
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 15),
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -8, end: -4),
              badgeAnimation: const badges.BadgeAnimation.scale(),
              showBadge: true,
              badgeContent: const Text('7', style: TextStyle(color: Colors.white),),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, size: 27.0,), 
                onPressed: () {}
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          const SizedBox( height: 40),
          Center(
            child: SizedBox(
              height: size.height * 0.35,
              width: size.width * 0.75,
              child: _ImageGallery(
                image: product.image,
              ),
            ),
          ),
          const SizedBox( height: 100),
    
          _ProductoInformation(product: product,)
        ],
      )
    );
  }
}

class _ImageGallery extends StatelessWidget {
  final String image;
  const _ImageGallery({required this.image});

  @override
  Widget build(BuildContext context) {
    if (image.isEmpty) {
      return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.asset('assets/no-image.jpg', fit: BoxFit.cover));
    }

    late ImageProvider imageProvider;

    if (image.startsWith('http')) {
      imageProvider = NetworkImage(image);
    } else {
      imageProvider = FileImage(File(image));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: FadeInImage(
            fit: BoxFit.cover,
            image: imageProvider,
            placeholder: const AssetImage('assets/jar-loading.gif'),
          )),
    );
  }
}

class _ProductoInformation extends StatelessWidget {
  final ProductModel product;
   const _ProductoInformation({required this.product});

  @override
  Widget build(BuildContext context) {

    return Column(
            children: [
          
              Container(
                color: Colors.black12,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text('${product.title} ${product.description1} ${product.description2}', 
                        style: GoogleFonts.lato(
                        decoration: TextDecoration.none, 
                        fontSize: 20
                        )
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        SizedBox(
                          width: 35,
                          height: 35,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const CircleBorder(),
                            padding: const EdgeInsets.all(2),          
                            ),
                            child: const Icon(Icons.remove, color: Colors.black54),
                            onPressed: (){},
                          ),
                        ),

                        const SizedBox( width: 15),
                    
                        SizedBox(
                          height: 35,
                          width: 70,
                          child: TextField(
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.top,
                            style: const TextStyle( fontSize: 16),
                            keyboardType:  const TextInputType.numberWithOptions(signed: true),
                            decoration:   InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide( color: Colors.white)
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide( color: Colors.black)
                              ),
                              isDense: true,
                              filled: true,
                              fillColor: Colors.white
                            ),
                          ),
                        ),

                        const SizedBox( width: 15),
                    
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const CircleBorder(),
                            padding: const EdgeInsets.all(2),          
                            ),
                            child: const Icon(Icons.add, color: Colors.black54),
                            onPressed: (){},
                          ),
                        ),

                        const SizedBox( height: 45, width: 10,),
           
                      ]
                    ),
                    
                  ],
                ),
              ),
              const Divider(height: 5, color: Colors.white,),

              Container(
                color: Colors.black12,
                height: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Precio por Und', style:  TextStyle( fontWeight: FontWeight.bold)),
                        Text('Cantidad', style:  TextStyle( fontWeight: FontWeight.bold)),
                        Text('Total', style:  TextStyle( fontWeight: FontWeight.bold))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Bs. ${product.price.toString()}'),
                        const Text('0'),
                        const Text('10')
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
  }
}
