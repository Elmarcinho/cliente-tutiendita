import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cliente_tutiendita/Presentation/Widgets/widgets.dart';
import 'package:cliente_tutiendita/Model/product_model.dart';
import 'package:cliente_tutiendita/Presentation/Bloc/product_bloc.dart';



class ProductListSreen extends StatefulWidget {
  const ProductListSreen({super.key});

  @override
  State<ProductListSreen> createState() => _ProductListSreenState();
}

class _ProductListSreenState extends State<ProductListSreen> {


  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {

        if (state.listProduct.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            CategoryHorizontalListview( title: 'Categorias', titleStyle: titleStyle,),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child:  Text('Productos', style: titleStyle)
            ),

            const SizedBox( height: 12),

            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 2,
                ),
                itemCount: state.listProduct.length,
                itemBuilder: (contex, i) =>
                  _crearItem(context, state.listProduct[i]),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductModel product) {
    
    return Stack(
      children: [
        Card(
          elevation: 0,
          color: Colors.transparent,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
        
                  SizedBox(
                    height: 80.0,
                    width: double.infinity,
                    child: (product.image.isEmpty)
                        ? Image.asset('assets/no-image.jpg')
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: FadeInImage(
                              placeholder:
                                  const AssetImage('assets/jar-loading.gif'),
                              height: 100.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              image: NetworkImage(product.image),
                            )
                        ),
                  ),
        
                  const SizedBox(height: 8),
                  
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Bs. ${product.price}',
                      style: const TextStyle( fontSize: 15, fontWeight: FontWeight.bold)
                    )
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      '${product.title[0].toUpperCase()}${product.title.substring(1)}',
                      style: const TextStyle(fontSize: 12)
                    )
                  ),
                  SizedBox(
                    width: double.infinity, 
                    child: Text(product.description1,
                      style: const TextStyle(fontSize: 12)
                    )
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity, 
                      child: Text(product.description2,
                        style: const TextStyle(fontSize: 12)
                      )
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'product', arguments: product);
            },
          ),
        ),

        Positioned(
          right: 7,
          child: SizedBox(
            width: 35,
            height: 35,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide( width: 2, color: Color.fromARGB(255, 74, 224, 79)),
                backgroundColor: product.clic? const Color.fromARGB(255, 74, 224, 79) :Colors.transparent,
                shape: const CircleBorder(),
              padding: const EdgeInsets.all(2),          
              ),
              child: product.clic
                ? Text(product.quantity.toString(), style: const TextStyle( color: Colors.white), ) 
                : const Icon(Icons.add, color: Color.fromARGB(255, 74, 224, 79)),
              onPressed: (){
                setState(() {
                  product.visible = true;
                  product.clic = true;
                  context.read<ProductBloc>().add(OnVisibility(product));
                  if(product.quantity == 0){
                    product.quantity++;
                    context.read<ProductBloc>().add(OnQuantityUpdate(product));
                    context.read<ProductBloc>().add(AddProductShoopingCartEvent(product));
                  }
                });
                Future.delayed(const Duration(seconds: 2), (){
                  if (mounted){
                    setState(() {
                      product.visible = false;
                      context.read<ProductBloc>().add(OnVisibility(product));
                    }); 
                  }else{
                    product.visible = false;
                  }                  
                });
              },
            ),
          ),
        ),

        Visibility(
          visible: product.visible,
          child: Positioned(
            right: 7,
            child: Container(
              height: 38,
              width: 108,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all( color: const Color.fromARGB(255, 74, 224, 79)),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -6,
                    right: -5,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline, size: 30),
                          color: const Color.fromARGB(255, 74, 224, 79), 
                          onPressed: (){
           
                            if(product.quantity > 1 ){
                              product.quantity--;
                              context.read<ProductBloc>().add(OnQuantityUpdate(product));
                            }else{
                              product.visible = false;
                              product.clic = false;
                              context.read<ProductBloc>().add(OnVisibility(product));
                              context.read<ProductBloc>().add(DeleteProductShoopingCartEvent(product));
                            }
                          }
                        ),
                        SizedBox(
                          width: 20,
                          child: Center(
                            child: Text( product.quantity.toString(), 
                              style: const TextStyle(fontSize: 15.0)
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline, size: 30),
                          color: const Color.fromARGB(255, 74, 224, 79), 
                          onPressed: (){

                            product.quantity++;
                            context.read<ProductBloc>().add(OnQuantityUpdate(product));
                          
                          }
                        ),
                      ],
                    ),
                  ),
                ],
              ),  
            ),
          ),
        ),
      ],
    );
  }
}
