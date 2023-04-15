// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'loginevent.dart';
import 'loginstate.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInititalState()) {
    on<LoginTextChangedEvent>((event, emit) {
    if(EmailValidator.validate(event.emailvalue)==false){
      emit(LoginErrorState("Please Enter Valid Email Address"));

    }
    else if(event.passwordvalue.length<=8){
     emit(LoginErrorState("Please Enter a Valid password"));
    }
    else{
      emit(LoginValidState("success message"));
    }
    });
    /*on<LoginSubmitEvent>((event, emit) {
      if(state is LoginValidState){
        emit(LoginValidState("successful login"));
      }

    });*/

  }
}

Future<void> submit()async {

}
