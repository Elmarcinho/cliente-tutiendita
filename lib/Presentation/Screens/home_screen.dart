import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:cliente_tutiendita/Presentation/Bloc/product_bloc.dart';
import 'package:cliente_tutiendita/Presentation/Widgets/widgets.dart';
import 'package:cliente_tutiendita/Services/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Scaffold(
          drawer: const SideMenu(),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.brown,
            title: state.selectIndex == 1
            ?Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Image.asset('assets/tutiendita.png', scale: 4)
            )
            :(state.selectIndex == 0
             ? const Text('Búsqueda', style: TextStyle( color: Colors.white))
             : const Text('Mi carrito',  style: TextStyle( color: Colors.white))
             ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Color.fromARGB(255, 61, 213, 66),
                  size: 40,
                ),
                onPressed: () {
                  WhatsAppService.launchWhatsAppString('');
                },
              )
            ],
          ),
          bottomNavigationBar: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return CurvedNavigationBar(
                height: 60,
                backgroundColor: Colors.brown,
                index: state.selectIndex,
                items: [
                  const Icon(Icons.search, size: 30),
                  const Icon(Icons.home, size: 30),
                  badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -14, end: -10),
                      showBadge: state.quantity != 0 ? true : false,
                      badgeAnimation: const badges.BadgeAnimation.slide(),
                      badgeContent: Text(
                        state.quantity.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      child:
                          const Icon(Icons.shopping_cart_outlined, size: 30)),
                ],
                onTap: (index) => context.read<ProductBloc>().add(OnSelectNavigationBar(index))
              );
            },
          ),
          body: state.screens[state.selectIndex],
        );
      },
    );
  }
}
