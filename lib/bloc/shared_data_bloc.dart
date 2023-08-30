import 'package:flutter/material.dart';

class SharedDataBloc extends ChangeNotifier {
  String _countryCode = '';
  String _phoneNumber = '';

  String get phoneNumber => _phoneNumber;

  String get countryCode => _countryCode;

  void updatePhoneNumber(String newPhoneNumber) {
    _phoneNumber = newPhoneNumber;
    notifyListeners();
  }

  void updateCountryCode(String newCountryCode) {
    _countryCode = newCountryCode;
    notifyListeners();
  }
}
