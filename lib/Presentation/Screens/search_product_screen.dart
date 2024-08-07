import 'package:cliente_tutiendita/Model/product_model.dart';
import 'package:cliente_tutiendita/Presentation/Widgets/widgets.dart';
import 'package:cliente_tutiendita/Provider/product_provider.dart';
import 'package:flutter/material.dart';


class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final productProvider = ProductProvider();

    return Center( 
      child: IconButton(
                icon: const Icon(Icons.search_rounded),
                onPressed: () {
                  showSearch<ProductModel?>(
                    query: 'galleta',
                    context: context,
                    delegate: SearchProductDelegate(
                      initialProduct: [],
                      searchProduct:(query){
                        //context.read<ProductBloc>().add(OnUltimoQuery(query));
                        return  productProvider.buscarProducto(query.toLowerCase());
                      }
                    )
                  );
                },
              )
    );
  }
}