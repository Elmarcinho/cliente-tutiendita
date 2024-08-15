import 'package:cliente_tutiendita/Presentation/Bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShoopingCartScreen extends StatelessWidget {
  const ShoopingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: const Text('Items añadidos')
            ),
            Expanded(
              child: ListView.separated(
                itemCount: state.listProductShoopingCart.length + 1,
                separatorBuilder: (context, index) => const Divider( height: 1),
                itemBuilder: (context, index) {
                  
                  return (index < state.listProductShoopingCart.length)
                    ?Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: (state.listProductShoopingCart[index].image.isEmpty)
                                ? Image.asset('assets/no-image.jpg')
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: FadeInImage(
                                      placeholder:
                                          const AssetImage('assets/jar-loading.gif'),
                                      height: 100.0,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      image: NetworkImage(state.listProductShoopingCart[index].image),
                                    )
                                ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(state.listProductShoopingCart[index].title, style: const TextStyle(fontSize: 11)),
                                Text(state.listProductShoopingCart[index].description1, style: const TextStyle(fontSize: 11)),
                                Text(state.listProductShoopingCart[index].description2, style: const TextStyle(fontSize: 11)),
                                Text('Bs ${state.listProductShoopingCart[index].price.toString()}', 
                                  style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic)
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                            width: 60,
                            child: TextFormField(
                              initialValue: state.listProductShoopingCart[index].quantity.toString(),
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              style: const TextStyle( fontSize: 16),
                              keyboardType:  const TextInputType.numberWithOptions(signed: true),
                              decoration:   InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide( color: Colors.green)
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
                
                          Text('Bs ${state.listProductShoopingCart[index].price.toString()}', style: const TextStyle(fontSize: 11)),
                
                          IconButton(
                            onPressed: (){}, 
                            icon: const Icon(Icons.delete_forever, color: Colors.red)
                          )
                        ],
                      )
                    )
                    : Container(
                      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Total Parcial', style: TextStyle( fontSize: 16, fontWeight: FontWeight.w700)),
                            Text('750.58', style: TextStyle( fontSize: 16, fontWeight: FontWeight.w700))
                          ],
                        ),
                      );
                  
                },
              ),
            ),
        
            Container(
              height: 90,
              color: Colors.black12,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 35,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Total', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('750.58', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      side: const BorderSide( color: Colors.black12), 
                      borderRadius: BorderRadius.circular(8)
                    ), 
                    child: const Text('Realizar pedido'),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
