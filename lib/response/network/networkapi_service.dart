import 'dart:io';
import 'dart:convert';
import '../app_exception.dart';
import 'baseapi_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:checkingapi/response/network/baseapi_service.dart';



class NetworkApiService extends BaseApiService{
  @override
  Future getGetApiResponse(String url) async{
    dynamic responsejson;
    try{
      final response = await http.get(Uri.parse(url))
          .timeout( const Duration( seconds: 10));
      responsejson = returnResponse(response);

    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responsejson;

  }

  @override
  Future getPostApiResponse(String url ,dynamic data) async {
    dynamic responsejson;
    try{
      final response = await http.post(Uri.parse(url),body: data).timeout(Duration( seconds: 10));
      responsejson = returnResponse(response);

    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responsejson;

  }
  dynamic returnResponse (http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw UnAuthorisedException(response.body.toString());
      default :
        throw FetchDataException("Error acuured while Connecting the server"+" with status code"+response.body.toString());
    }
  }


}