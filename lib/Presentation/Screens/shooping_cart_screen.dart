import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cliente_tutiendita/Presentation/Bloc/product_bloc.dart';

import '../../Services/services.dart';


class ShoopingCartScreen extends StatefulWidget {
  const ShoopingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoopingCartScreen> createState() => _ShoopingCartScreenState();
}

class _ShoopingCartScreenState extends State<ShoopingCartScreen> {

  final prefs = UserPreferencia();
  DateTime fecha = DateTime.now();
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');

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
                    ?Stack(
                      children: [
                        Container(
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
                                child: MaterialButton(
                                  onPressed: (){
                                    setState(() {
                                      state.listProductShoopingCart[index].visible = true;
                                      state.listProductShoopingCart[index].clic = true;
                                      context.read<ProductBloc>().add(OnVisibility(state.listProductShoopingCart[index]));
                                      context.read<ProductBloc>().add(AddProductShoopingCartEvent(state.listProductShoopingCart[index]));
                                    });
                                    Future.delayed(const Duration(seconds: 2), (){
                                      if (mounted){
                                        setState(() {
                                          state.listProductShoopingCart[index].visible = false;
                                          context.read<ProductBloc>().add(OnVisibility(state.listProductShoopingCart[index]));
                                        }); 
                                      }else{
                                        state.listProductShoopingCart[index].visible = false;
                                      }                  
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide( color: Colors.green), 
                                    borderRadius: BorderRadius.circular(5)
                                  ), 
                                  child: Text(
                                    state.listProductShoopingCart[index].quantity.toString(),
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                                        
                              SizedBox(
                                width: 60,
                                child: Center(
                                  child: Text(
                                    'Bs ${(state.listProductShoopingCart[index].price * state.listProductShoopingCart[index].quantity).toStringAsFixed(2)}', 
                                    style: const TextStyle(fontSize: 11)
                                  ),
                                ),
                              ),
                                        
                              IconButton(
                                icon: const Icon(Icons.delete_forever, color: Colors.red),
                                onPressed: (){
                        
                                  final dialog = AlertDialog(
                                    title: const Text('¿Esta seguro de quitar el producto del carrito?', style: TextStyle(fontSize: 16)),
                                    actions: [
                                      TextButton(
                                        child: const Text('No'),
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        }, 
                                      ),
                                      TextButton(
                                        child: const Text('Si borrar'),
                                        onPressed: (){
                                          state.listProductShoopingCart[index].visible = false;
                                          state.listProductShoopingCart[index].clic = false;
                                          context.read<ProductBloc>().add(OnVisibility(state.listProductShoopingCart[index]));
                                          context.read<ProductBloc>().add(DeleteProductShoopingCartEvent(state.listProductShoopingCart[index], index));
                                          Navigator.of(context).pop();
                                        }, 
                                      ),
                                    ],
                                  );
                        
                                  showDialog(context: context, builder: ( _ ) => dialog);
                                  
                                } 
                              ),
                              
                            ],
                          )
                        ),
                        Visibility(
                          visible: state.listProductShoopingCart[index].visible,
                          child: Positioned(
                            top: 22,
                            right: 125,
                            child: Container(
                              height: 38,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all( color: const Color.fromARGB(255, 74, 224, 79)),
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: -6,
                                    right: -9,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove_circle_outline, size: 30),
                                          color: const Color.fromARGB(255, 74, 224, 79), 
                                          onPressed: (){
                          
                                            if(state.listProductShoopingCart[index].quantity > 1 ){
                                              state.listProductShoopingCart[index].quantity--;
                                              context.read<ProductBloc>().add(OnQuantityUpdate(state.listProductShoopingCart[index]));
                                            }
                                          }
                                        ),
                                        SizedBox(
                                          width: 20,
                                          child: Center(
                                            child: Text( state.listProductShoopingCart[index].quantity.toString(), 
                                              style: const TextStyle(fontSize: 15.0)
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.add_circle_outline, size: 30),
                                          color: const Color.fromARGB(255, 74, 224, 79), 
                                          onPressed: (){

                                            state.listProductShoopingCart[index].quantity++;
                                            context.read<ProductBloc>().add(OnQuantityUpdate(state.listProductShoopingCart[index]));
                                          
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
                      ]
                    )
                    : Container(
                      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Total Parcial', style: TextStyle( fontSize: 16, fontWeight: FontWeight.w700)),
                            Text(state.total.toStringAsFixed(2), style: const TextStyle( fontSize: 16, fontWeight: FontWeight.w700))
                          ],
                        ),
                      );
                  
                },
              ),
            ),
        
            Container(
              height: 90,
              color: Colors.black12,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 35,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Total', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox( width: 50),
                    Text(state.total.toStringAsFixed(2), style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    MaterialButton(
                      onPressed: (){
                        String pedido = '';
                        pedido = '🛒${pedido}Pedido: 1 \n';
                        pedido = '${pedido}Fecha: ${dateFormat.format(fecha)} \n';
                        pedido = '${pedido}Cliente: ${prefs.nombreUsuario} \n';

                        for( int i = 0; i < state.listProductShoopingCart.length; i++){
                          pedido = '$pedido'
                          '\n*${state.listProductShoopingCart[i].title} ${state.listProductShoopingCart[i].description1}* ${state.listProductShoopingCart[i].description2}'
                          '\nCantidad: *${state.listProductShoopingCart[i].quantity}*'
                          '\nPrecio: ${state.listProductShoopingCart[i].price}'
                          '\n___________________________';
                        }
                        pedido = '$pedido\n';
                        pedido = '$pedido\n*TOTAL: ${state.total.toStringAsFixed(2)}*';

                        WhatsAppService.launchWhatsAppString(pedido);
                      },
                      shape: RoundedRectangleBorder(
                        side: const BorderSide( color: Colors.green), 
                        borderRadius: BorderRadius.circular(8)
                      ), 
                      child: const Text('Enviar Compra'),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
