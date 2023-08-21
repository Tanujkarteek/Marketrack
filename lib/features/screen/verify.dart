import 'package:flutter/material.dart';
import 'package:market_rack/constants/color.dart';
import 'package:market_rack/features/components/dashed_underline.dart';
import 'package:pinput/pinput.dart';

import '../../constants/asset_name.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
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
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: appbackground,
        //   toolbarHeight: 60,
        //   leadingWidth: 200,
        //   leading: Row(
        //     children: [
        //       IconButton(
        //         onPressed: Navigator.of(context).pop,
        //         icon: const Icon(
        //           Icons.arrow_back_ios_new,
        //           color: productblue,
        //         ),
        //       ),
        //       const Text(
        //         'Back',
        //         style: TextStyle(
        //             color: productblue,
        //             fontFamily: 'InterTight',
        //             fontSize: 20,
        //             fontWeight: FontWeight.w600),
        //       ),
        //     ],
        //   ),
        // ),
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
                        text: const TextSpan(
                          text: "+91-1234567890",
                          style: TextStyle(
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
                    child:Pinput(
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      showCursor: true,
                      onCompleted: (pin) => print(pin),
                      closeKeyboardWhenCompleted: true,
                      length: 6,
                      keyboardType: TextInputType.number,
                    ),
                  ),

                  const SizedBox(height: 20),
                  DottedUnderlineContainer(
                    color: productblue,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
