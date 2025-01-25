import 'dart:convert';

import 'package:checkingapi/modal/register_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/user_modal.dart';

class UserViewModal with ChangeNotifier{
  Future<bool> saveUser(UserModal user) async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token',user.token.toString());
    notifyListeners();
    return true;
  }
  Future<bool>saveRegisterUser( RegisterModal registeruser) async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String userJson = jsonEncode(registeruser.toJson());
    sp.setString('user', registeruser.token.toString());
    notifyListeners();
    return true;
  }
  Future<UserModal> getUser() async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    return UserModal(
        token: token.toString()
    );

  }
  /// get register user

// user logout then session will be removed
  Future<bool> remove() async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    sp.remove('user');
    return true;

  }
}