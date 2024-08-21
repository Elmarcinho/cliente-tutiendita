import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cliente_tutiendita/Model/product_model.dart';
import 'package:cliente_tutiendita/Presentation/Bloc/product_bloc.dart';



class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {

  @override
  Widget build(BuildContext context) {

    final queryController = TextEditingController();

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {

        queryController.text = state.titleQuery;

        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              height: 55,
              width: 340,
              child: TextField(
                controller: queryController,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderRadius:BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.green)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  hintText: 'Buscar producto',
                  hintStyle: const TextStyle( fontWeight: FontWeight.normal),
                  prefixIcon: IconButton(
                    onPressed: (){
                      context.read<ProductBloc>().add(OnSearchProduct(state.titleQuery.toLowerCase()));
                    }, 
                    icon: const Icon(Icons.search_outlined)
                  ),
                  suffixIcon: FadeIn(
                    animate: state.titleQuery.isNotEmpty,
                    child: IconButton(
                      onPressed: (){
                        context.read<ProductBloc>().add(OnResetQuery());
                      }, 
                      icon: const Icon(Icons.clear_outlined)
                    ),
                  ),
                ),
                onChanged: (value) {
                  context.read<ProductBloc>().add(OnTitleQuery(value));
                },
                onSubmitted: ((value) =>  context.read<ProductBloc>().add(OnSearchProduct(value.toLowerCase()))),
              ),
            ),
            Expanded(
              child: state.listProductRepository.isEmpty
                ? const Center(child: Text('No encontramos resultados'))
                : GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 2,
                ),
                itemCount: state.listProductRepository.length,
                itemBuilder: (contex, i) => _crearItem(context, state.listProductRepository[i], i)
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductModel product, int index) {
    
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
              Navigator.pushNamed(context, 'product', arguments: index );
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
                              context.read<ProductBloc>().add(DeleteProductShoopingCartEvent(product, index));
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
