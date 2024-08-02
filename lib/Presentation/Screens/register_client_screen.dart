
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:cliente_tutiendita/Presentation/Bloc/login_bloc.dart';
import 'package:cliente_tutiendita/Provider/provider.dart';
import 'package:cliente_tutiendita/Services/services.dart';

import '../Widgets/widgets.dart';



class RegisterCliente extends StatelessWidget {
  const RegisterCliente({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = AuthProvider();
    final prefUser = UserPreferencia();
    FlutterNativeSplash.remove();


    return Scaffold(
      appBar: AppBar(
        title: Text('Ingresa con tu número de celular', style: GoogleFonts.lato(fontSize: 18)),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Column(
              children: [
                const Divider( thickness: 2, color: Colors.black45),
                const SizedBox(height: 30),
      
                Center(
                  child: Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2.0),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        CountryCodePicker(
                          onChanged: (code){ 
                            context.read<LoginBloc>().add(CountryCodeEvent(code.dialCode!));
                          },
                          initialSelection: 'BO',
                          favorite: const ['+591','BO'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                          textStyle: const TextStyle( fontSize: 18, color: Colors.black54),
                          onInit: (code) {
                            context.read<LoginBloc>().add(CountryCodeEvent(code!.dialCode!.isEmpty?'+591': code.dialCode!));
                          },
                        ),
                  
                        Expanded(
                          child: TextField(
                            style: const TextStyle( fontSize: 20),
                            autofocus: true,
                            keyboardType: const TextInputType.numberWithOptions(signed: true),
                            decoration:  const InputDecoration(
                              hintText: 'Escribe tu número',
                              hintStyle: TextStyle( fontWeight: FontWeight.normal),
                              border: InputBorder.none,
                              isDense: true,
                            ),
                            onChanged: (value) {
                              context.read<LoginBloc>().add(CellphoneEvent(value));
                            },
                            
                          ),
                        ),
      
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
      
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                    onPressed: () async{
                      
                      context.read<LoginBloc>().add(OnSumitEvent());
      
                      if((state.countryCode == '+591' && state.cellphone.length == 8) || state.countryCode != '+591'){

                        progresIndicator(context);
                        await authProvider.insertClient(state.name, state.email, state.countryCode+state.cellphone)
                              .then((response) => {

                                if ( response == 'ok'){
                                  
                                  prefUser.token = state.token,
                                  prefUser.nombreUsuario = state.name,
                                  prefUser.email = state.email,
                                  prefUser.cellphone = state.countryCode+state.cellphone,
                                  Navigator.pushReplacementNamed(context, 'home')

                                }else{
                                  NotificationService.showSnackbarError(response),
                                  Navigator.of(context).pop()
                                }
                              });

         
                      }else{
                        NotificationService.showSnackbarError('Número no válido');
                      }

                    }, 
                    child: const Text('Guardar', style: TextStyle( fontSize: 16))
                  ),
                )
              ],
            );
        },
      ),
    );
  }
}