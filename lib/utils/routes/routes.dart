import 'package:checkingapi/modal/mandir_faqs_modal.dart';
import 'package:checkingapi/modal/pujadeatils_modal.dart';
import 'package:checkingapi/screens/home_screen.dart';

import 'package:checkingapi/screens/login_view.dart';
import 'package:checkingapi/screens/offers_dart.dart';
import 'package:checkingapi/screens/poojalist_view.dart';
import 'package:checkingapi/screens/review_screen.dart';
import 'package:checkingapi/screens/signup_dart.dart';

import 'package:checkingapi/utils/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/homepage.dart';
import '../../screens/puja_details.dart';
import '../../screens/splsh_view.dart';

class Routes{
static Route<dynamic> generateRoute(RouteSettings settings){
final arguments = settings.arguments;
switch(settings.name){
case RoutesName.home:
return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
case RoutesName.login:
return MaterialPageRoute(builder: (BuildContext context) => LoginView());
case RoutesName.splash:
return MaterialPageRoute(builder: (BuildContext context) => SplashView());
  case RoutesName.register:
    return MaterialPageRoute(builder: (BuildContext context) => RegisterPage());
case RoutesName.Home:
  return MaterialPageRoute(builder: (BuildContext context) => Homepage());
  case RoutesName.offer :
    return MaterialPageRoute(builder: (BuildContext context ) => Offers());
  case RoutesName.pujalist :
    return MaterialPageRoute(builder: (BuildContext context ) => PoojalistView());
  //case RoutesName.mandirfaqs :
    //return MaterialPageRoute(builder: (BuildContext context ) => MandirFaqs());

  case RoutesName.review:
    return MaterialPageRoute(builder: (BuildContext context) => ReviewScreen());
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