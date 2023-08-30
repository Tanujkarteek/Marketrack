import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_rack/bloc/login_bloc/login_states.dart';
import 'package:market_rack/constants/color.dart';
import 'package:provider/provider.dart';
import '../../bloc/login_bloc/login_bloc.dart';
import '../../bloc/login_bloc/login_events.dart';
import '../../bloc/shared_data_bloc.dart';
import '../../constants/asset_name.dart';
import '../components/dashed_underline.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController countryController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
    countryController.text = "91";
  }

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = LoginBloc();
    return BlocConsumer<LoginBloc, LoginStates>(
      bloc: loginBloc,
      listenWhen: (previous, current) => current is LoginActionStates,
      buildWhen: (previous, current) => current is! LoginActionStates,
      listener: (context, state) {
        if (state is PhoneAuthCodeSentSuccess) {
          Navigator.pushNamed(context, '/verify');
        }
        if (state is PhoneAuthCodeSentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("error"),
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
            // appBar: AppBar(
            //   backgroundColor: appbackground,
            //   toolbarHeight: 60,
            // ),
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: appbackground,
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 130,
                      ),
                      Image.asset(logo),
                      const SizedBox(
                        height: 120,
                      ),
                      const Text(
                        "Log in or create an account",
                        style: TextStyle(
                          fontSize: 21,
                          fontFamily: "InterTight",
                          fontWeight: FontWeight.w400,
                          color: commontext,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.76,
                        height: 60,
                        decoration: BoxDecoration(
                          color: textfieldcolor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "+",
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontFamily: "InterTight",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                              child: TextFormField(
                                controller: countryController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                  fontSize: 21,
                                  fontFamily: "InterTight",
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Text(
                              "|",
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                key: _formKey,
                                onChanged: (value) {
                                  if (value.length == 10) {
                                    FocusScope.of(context).unfocus();
                                    setState(() {
                                      mobileController.text = value;
                                    });
                                  }
                                },
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Mobile Number",
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "InterTight",
                                    fontWeight: FontWeight.w400,
                                    color: commontext,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 21,
                                  fontFamily: "InterTight",
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: MediaQuery.of(context).size.width * 0.76,
                        height: 60,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              productblue,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            //Navigator.pushNamed(context, '/verify');
                            final sharedDataBloc = Provider.of<SharedDataBloc>(
                                context,
                                listen: false);
                            sharedDataBloc
                                .updatePhoneNumber(mobileController.text);
                            sharedDataBloc
                                .updateCountryCode(countryController.text);
                            loginBloc.add(
                              SendOtpToPhone(
                                phone: mobileController.text,
                                countryCode: countryController.text,
                              ),
                            );
                          },
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: "InterTight",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "or",
                        style: TextStyle(
                          fontSize: 21,
                          fontFamily: "InterTight",
                          fontWeight: FontWeight.w400,
                          color: commontext,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            width: MediaQuery.of(context).size.width * 0.36,
                            height: 60,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.white,
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: null,
                              child: Image.asset(
                                googleicon,
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            width: MediaQuery.of(context).size.width * 0.36,
                            height: 60,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.white,
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: null,
                              child: Image.asset(
                                appleicon,
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: <Widget>[
                          const Text(
                            "By continuing you agree to our",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "InterTight",
                              fontWeight: FontWeight.w400,
                              color: commontext,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: null,
                                child: DottedUnderlineContainer(
                                  color: commontext,
                                  text: const Text(
                                    'Terms of Use',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Arcon",
                                      fontWeight: FontWeight.w400,
                                      color: commontext,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: null,
                                child: DottedUnderlineContainer(
                                  color: commontext,
                                  text: const Text(
                                    'Content Policy',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Arcon",
                                      fontWeight: FontWeight.w400,
                                      color: commontext,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: null,
                                child: DottedUnderlineContainer(
                                  color: commontext,
                                  text: const Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Arcon",
                                      fontWeight: FontWeight.w400,
                                      color: commontext,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
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
