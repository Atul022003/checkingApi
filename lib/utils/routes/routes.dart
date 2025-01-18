import 'package:checkingapi/screens/login_page.dart';
import 'package:checkingapi/screens/login_view.dart';
import 'package:checkingapi/screens/signup_dart.dart';
import 'package:checkingapi/utils/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/homepage.dart';

class Routes{
static Route<dynamic> generateRoute(RouteSettings settings){
final arguments = settings.arguments;
switch(settings.name){
case RoutesName.home:
return MaterialPageRoute(builder: (BuildContext context) => Homepage());
case RoutesName.login:
return MaterialPageRoute(builder: (BuildContext context) => LoginView());
case RoutesName.signup:
return MaterialPageRoute(builder: (BuildContext context) => RegisterPage());
//case RoutesName.splash:
//return MaterialPageRoute(builder: (BuildContext context) => SplashView());
default:
return MaterialPageRoute(builder: (_){
return Scaffold(
body: Center(
child: Text("No route defined"),
),
);
});
}
}
}