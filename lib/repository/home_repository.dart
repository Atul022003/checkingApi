import 'package:checkingapi/modal/mandirlist_modal.dart';

import '../modal/offer_modal.dart';
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
}