import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  showMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    notifyListeners();
  }

  bool _switchValue = false;
  bool get switchValue => _switchValue;
  set switchValue(bool value) {
    _switchValue = value;
    notifyListeners();
  }

  bool _modeSwitch = false;
  bool get modeSwitch => _modeSwitch;
  set modeSwitch(bool value) {
    _modeSwitch = value;
    notifyListeners();
  }

  bool _checkPassword = true;
  bool get checkPassword => _checkPassword;
  void checkPasswordd(String first, String second) {
    if (first == second) {
      _checkPassword = true;
    } else {
      _checkPassword = false;
    }
    notifyListeners();
  }




}
