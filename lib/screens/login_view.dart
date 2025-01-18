import 'package:checkingapi/screens/signup_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/camponent/rounded_button.dart';
import '../services/auth_view_modal.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class LoginView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginViewState();
  }

}
class LoginViewState extends State<LoginView>{
  ValueNotifier<bool>_obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode  emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();


  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
    final authViewModal = Provider.of<AuthViewModal>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(

                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: const InputDecoration(
                    hintText: "email",
                    prefixIcon: Icon(Icons.alternate_email_outlined)
                ),
                onSubmitted: (value){
                  // FocusScope.of(context).requestFocus(passwordFocusNode);
                  Utils.fieldFocusChange(context,emailFocusNode,passwordFocusNode);
                }
            ),
            ValueListenableBuilder(valueListenable:_obsecurePassword, builder:( context,value,child){
              return TextField(
                controller: _passwordController,
                obscureText:_obsecurePassword.value,
                focusNode: passwordFocusNode,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon:InkWell(
                      onTap: (){
                        _obsecurePassword.value =! _obsecurePassword.value;

                      },
                      child:Icon(Icons.visibility_off_outlined),
                    )
                ),
              );
            }
            ),
            SizedBox(height: height*0.085,),
            RoundedButton(title: "Login",
                loading: authViewModal.loading,
                onPress:(){
                  if( _emailController.text.isEmpty){
                    Utils.flushBarErrorMessage(" Please Enter email", context);
                  }
                  else if(_passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage("Enter the Password", context);
                  }else {
                    Map data ={
                      'email':_emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };
                    authViewModal.loginApi( data, context);


                    print('api hit');
                  }
                }),
            SizedBox(height:height*0.02 ,),
            InkWell(
              onTap: (){
               // Navigator.pushNamed(context,RoutesName.signup);
                Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child:  Text("Don't have account ? SignUp"),
            )

          ],
        ),
      ),
    );
  }

}