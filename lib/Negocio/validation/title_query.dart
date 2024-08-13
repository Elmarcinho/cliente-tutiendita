import 'package:formz/formz.dart';

// Define input validation errors
enum TitleQueryError { empty}

// Extend FormzInput and provide the input type and error type.
class TitleQuery extends FormzInput<String, TitleQueryError> {


  // Call super.pure to represent an unmodified form input.
  const TitleQuery.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const TitleQuery.dirty( String value ) : super.dirty(value);


  String? get errorMessage {
    if ( isValid || isPure ) return null;
    if ( displayError == TitleQueryError.empty ) return 'El campo es requerido';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  TitleQueryError? validator(String value) {
    
    if ( value.isEmpty || value.trim().isEmpty ) return TitleQueryError.empty;

    return null;
  }
}