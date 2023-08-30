import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'otp_event.dart';

part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvents, OtpStates> {
  OtpBloc() : super(OtpScreenInitialState()) {
    on<VerifyOtp>((event, emit) {
      emit(OtpVerifyingState());
    });
    on<OnOtpAuthSuccess>((event, emit) {
      emit(OtpVerificationSuccessState());
    });
    on<OnOtpAuthError>((event, emit) {
      emit(OtpVerificationErrorState(error: event.error));
    });
    on<ResendOtp>((event, emit) {
      emit(OtpScreenLoadingState());
      debugPrint("ResendOtp");
    });
  }
}
