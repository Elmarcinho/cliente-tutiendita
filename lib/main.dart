import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cliente_tutiendita/firebase_options.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


import 'package:cliente_tutiendita/config/app_theme.dart';
import 'package:cliente_tutiendita/Services/user_preferencia_service.dart';
import 'package:cliente_tutiendita/Presentation/Screens/screen.dart';
import 'package:cliente_tutiendita/Presentation/Bloc/category_bloc.dart';
import 'package:cliente_tutiendita/Presentation/Bloc/product_bloc.dart';
import 'package:cliente_tutiendita/Provider/product_provider.dart';
import 'package:cliente_tutiendita/Provider/category_provider.dart';

import 'Presentation/Bloc/login_bloc.dart';
import 'Services/notification_service.dart';

void main() async{

  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferencia.initPrefs();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});
   final prefs = UserPreferencia();
   final productProvider = ProductProvider();
   final categoryProvider = CategoryProvider();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => CategoryBloc(categoryProvider)..add(const GetCategorysEvent())),
        BlocProvider(create: (context) => ProductBloc(productProvider, categoryProvider)..add(const GetProductsEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme( selectedColor: 1).getTheme(),
        title: 'Admin Tienda',
        initialRoute: prefs.token.isEmpty? 'login':( prefs.cellphone.isEmpty?'registerClient':'home'),
        scaffoldMessengerKey: NotificationService.mesengerKey,
        routes: {
          'login'          : ( context ) => const LoginScreen(),
          'home'           : ( context ) => const HomeScreen(),
          'registerClient' : ( context ) => const RegisterCliente(),
          'product'        : ( context ) => const ProductScreen(),
          'productlist'    : ( context ) => const ProductListSreen(),
          'categoryProducts':( context ) => const CategoryProducts()
        },
        supportedLocales: const [Locale("es")],
        localizationsDelegates: const [
          CountryLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
      )
    );
  }


}




