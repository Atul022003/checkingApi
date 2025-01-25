import 'package:checkingapi/services/user_view_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../modal/user_modal.dart';
import '../utils/routes/routes_name.dart';

class SplashService{
  Future<UserModal> getUserData() => UserViewModal().getUser();
  void checkAuthentication ( BuildContext context) async{

    getUserData().then((value) async{
      print(value.token.toString());
      Future.delayed(Duration(seconds: 3));
      if(value.token.toString() == 'null' || value.token.toString() == ''){
        Navigator.pushNamed(context,RoutesName.login);
      } else{
        Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context,RoutesName.home);
      }
    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}