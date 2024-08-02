import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(const LoginState()) {

    on<CellphoneEvent>( _cellphoneEvent );
    on<OnSumitEvent>( _onSubmit );
    on<CountryCodeEvent>( _countryCodeEvent );
    on<SignInWithGoogleEvent>( _signInWithGoogleEvent );


  }

  void _countryCodeEvent( CountryCodeEvent event, Emitter emit){

    final countryCode = event.countryCode;

    emit(
      state.copyWith(
        countryCode: countryCode,
    ));
  }


  void _cellphoneEvent( CellphoneEvent event, Emitter emit){

    final cellphone = event.cellphone;

    emit(
      state.copyWith(
        cellphone: cellphone,
    ));
  }
  

  void _signInWithGoogleEvent( SignInWithGoogleEvent event, Emitter emit){

    final token = event.token;
    final name = event.name;
    final email = event.email;

    emit(
      state.copyWith(
        name: name,
        email: email,
        token: token
    ));
  }


  void _onSubmit( OnSumitEvent event, Emitter emit){

    emit(
      state.copyWith(
        cellphone: state.cellphone,
        
    ));

  }






}
