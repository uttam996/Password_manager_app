

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password/app/modules/controllers/log_controllers.dart';




class Logview extends GetView<LogController> {
   Logview({super.key});
  
  @override
  final controller = Get.put(LogController());
  
 

  @override
  Widget build(BuildContext context) {
    return Obx(() => 
    Expanded(child: 
     ListView.builder(
      itemCount: controller.logList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(controller.logList[index].model.toString()),
          subtitle: Text(controller.logLoad.toString()),
         
        );
      },
     )
      
    )
     
    );

  }
}