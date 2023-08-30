abstract class LoginEvents {
  const LoginEvents();
}

class SendOtpToPhone extends LoginEvents {
  final String countryCode;
  final String phone;

  SendOtpToPhone({required this.phone, required this.countryCode});
}

class OnPhoneOtpSent extends LoginEvents {
  // final String verificationId;
  //OnPhoneOtpSent({required this.verificationId});
}
//
// class VerifyOtp extends LoginEvents {
//   final String otp;
//   final String phone;
//   VerifyOtp({required this.otp, required this.phone});
// }
//
// class ResendOtp extends LoginEvents {
//   final String phone;
//   ResendOtp({required this.phone});
// }
//
// class OnPhoneAuthError extends LoginEvents {
//   final String error;
//   OnPhoneAuthError({required this.error});
// }
//
// class OnPhoneAuthSuccess extends LoginEvents {
//   final String verificationId;
//   OnPhoneAuthSuccess({required this.verificationId});
// }
