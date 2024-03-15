

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password/app/modules/controllers/log_controllers.dart';
import 'package:password/app/modules/controllers/mypassword_controllers.dart';

import 'package:password/app/modules/controllers/password_controller.dart';

class PasswordView extends GetView<PassWordViewController> {
 
   PasswordView({super.key });

  final controller = Get.put((PassWordViewController()));
  final passController = Get.put(MypasswordController());






   
  
 


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Password View ${controller.index}"),
        
      ),
      body:  Center(
        child: Column(children: [
          Text(passController.passwordList[controller.index].userName.toString()),
          Text(passController.passwordList[controller.index].password.toString()),
          Text(passController.passwordList[controller.index].webSiteName.toString()),
          Text(passController.passwordList[controller.index].sId.toString()),
          Text(passController.passwordList[controller.index].createdAt.toString()),

        ]),
      ),
    );
  }
}