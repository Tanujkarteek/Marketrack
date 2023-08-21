import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_rack/bloc/login_bloc/login_events.dart';
import 'package:market_rack/bloc/login_bloc/login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  String loginResult = "";
  LoginBloc() : super(LoginScreenInitialState()) {
    on<SendOtpToPhone>((event, emit) {
      //emit(LoginScreenLoadingState());
      emit(PhoneAuthCodeSentSuccess());
      debugPrint("Loading State");
    });

    on<OnPhoneOtpSent>((event, emit) {
      emit(PhoneAuthCodeSentSuccess());
      debugPrint("PhoneAuthCodeSentSuccess");
    });

    // on<VerifyOtp>((event, emit) {
    //   emit(LoginScreenLoadingState());
    //   //handle the event here
    // });
    //
    // on<ResendOtp>((event, emit) {
    //   emit(LoginScreenLoadingState());
    //   //handle the event here
    // });
    //
    // on<OnPhoneAuthError>((event, emit) {
    //   emit(LoginScreenErrorState(error: event.error));
    //   //handle the event here
    // });
    //
    // on<OnPhoneAuthSuccess>((event, emit) {
    //   emit(LoginScreenLoadedState());
    //   //handle the event here
    // });
  }
}
