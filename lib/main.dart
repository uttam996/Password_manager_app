import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:password/app/Service/ApiService.dart';
import 'package:password/app/modules/controllers/home_controlles.dart';

import 'package:password/app/modules/views/AddPassword_view.dart';
import 'package:password/app/modules/views/Password_view.dart';
import 'package:password/app/modules/views/log_view.dart';
import 'package:password/app/modules/views/mypassword_views.dart';
import 'package:password/app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialBinding: BindingsBuilder(() {
        Get.put(ApiService());
      }),
      debugShowCheckedModeBanner: false,
      home: Main_wrapper(),
      getPages: getPages,
    ),
  );
}

// ignore: camel_case_types
class Main_wrapper extends StatelessWidget {
  const Main_wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        
        
        title: const Text("Password Manager", style: TextStyle(color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        // letterSpacing: 
        ),),
      ),
      body: PageView(
        controller: controller.pageController,
        children: [Mypassword(), Logview() , AddPassword(),],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items:const  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "My Password4",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Log",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add Password",
          ),

          
        ],
      ),)
    );
  }
}
