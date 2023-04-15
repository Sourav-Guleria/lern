abstract class LoginState{}
class LoginInititalState extends LoginState{}
class LoginInvalidState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginErrorState extends LoginState{
  late final String errormessage;
  LoginErrorState(this.errormessage);
}
class LoginValidState extends LoginState{
  late final String successmessage;
  LoginValidState(this.successmessage);
}
