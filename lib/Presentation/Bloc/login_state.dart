part of 'login_bloc.dart';



class LoginState extends Equatable {
  
  final bool isFormValid;
  final String token;
  final String name;
  final String countryCode;
  final String cellphone;
  final String email;
  final bool authStatus;

  const LoginState({
    this.isFormValid = false,
    this.token = '',
    this.name = '',
    this.countryCode = '',
    this.cellphone = '', 
    this.email = '',
    this.authStatus = false
  });

  LoginState copyWith({
    bool? isFormValid,
    String? token,
    String? name,
    String? countryCode,
    String? cellphone,
    String? email,
    bool? authStatus
  }) => LoginState(
    isFormValid: isFormValid ?? this.isFormValid,
    token: token ?? this.token,
    name: name ?? this.name,
    countryCode: countryCode ?? this.countryCode,
    cellphone: cellphone ?? this.cellphone,
    email: email ?? this.email,
    authStatus: authStatus ?? this.authStatus
  );
  
  @override
  List<Object> get props => [ isFormValid, token, name, countryCode, cellphone, email, authStatus];
}

