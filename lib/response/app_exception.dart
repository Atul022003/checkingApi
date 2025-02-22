class AppException implements Exception {
  final _message;
  final _prefix;
  AppException( this._message,this._prefix);
  String toString(){
    return "$_prefix$_message";
  }
}
class FetchDataException extends AppException{
  FetchDataException([String? message]):super(message,"Error during communication");
}
class BadRequestException extends AppException {
  BadRequestException ([String? message]):super(message,"invalid request");
}
class UnAuthorisedException extends AppException{
  UnAuthorisedException([String? message]):super(message,"UnAuthorised request");
}