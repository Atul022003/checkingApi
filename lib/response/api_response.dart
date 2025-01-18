import 'network/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.status,this.data,this.message);
  ApiResponse.Loading():status =Status.LOADING;
  ApiResponse.Complete(this.data):status =Status.COMPLETE;
  ApiResponse.Error(this.message):status =Status.ERROR;
  @override
  String toString(){
    return "Status: $status \n Message : $message \n Data: $data";
  }


}