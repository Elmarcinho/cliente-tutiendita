part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class CountryCodeEvent extends LoginEvent{
  final String countryCode;
  const CountryCodeEvent(this.countryCode);
  
}

class CellphoneEvent extends LoginEvent{
  final String cellphone;
  const CellphoneEvent(this.cellphone);
  
}

class SignInWithGoogleEvent extends LoginEvent{
  final String? token;
  final String? name;
  final String? email;
  const SignInWithGoogleEvent(this.token, this.name, this.email);
  
}

class ResetLoginEvent extends LoginEvent{}

class OnSumitEvent extends LoginEvent{ }