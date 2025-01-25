import '../res/endpoint_url.dart';
import '../response/network/baseapi_service.dart';
import '../response/network/networkapi_service.dart';

class AuthRepository{
  BaseApiService _apiService = NetworkApiService();
  Future<dynamic>loginApi(dynamic data )async{
    try{
      dynamic response = await _apiService.getPostApiResponse(EndPointUrl.loginUrl, data);
      return response;
    }catch(e){
      throw e;
    }

  }
  Future<dynamic>registerApi(dynamic data )async{
    try{
      dynamic response = await _apiService.getPostApiResponse(EndPointUrl.registerApiUrl, data);


      return response;
    }catch(e){
      print(e);
      throw e;
    }

  }
}