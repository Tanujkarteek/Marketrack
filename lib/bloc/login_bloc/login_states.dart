abstract class LoginStates {
  const LoginStates();
}

abstract class LoginActionStates extends LoginStates {
  const LoginActionStates();
}

class LoginScreenLoadingState extends LoginActionStates {}

class LoginScreenInitialState extends LoginStates {}

class LoginScreenLoadedState extends LoginStates {}

class LoginScreenErrorState extends LoginStates {
  final String error;
  LoginScreenErrorState({required this.error});
}

class PhoneAuthCodeSentSuccess extends LoginActionStates {
  // final String verificationId;
  // PhoneAuthCodeSentSuccess({required this.verificationId});
}

class PhoneAuthCodeSentFailure extends LoginActionStates {
  // final String error;
  // PhoneAuthCodeSentFailure({required this.error});
}