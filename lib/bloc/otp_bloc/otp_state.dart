part of 'otp_bloc.dart';

abstract class OtpStates {
  const OtpStates();
}

abstract class OtpActionStates extends OtpStates {
  const OtpActionStates();
}

class OtpScreenLoadingState extends OtpActionStates {}

class OtpScreenInitialState extends OtpStates {}

class OtpScreenLoadedState extends OtpStates {}

class OtpVerifyingState extends OtpActionStates {}

class OtpVerificationErrorState extends OtpStates {
  final String error;

  OtpVerificationErrorState({required this.error});
}

class OtpVerificationSuccessState extends OtpActionStates {
  // final String verificationId;
  // OtpVerificationSuccess({required this.verificationId});
}
