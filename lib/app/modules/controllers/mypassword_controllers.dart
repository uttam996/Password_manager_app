import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password/ApiUrl.dart';
import 'package:password/app/Service/ApiService.dart';
import 'package:password/app/model/passwordlist.model.dart';

class MypasswordController extends GetxController {
  // ignore: unnecessary_overrides
  @override
  void onInit() {
    super.onInit();
    getpassword();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        log( 'reached end');
        page.value++;
        getpassword();
      }
    });
  }
  ScrollController scrollController = ScrollController();

  

  ApiService apiService = ApiService();
  List<Password> passwordList = [];
  RxInt page = 1.obs;
  RxInt limit = 10.obs;

  RxBool passwordLoad = false.obs;
  RxInt passwordLoadSingle = (-1).obs;


  

  final searchController = TextEditingController();





  



  Future<dynamic> getpassword() async {
    try {
      passwordLoad.value = true;
      final response = await apiService.get('${baseUrl}password?page=${page.value}&limit=${limit.value}&search=${searchController.text}') ;

      if (response.statusCode == 200) {
        // log('response : ${response.body}');

      response.body.forEach((element) {
        // log('element : $element');
        passwordList.add(Password.fromJson(element));
      });

       
        
       



            
      }
    } catch (e) {
      // log('error : $e ');
      // TODO: toast
      Get.snackbar('Error', e.toString());
    } finally {
      passwordLoad.value = false;
    }
  }

  getSinglePassword(String id ,int index) async {
    try {
      passwordLoadSingle.value = index;
      final response = await apiService.get('http://3.7.200.26:3000/password/$id');
      // if reponse is 200 then copy the password to clipboard and show snackbar
      if (response.statusCode == 200) {
        log('response : ${response.body}');
      return response.body;
      }

    } catch (e) {
      log('error : $e ');
      return e.toString();
    } finally {
      passwordLoadSingle.value = -1;
    }
  }
}
