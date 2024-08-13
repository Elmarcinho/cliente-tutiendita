import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cliente_tutiendita/Presentation/Bloc/shooping_cart_bloc.dart';


class ShoopingCartScreen extends StatelessWidget {
  const ShoopingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final quantityController = TextEditingController( text: '1');
    

    return BlocBuilder<ShoopingCartBloc, ShoopingCartState>(
      builder: (context, state) {

        return Column(
          children: [

            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: state.listProduct.length,
                separatorBuilder: (context, index) => const Divider( height: 1),
                itemBuilder: (context, index) {
              
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: (state.listProduct[index].image.isEmpty)
                              ? Image.asset('assets/no-image.jpg')
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: FadeInImage(
                                    placeholder:
                                        const AssetImage('assets/jar-loading.gif'),
                                    height: 100.0,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(state.listProduct[index].image),
                                  )
                              ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Column(
                            children: [
                              Text(state.listProduct[index].title, style: const TextStyle(fontSize: 11)),
                              Text(state.listProduct[index].description1, style: const TextStyle(fontSize: 11)),
                              Text(state.listProduct[index].description2, style: const TextStyle(fontSize: 11)),
                              Text(state.listProduct[index].price.toString(), style: const TextStyle(fontSize: 11)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          width: 60,
                          child: TextField(
                            controller: quantityController,
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.top,
                            style: const TextStyle( fontSize: 16),
                            keyboardType:  const TextInputType.numberWithOptions(signed: true),
                            decoration:   InputDecoration(
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
              
                        Text('Bs ${state.listProduct[index].price.toString()}', style: const TextStyle(fontSize: 11)),
              
                        IconButton(
                          onPressed: (){}, 
                          icon: const Icon(Icons.delete_forever, color: Colors.red,)
                        )
                      ],
                    )
                    
                  );
              
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
