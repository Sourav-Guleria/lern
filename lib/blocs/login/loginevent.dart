abstract class LoginEvent{}
class LoginTextChangedEvent extends LoginEvent{
  late final String emailvalue;
  late final String passwordvalue;
  LoginTextChangedEvent(this.emailvalue,this.passwordvalue);
}

class LoginSubmitEvent extends LoginEvent{
  late final String email;
  late final String password;
  LoginSubmitEvent(this.email,this.password); 
}



