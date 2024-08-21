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
            title: Text(
              state.selectIndex == 0
              ? 'Busqueda'
              : (state.selectIndex == 2? 'Mi carrito' : '')
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.green,
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
