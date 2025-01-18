import 'package:checkingapi/modal/mandirlist_modal.dart';
import 'package:flutter/cupertino.dart';

import '../modal/offer_modal.dart';
import '../repository/home_repository.dart';
import '../response/api_response.dart';

class HomeViewModal with ChangeNotifier{
  final _myRepo = HomeRepository();
  ApiResponse<MandirListMoadal> mandirList = ApiResponse.Loading();
  setOfferList(ApiResponse<MandirListMoadal> response ){
    mandirList = response;
    notifyListeners();
  }
  Future<void> fetchOfferListApi() async{
    setOfferList(ApiResponse.Loading());
    _myRepo.fetchMandirList().then((value){
      setOfferList(ApiResponse.Complete(value));
    }).onError((error , stackTrace){
      setOfferList(ApiResponse.Error((error.toString())));

    });

  }
}