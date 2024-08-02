import 'package:flutter/material.dart';





class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {

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
                      image: AssetImage('assets/tutiendida.png'),
                      fit: BoxFit.cover
                    )
                  ),
                  //accountName: Text(prefs.nombreUsuario.toUpperCase(), style: const TextStyle(color: Colors.brown)),
                  //accountEmail: Text(prefs.rol, style: const TextStyle(color: Colors.brown)),
                  accountName: Text('data'),
                  accountEmail: Text('data'),
                  currentAccountPicture: CircleAvatar(  
                    backgroundColor: Colors.white,  
                    // child: Text(prefs.nombreUsuario[0].toUpperCase(),
                    //   style: TextStyle(fontSize:45.0, color: Theme.of(context).primaryColor)
                    // ),
                    child: Text('data'),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.category_outlined , color:Colors.brown),
                  title: const Text('Categorias'),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'categorylist');
                  }
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
              ]
            ),
          )
        ],
      ),
    );
  }
}