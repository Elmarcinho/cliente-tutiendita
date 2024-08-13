import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:cliente_tutiendita/Presentation/Screens/screen.dart';
import 'package:cliente_tutiendita/Presentation/Bloc/product_bloc.dart';
import 'package:cliente_tutiendita/Presentation/Widgets/widgets.dart';
import 'package:cliente_tutiendita/Services/services.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int selectIndex = 1;
  String title = '';
  List screens = [
    const SearchProductScreen(),
    const ProductListSreen(),
    const ShoopingCartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    
    FlutterNativeSplash.remove();

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) { 

        return Scaffold(
          drawer: const SideMenu(),
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.green, size: 40,),
                onPressed: () {
                  WhatsAppService.launchWhatsAppString('');
                },
              )
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 60,
            backgroundColor: Colors.brown,
            index: selectIndex,
            items: [
              const Icon(
                Icons.search, size: 30
              ),
              const Icon(
                Icons.home, size: 30
              ),
              badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -14, end: -10),
                  showBadge: true,
                  badgeAnimation: const badges.BadgeAnimation.slide(),
                  badgeContent: const Text('7', style: TextStyle(color: Colors.white),),
                  child: const Icon(Icons.shopping_cart_outlined, size: 30)
                  
                ),
            ],
            onTap: (index)=> setState(() { 
              selectIndex = index ; 
              index == 0? title = 'Búsqueda' : (index ==2 ? title= 'Mi carrito' : title = '');
            }),
          ),
          body: screens[ selectIndex ],
        );
      },
    );
  }
}
