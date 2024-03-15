import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:password/app/modules/controllers/addPassword_controllers.dart';

class AddPassword extends GetView<AddPasswordController> {
  AddPassword({super.key});

  @override
  final controller = Get.put(AddPasswordController());

  get box => GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            controller: controller.websiteController,
            decoration: const InputDecoration(
                labelText: "Website",
                hintText: "Enter website",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(15),
                isDense: true),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: controller.userNameController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintStyle: TextStyle(),
                labelText: "Username",
                hintText: "Enter username",
                contentPadding: EdgeInsets.all(15),
                isDense: true),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: controller.passwordController,
            decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter password",
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(15),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: controller.urlController,
            decoration: const InputDecoration(
              labelText: "URL",
              hintText: "Enter URL",
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(15),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(10),
                  ),
                ),
                onPressed: () {
                  controller.addPassword();
                },
                child: Obx(
                  () => controller.loading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text("ADD PASSWORD",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          )),
                )),
          ),
        ],
      ),
    );
  }
}
