import 'package:checkingapi/modal/mandir_faqs_modal.dart';
import 'package:checkingapi/modal/mandir_offers.dart';
import 'package:checkingapi/modal/mandirlist_modal.dart';
import 'package:checkingapi/modal/poojalist_modal.dart';
//import 'package:checkingapi/modal/puja_details.dart';

import 'package:checkingapi/modal/review_modal.dart';
import 'package:flutter/cupertino.dart';

import '../modal/offer_modal.dart';

import '../modal/pujadeatils_modal.dart';
import '../repository/home_repository.dart';
import '../response/api_response.dart';

class HomeViewModal with ChangeNotifier{
  final _myRepo = HomeRepository();
  ApiResponse<MandirListMoadal> mandirList = ApiResponse.Loading();
  ApiResponse<OfferModal>mandirofferList = ApiResponse.Loading();
  ApiResponse<ReviewModal>reviewList = ApiResponse.Loading();
  ApiResponse<MandirOffering>offerList = ApiResponse.Loading();
  ApiResponse<PujaListModal>pujaList= ApiResponse.Loading();
  ApiResponse<PujaDetails>pujadetails = ApiResponse.Loading();
  ApiResponse<MandirFaqs>mandirfaqs = ApiResponse.Loading();



  setOfferList(ApiResponse<MandirListMoadal> response ){
    mandirList = response;
    notifyListeners();
  }
  //// MAndir offer
  setMandirOfferList(ApiResponse<OfferModal> response ){
    mandirofferList = response;
    notifyListeners();
  }
  //// Mandir Review
  setreviewList(ApiResponse<ReviewModal> response ){
    reviewList = response;
    notifyListeners();
  }
  /////Alll mandir Offers
  setofferList(ApiResponse<MandirOffering> response ){
    offerList = response;
    notifyListeners();
  }
  /// Puja List
  setpujaLIst(ApiResponse<PujaListModal> response){
    pujaList = response;
    notifyListeners();
  }
  ////Pujadetails
  setpujadeatails(ApiResponse<PujaDetails> response){
    pujadetails = response;
    notifyListeners();
  }
  ///// mandirFaqs

  setmandirfaqs(ApiResponse<MandirFaqs> response){
    mandirfaqs = response;
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
  ///// MandirOffer List
  Future<void> fetchMandirOfferListApi() async{
    setMandirOfferList(ApiResponse.Loading());
    _myRepo.fetchOffering().then((value){
      setMandirOfferList(ApiResponse.Complete(value));
    }).onError((error , stackTrace){
      setOfferList(ApiResponse.Error((error.toString())));

    });

  }
  //// MandirReview
  Future<void> fetchReviewListApi() async{
    setreviewList(ApiResponse.Loading());
    _myRepo.fetchReview().then((value){
      setreviewList(ApiResponse.Complete(value));
    }).onError((error , stackTrace){
      setreviewList(ApiResponse.Error((error.toString())));

    });

  }

  ///// Mandir all offers
  Future<void> fetchAllOffers() async{
    setofferList(ApiResponse.Loading());
    _myRepo.fetchallOffers().then((value){
      setofferList(ApiResponse.Complete(value));
    }).onError((error , stackTrace){
      setofferList(ApiResponse.Error((error.toString())));

    });

  }
  ////puja List
  Future<void> fetchPujaList() async{
    setpujaLIst(ApiResponse.Loading());
    _myRepo.fetchPujaList().then((value){
      setpujaLIst(ApiResponse.Complete(value));
    }).onError((error , stackTrace){
      setpujaLIst(ApiResponse.Error((error.toString())));

    });

  }
  /// PujaDeatils
  Future<void> fetchPujadetails() async{
    setpujadeatails(ApiResponse.Loading());
    _myRepo.fetchPujadeatils().then((value){
      setpujadeatails(ApiResponse.Complete(value));
    }).onError((error , stackTrace){
      setpujadeatails(ApiResponse.Error((error.toString())));

    });

  }
  ////
  Future<void> fetchMandirfaqs() async{
    setmandirfaqs(ApiResponse.Loading());
    _myRepo.fetchMandirfaqs().then((value){
      setmandirfaqs(ApiResponse.Complete(value));
    }).onError((error , stackTrace){
      setmandirfaqs(ApiResponse.Error((error.toString())));

    });

  }

}