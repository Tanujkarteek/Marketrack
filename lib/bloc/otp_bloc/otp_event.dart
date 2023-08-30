part of 'otp_bloc.dart';

abstract class OtpEvents {
  const OtpEvents();
}

class VerifyOtp extends OtpEvents {
  final String otp;
  final String phone;

  VerifyOtp({required this.otp, required this.phone});
}

class ResendOtp extends OtpEvents {
  final String phone;
  final String countryCode;

  ResendOtp({required this.phone, required this.countryCode});
}

class OnOtpAuthError extends OtpEvents {
  final String error;

  OnOtpAuthError({required this.error});
}

class OnOtpAuthSuccess extends OtpEvents {
  final String verificationId;

  OnOtpAuthSuccess({required this.verificationId});
}
