import 'package:checkingapi/screens/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/authprovider.dart';


class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }



}
class LoginPageState extends State<LoginPage>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void login()async {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Enter a valid email!!")));
      return;
    }
    if (_passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Enter a valid password!!")));
      return;
    }

    final provider = Provider.of<AuthProvider>(context ,listen: false);
    final response = await provider.login(_emailController.text,_passwordController.text);

    print(response);

    if(response){

      Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid Credentials")));
    }
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Login Page"),
     ),
     body: Center(
       child: Padding(
         padding: const EdgeInsets.all(16.0),
         child: SingleChildScrollView(
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               const SizedBox(height: 40),

               // Email Field
               TextField(
                 controller: _emailController,
                 decoration: const InputDecoration(
                   labelText: 'Email ID',
                   border: OutlineInputBorder(),
                   hintText: 'Enter your email',
                 ),
               ),
               const SizedBox(height: 20),
               // Password Field
               TextField(
                 controller: _passwordController,
                 //  obscureText: true,
                 decoration: const InputDecoration(
                   labelText: 'Password',
                   border: OutlineInputBorder(),
                   hintText: 'Enter your password',
                 ),
               ),
               const SizedBox(height: 20),
               // Login Button
               ElevatedButton(
                 onPressed: () {
                   login();

                 },
                 style: ElevatedButton.styleFrom(
                   minimumSize: const Size(double.infinity, 50),
                 ),
                 child: const Text('Login'),
               ),
               const SizedBox(height: 10),
               // Forgot Password Link
               TextButton(
                 onPressed: () {

                 },
                 child: const Text(
                   'Forgot Password?',
                   style: TextStyle(color: Colors.blue),
                 ),
               ),
             ],
           ),
         ),
       ),
     ),


   );
  }

}