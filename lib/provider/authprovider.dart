import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constant.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _token;
  String _message = '';

  bool get isLoading => _isLoading;
  String? get token => _token;
  String get message => _message;

  // Method to set the token and notify listeners
  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse("${Constants.loginUrl}login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      _isLoading = false;
      notifyListeners();

      print(response.body);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final String token = jsonData['token'];

        // Save the token using setToken()
        setToken(token);

        return true;
      } else {
        return false;
      }
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      print("Login error: $error");
      return false;
    }
  }

}



