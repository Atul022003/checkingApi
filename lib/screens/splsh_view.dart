import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/splash_service.dart';

class SplashView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SplashViewState();
  }

}
class SplashViewState extends State<SplashView>{
  SplashService splashService = SplashService();
  @override
  void  initState (){
    splashService.checkAuthentication(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Center(
          child: Text(
            "Splash Scrren",style:Theme.of(context).textTheme.headlineLarge,
          ),
        )
    );
  }

}