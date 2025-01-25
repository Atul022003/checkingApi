import 'package:checkingapi/modal/mandir_faqs_modal.dart';
import 'package:checkingapi/modal/mandir_offers.dart';
import 'package:checkingapi/modal/mandirlist_modal.dart';
import 'package:checkingapi/modal/poojalist_modal.dart';
//import 'package:checkingapi/modal/puja_details.dart';

import 'package:checkingapi/modal/review_modal.dart';

import '../modal/offer_modal.dart';
import '../modal/pujadeatils_modal.dart';
import '../res/endpoint_url.dart';
import '../response/network/baseapi_service.dart';
import '../response/network/networkapi_service.dart';

class HomeRepository{

  BaseApiService _apiService = NetworkApiService();
  Future<MandirListMoadal>fetchMandirList()async{


    try{
      dynamic response = await _apiService.getGetApiResponse(EndPointUrl.mandirListApiUrl);
      return response = MandirListMoadal.fromJson(response);
    }catch(e){
      throw e;
    }

  }
  ///mandir Offeres

  Future<OfferModal>fetchOffering()async{


    try{
      dynamic response = await _apiService.getGetApiResponse(EndPointUrl.mandirofferApi);
      return response = OfferModal.fromJson(response);
    }catch(e){
      throw e;
    }

  }
  ////mandir Review
  Future<ReviewModal>fetchReview()async{


    try{
      dynamic response = await _apiService.getGetApiResponse(EndPointUrl.mandirofferApi);
      return response = ReviewModal.fromJson(response);
    }catch(e){
      throw e;
    }

  }
  //// Mandir Alll offfers
  Future<MandirOffering>fetchallOffers()async{


    try{
      dynamic response = await _apiService.getGetApiResponse(EndPointUrl.mandirofferApi);
      return response = MandirOffering.fromJson(response);
    }catch(e){
      throw e;
    }

  }
  ///Poja List
  Future<PujaListModal>fetchPujaList()async{


    try{
      dynamic response = await _apiService.getGetApiResponse(EndPointUrl.poojaListUrl);
      return response = PujaListModal.fromJson(response);
    }catch(e){
      throw e;
    }

  }
//// PujaDeatils
  Future<PujaDetails>fetchPujadeatils()async{


    try{
      dynamic response = await _apiService.getGetApiResponse(EndPointUrl.poojaDetails);
      return response = PujaDetails.fromJson(response);
    }catch(e){
      throw e;
    }

  }
  //// MAndirFaqs
  Future<MandirFaqs>fetchMandirfaqs()async{


    try{
      dynamic response = await _apiService.getGetApiResponse(EndPointUrl.mandirfaqs);
      return response = MandirFaqs.fromJson(response);
    }catch(e){
      throw e;
    }

  }

}