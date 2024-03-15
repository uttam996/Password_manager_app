

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password/ApiUrl.dart';
import 'package:password/app/Service/ApiService.dart';

class AddPasswordController extends GetxController {
  final websiteController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final urlController = TextEditingController();

  RxBool loading = false.obs;
  ApiService apiService = ApiService();

  addPassword() async { 
    // add password to the database

    try{
      loading.value = true;

    final response = await apiService.post('${baseUrl}password', {
      "webSiteName": websiteController.text,
      "userName": userNameController.text,
      "password": passwordController.text,
      "Url":urlController.text
    });

    if (response.statusCode == 201) {
      Get.snackbar('Success', 'Password added successfully');
      // clear the textfield
      websiteController.clear();
      userNameController.clear();
      passwordController.clear();
      urlController.clear();
      
    }
    else{
      Get.snackbar('Error', response.body.toString());
    } 

    }
    catch(e){
      Get.snackbar('Error', e.toString());
    }
    finally{
      loading.value = false;
    }

    






    
  }

}