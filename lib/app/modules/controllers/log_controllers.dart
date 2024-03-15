import 'dart:developer';

import 'package:get/get.dart';
import 'package:password/ApiUrl.dart';
import 'package:password/app/Service/ApiService.dart';
import 'package:password/app/model/log.model.dart';

class LogController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    getLog();
    
  } 


  


    

 RxList<Logs> logList = <Logs>[].obs;
  RxBool logLoad = false.obs;
  RxInt page = 1.obs;
  RxInt limit = 10.obs;
  RxInt total = 0.obs;
 


 

  final ApiService apiService = ApiService();

  Future<dynamic> getLog() async {
    try {
      logLoad.value = true;
      final response = await apiService
          .get('${baseUrl}log?page=${page.value}&limit=${limit.value}');
      if (response.statusCode == 200) {
        log('response : ${response.body.toString()}');
        total.value = response.body['total'];
        response.body['logs'].forEach((element) {
          logList.add(Logs.fromJson(element));
        });
      } else {
        Get.snackbar('Error', response.body.toString());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      logLoad.value = false;
    }
  }
}
