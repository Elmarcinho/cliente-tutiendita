import 'package:flutter/material.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    //final prefs = UserPreferencia();
    //final authProvider = AuthProvider();

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
                    // context.read<LoginBloc>().add(ResetLogin());
                    // authProvider.logout();
                    // prefs.token='';
                    // Navigator.pushReplacementNamed(context, 'login');  
                  },
                ),
                SizedBox( height: size.height * 0.5),
              ]
            ),
          )
        ],
      ),
    );
  }
}