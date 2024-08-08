import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cliente_tutiendita/Model/product_model.dart';
import 'package:cliente_tutiendita/Presentation/Bloc/product_bloc.dart';



class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final query = TextEditingController();

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              height: 55,
              width: 340,
              child: TextField(
                controller: query,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  hintText: 'Buscar',
                  hintStyle: const TextStyle( fontWeight: FontWeight.normal),
                  prefixIcon: IconButton(
                    onPressed: (){
                      context.read<ProductBloc>().add(OnSearchProduct(query.text.toLowerCase()));
                    }, 
                    icon: const Icon(Icons.search_outlined)
                  ),
                  suffixIcon: FadeIn(
                    animate: false,
                    child: IconButton(
                      onPressed: (){
                        
                      }, 
                      icon: const Icon(Icons.clear_outlined)
                    ),
                  ),
                ),
                onChanged: (value) {
                  
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 2,
                ),
                itemCount: state.listProductRepository.length,
                itemBuilder: (contex, i) =>
                    _crearItem(context, state.listProductRepository[i]),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductModel producto) {
    
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
                    child: (producto.image.isEmpty)
                        ? Image.asset('assets/no-image.jpg')
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: FadeInImage(
                              placeholder:
                                  const AssetImage('assets/jar-loading.gif'),
                              height: 100.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              image: NetworkImage(producto.image),
                            )
                        ),
                  ),
        
                  const SizedBox(height: 8),
                  
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Bs. ${producto.price}',
                      style: const TextStyle( fontSize: 15, fontWeight: FontWeight.bold)
                    )
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      '${producto.title[0].toUpperCase()}${producto.title.substring(1)}',
                      style: const TextStyle(fontSize: 12)
                    )
                  ),
                  SizedBox(
                    width: double.infinity, 
                    child: Text(producto.description1,
                      style: const TextStyle(fontSize: 12)
                    )
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity, 
                      child: Text(producto.description2,
                        style: const TextStyle(fontSize: 12)
                      )
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              context.read<ProductBloc>().add(ProductoEvent(producto));
              Navigator.pushNamed(context, 'product');
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
                backgroundColor: Colors.transparent,
                shape: const CircleBorder(),
              padding: const EdgeInsets.all(2),          
              ),
              child: const Icon(Icons.add, color: Color.fromARGB(255, 74, 224, 79)),
              onPressed: (){},
            ),
          ),
        ),
      ],
    );
    
  }
}
