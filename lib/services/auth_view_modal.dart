import 'package:checkingapi/services/user_view_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../modal/user_modal.dart';
import '../repository/auth_repository.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class AuthViewModal with ChangeNotifier{
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get signUpLoading => _signUpLoading;
  bool _signUpLoading = false;
  bool get loading => _loading;
  setLoading( bool value){
    _loading  = value;
    notifyListeners();
  }
  setsignUpLoading( bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void>loginApi( dynamic data , BuildContext context)async {
    setLoading(true);
    _myRepo.loginApi(data).then((value){
      setLoading(false);
      final userPrefrence = Provider.of<UserViewModal>(context,listen:false);
      userPrefrence.saveUser(UserModal(
          token: value['token'].toString()
      ));
      Utils.flushBarErrorMessage("Login Succesfull", context);
      Navigator.pushNamed(context,RoutesName.home);
      if(kDebugMode){
        print(value.toString());}
    }).onError((error,stackTrace){
      setLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());}
    });

  }
  Future<void>registerApi( dynamic data , BuildContext context)async {
    setsignUpLoading(true);
    _myRepo.registerApi(data).then((value){
      setsignUpLoading(false);
      Utils.flushBarErrorMessage("SignUp Succesfull", context);
      Navigator.pushNamed(context,RoutesName.home);
      if(kDebugMode){
        print(value.toString());}
    }).onError((error,stackTrace){
      setsignUpLoading(false);

      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());}
    });

  }
}