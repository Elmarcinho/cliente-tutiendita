import 'dart:io';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cliente_tutiendita/Model/product_model.dart';
import 'package:cliente_tutiendita/Presentation/Bloc/product_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    final size = MediaQuery.of(context).size;

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Scaffold(
        appBar: AppBar(
          title: const Text('Producto'),
          centerTitle: true,
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -8, end: -4),
                badgeAnimation: const badges.BadgeAnimation.scale(),
                showBadge: state.quantity != 0 ? true : false,
                badgeContent: Text(
                  state.quantity.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                      size: 27.0,
                  ),
                  onPressed: () {
                    if(state.screenCategoryProduct){
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      context.read<ProductBloc>().add(const OnSelectNavigationBar(2));
                    }else{
                      Navigator.of(context).pop();
                      context.read<ProductBloc>().add(const OnSelectNavigationBar(2));
                    }
                  }
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                height: size.height * 0.35,
                width: size.width * 0.75,
                child: _ImageGallery(
                  image: product.image,
                ),
              ),
            ),
            const SizedBox(height: 100),
            _ProductoInformation(
              product: product,
            )
          ],
        ));
      },
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
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                        '${product.title} ${product.description1} ${product.description2}',
                        style: GoogleFonts.lato(
                            decoration: TextDecoration.none, fontSize: 20)),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                        onPressed: () {
                          if (product.quantity >1) {
                            product.quantity--;
                            context.read<ProductBloc>().add(OnQuantityUpdate(product));
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      height: 35,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(child: Text(product.quantity.toString(), style: const TextStyle(fontSize: 16),))
                    ),
                    const SizedBox(width: 15),
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
                        onPressed: () {
                          if(product.quantity == 0){
                            product.clic = true;
                            context.read<ProductBloc>().add(AddProductShoopingCartEvent(product));
                          }
                          product.quantity++;
                          context.read<ProductBloc>().add(OnQuantityUpdate(product));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                      width: 10,
                    ),
                  ]),
                ],
              ),
            ),
            const Divider(
              height: 5,
              color: Colors.white,
            ),
            Container(
              color: Colors.black12,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      SizedBox(width: 20),
                      Text('Precio por Und',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 45),
                      Text('Cantidad',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 70),
                      Text('Total',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 40),
                      Text('Bs. ${product.price.toString()}'),
                      const SizedBox(width: 80),
                      Text(product.quantity.toString()),
                      const SizedBox(width: 80),
                      Text('Bs. ${(product.price * product.quantity).toStringAsFixed(2)}')
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
