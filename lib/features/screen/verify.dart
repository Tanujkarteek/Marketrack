import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_rack/constants/color.dart';
import 'package:market_rack/features/components/dashed_underline.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../bloc/otp_bloc/otp_bloc.dart';
import '../../bloc/shared_data_bloc.dart';
import '../../constants/asset_name.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    final sharedDataBloc = Provider.of<SharedDataBloc>(context);
    final phoneNumber = sharedDataBloc.phoneNumber;
    final countryCode = sharedDataBloc.countryCode;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20, color: commontext, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: textfieldcolor,
        border: Border.all(color: textfieldcolor),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: pinselectborder),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      textStyle: const TextStyle(
          fontSize: 20, color: appbackground, fontWeight: FontWeight.w600),
      decoration: defaultPinTheme.decoration?.copyWith(
        color: productblue,
      ),
    );

    final OtpBloc otpBloc = OtpBloc();
    return BlocConsumer<OtpBloc, OtpStates>(
      bloc: otpBloc,
      listenWhen: (previous, current) => current is OtpActionStates,
      buildWhen: (previous, current) => current is! OtpActionStates,
      listener: (context, state) {
        if (state is OtpVerificationSuccessState) {
          // Navigator.of(context).pushNamed('/home');
        }
        if (state is OtpVerificationErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  color: appbackground,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: Navigator.of(context).pop,
                            icon: const Icon(
                              Icons.arrow_back,
                              color: productblue,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Image.asset(logo),
                      const SizedBox(
                        height: 140,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("We have sent a verification code to",
                              style: TextStyle(
                                  color: commontext,
                                  fontFamily: 'InterTight',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              text: '+$countryCode $phoneNumber',
                              style: const TextStyle(
                                  color: commontext,
                                  fontFamily: 'InterTight',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 330,
                        height: 50,
                        child: Pinput(
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          submittedPinTheme: submittedPinTheme,
                          showCursor: true,
                          closeKeyboardWhenCompleted: true,
                          length: 6,
                          keyboardType: TextInputType.number,
                          onCompleted: (value) {
                            //otpBloc.add(VerifyOtp(otp: value, phone: phone));
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      DottedUnderlineContainer(
                        color: productblue,
                        child: GestureDetector(
                          onTap: () {
                            otpBloc.add(ResendOtp(
                                phone: phoneNumber, countryCode: countryCode));
                          },
                          child: const SizedBox(
                            width: 160,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Resend OTP",
                                  style: TextStyle(
                                      color: productblue,
                                      fontFamily: 'InterTight',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.replay,
                                  color: productblue,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
