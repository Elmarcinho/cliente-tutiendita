import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:cliente_tutiendita/Services/services.dart';
import 'package:cliente_tutiendita/Provider/auth_provider.dart';
import 'package:cliente_tutiendita/Presentation/Bloc/login_bloc.dart';




class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = AuthProvider();
    final prefUser = UserPreferencia();
    final size = MediaQuery.of(context).size;
    FlutterNativeSplash.remove();

    return Container(
      color: Colors.white,
      child: Column(
        children: [
      
          Container(
            height: size.height * 0.5,
            width: size.width * 0.92,
            decoration:  const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Carrito.jpg'),
                fit: BoxFit.cover
              ),
            )
          ),
          const SizedBox(height: 40),

          Text('Ingresar:',
                  style: GoogleFonts.lato(
                    decoration: TextDecoration.none, 
                    color: Colors.black54, 
                    fontSize: 18, 
                    fontWeight: FontWeight.w900,
                  )
                ),
          
          const SizedBox(height: 40),

          SizedBox(
            height: 50,
            width: 300,
            child: MaterialButton(
              shape: RoundedRectangleBorder(side: const BorderSide( color: Colors.black12), borderRadius: BorderRadius.circular(8)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon( FontAwesomeIcons.google, color: Colors.red),
                  SizedBox(width: 20),
                  Text('Iniciar sesión con Google', style: TextStyle( fontSize: 18))
                ],
              ),
              onPressed: () async{ 

                await authProvider.signInWithGoogle().then((response) => {

                  if (response.user != null) {
           
                    context.read<LoginBloc>().add(SignInWithGoogleEvent(
                      response.credential!.accessToken!, response.user!.displayName, response.user!.email 
                    )),
                    authProvider.searchClientForEmail(response.user!.email!).then((client) {
                      
                      if(client.exists){   

                        final data = client.data() as Map;
                        prefUser.token = response.credential!.accessToken!;
                        prefUser.nombreUsuario = data['name'];
                        prefUser.email = data['email'];
                        prefUser.cellphone = data['cellphone'];
                        Navigator.pushReplacementNamed(context, 'home');

                      }else{

                        Navigator.pushNamed(context, 'registerClient');

                      }
                      
                    }),
        
                  }else { 
                    NotificationService.showSnackbarError('Se produjo un error al iniciar session con google'),
                    Navigator.of(context).pop()
                  }

                }); 
              },
            ),
          ),
       
          //Image.asset('assets/Carrito.jpg')
        ],
      ),
    );
  }
}