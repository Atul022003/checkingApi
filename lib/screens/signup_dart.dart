import 'package:checkingapi/screens/home_screen.dart';
import 'package:checkingapi/screens/homepage.dart';
import 'package:checkingapi/screens/poojalist_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import '../constant.dart';
import '../res/camponent/rounded_button.dart';
import '../services/auth_view_modal.dart';
import '../utils/utils.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  ValueNotifier<bool>_obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confPasswordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
    final authViewModal = Provider.of<AuthViewModal>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
          ValueListenableBuilder(valueListenable:_obsecurePassword, builder:( context,value,child){
            return Column(
              children: [
              TextField(
              controller: _passwordController,
              obscureText:_obsecurePassword.value,
              decoration: InputDecoration(

                  labelText: "Password",

                  suffixIcon:InkWell(
                    onTap: (){
                      _obsecurePassword.value =! _obsecurePassword.value;

                    },
                    child:Icon(Icons.visibility_off_outlined),
                  )
              ),
            ),
                TextField(
                  controller: _confPasswordController,
                  obscureText: _obsecurePassword.value,
                  decoration: InputDecoration(labelText: " Confirm Password",
                      suffixIcon:InkWell(
                        onTap: (){
                          _obsecurePassword.value =! _obsecurePassword.value;

                        },
                        child:Icon(Icons.visibility_off_outlined),
                      )
                  ),
                ),
              ],
            );

          }
          ),


            SizedBox(height: 20),
        RoundedButton(title: "Signup",
            loading: authViewModal.loading,
            onPress:(){
              if( _nameController.text.isEmpty){
                Utils.flushBarErrorMessage(" Please Enter name", context);
              }
              else if(_emailController.text.isEmpty){
                Utils.flushBarErrorMessage("Enter the email", context);
              }
              else if(_passwordController.text.isEmpty){
                Utils.flushBarErrorMessage("Enter the password", context);
              }
              else if (_confPasswordController.text.isEmpty){
                Utils.flushBarErrorMessage("Confirm Password", context);
              }
              else {
                Map data ={""
                  'name':_nameController.text.toString(),
                  'email':_emailController.text.toString(),
                  'password': _passwordController.text.toString(),
                  'password_confirmation': _confPasswordController.text.toString(),
                };
                authViewModal.registerApi( data, context);


                print('api hit');
              }
            }),
          ],
        ),
      ),
    );
  }
}
