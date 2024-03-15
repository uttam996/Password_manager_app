import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';


class ApiService extends GetConnect {
  GetStorage _storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'http://172.30.2.45:3000'; 
    httpClient.defaultContentType = 'application/json';
    httpClient.timeout = const Duration(seconds: 5);
    httpClient.addRequestModifier<dynamic>(_requestModifier);
    httpClient.addResponseModifier(_responseModifier);
  }


  Future<Request> _requestModifier(Request request) async {
    request.headers.addAll({
      "Authoriation":"Bearer ${_storage.read('token')}"
    });
    return request;
  }
  Future<dynamic> _responseModifier(Request request , Response response)async {
    if(response.statusCode == 401) {
      // TODO: toast 
     
    }
  }
}