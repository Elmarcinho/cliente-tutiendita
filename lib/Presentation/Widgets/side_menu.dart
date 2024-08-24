import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cliente_tutiendita/Presentation/Bloc/login_bloc.dart';
import '../../Provider/provider.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = AuthProvider();
    //final size = MediaQuery.of(context).size;

    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(  
              shrinkWrap: true,
              padding: EdgeInsets.zero, 
              children:<Widget>[
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(  
                    image: DecorationImage(
                      image: AssetImage('assets/tutiendita.png'),
                      fit: BoxFit.fitWidth
                    )
                  ),
                  accountName: Text(''),
                  accountEmail:Text(''),
                ),
                ListTile(
                  leading: const Icon(Icons.person_outline_outlined, color:Colors.brown),
                  title: const Text('Mi Cuenta'),
                  onTap: (){},
                ),
                ListTile(
                  leading: const Icon(Icons.power_settings_new, color:Colors.brown),
                  title: const Text('Cerrar Session'),
                  onTap: (){
                    authProvider.logout();
                    context.read<LoginBloc>().add(ResetLoginEvent());
                    Navigator.pushReplacementNamed(context, 'login');  
                  },
                ),
                //SizedBox( height: size.height * 0.5),
              ]
            ),
          )
        ],
      ),
    );
  }
}