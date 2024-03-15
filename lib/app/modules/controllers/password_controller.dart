

import 'dart:developer';

import 'package:get/get.dart';

class PassWordViewController extends GetxController {
 var index = Get.arguments ;

 
  @override
  void onInit() {
    super.onInit();
    log(index.toString());
  }


}