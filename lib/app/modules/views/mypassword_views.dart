import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:password/app/model/passwordlist.model.dart';
import 'package:password/app/modules/controllers/mypassword_controllers.dart';
import 'package:password/app/modules/views/Password_view.dart';

class Mypassword extends GetView<MypasswordController> {
  Mypassword({super.key});
  @override
  final controller = Get.put(MypasswordController());

  get box => GetStorage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 40,
            child: TextField(
              controller: controller.searchController,
              onChanged: (value) {
                // debounce search

                controller.page.value = 1;

                controller.passwordList.clear();
                controller.getpassword();
              },
              decoration: const InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
        ),
        Obx(
          () => Expanded(
            child: ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.passwordList.length +
                  (controller.passwordLoad.value ? 1 : 0),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index == controller.passwordList.length) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(0.0),
                  
                  child: Column(
                    children: [
                      // const Divider(),
                      
                      ListTile(
                        onLongPress:  (){
                          var password = controller.getSinglePassword(
                              controller.passwordList[index].sId.toString(), index);

                              Get.snackbar("Password", password.toString());

                          //
                          // copy password
                          
                        },
                        dense: true,
                        visualDensity: VisualDensity(vertical: 1),
                        leading: const Icon(Icons.person),
                        title:
                            Text(controller.passwordList[index].userName.toString()),
                        subtitle: InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                                    text: controller.passwordList[index].userName
                                        .toString()))
                                .then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Username copied to clipboard")));
                            });
                          },
                          child: Text(
                              controller.passwordList[index].webSiteName.toString()),
                        ),
                         trailing: IconButton(icon: 
                          const Icon(Icons.arrow_forward_rounded), onPressed: () {
                            Get.to(() => PasswordView(), arguments: index);
                          },
                         ),
                         
                         
                        // trailing: Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     Obx(() => controller.passwordLoadSingle.value == index
                        //         ? const SizedBox(
                        //             height: 20,
                        //             width: 20,
                        //             child: CircularProgressIndicator(),
                        //           )
                        //         : IconButton(
                        //             onPressed: () async {
                        //               final response =
                        //                   await controller.getSinglePassword(
                        //                       controller.passwordList[index].sId
                        //                           .toString(),
                        //                       index);
                        //               log(response.toString());
                
                        //               log(response['password']);
                        //               Clipboard.setData(ClipboardData(
                        //                       text: response['password']))
                        //                   .then((_) {
                        //                 ScaffoldMessenger.of(context).showSnackBar(
                        //                     const SnackBar(
                        //                         content: Text(
                        //                             "Password copied to clipboard")));
                        //               });
                        //             },
                        //             icon: const Icon(Icons.copy))),
                        //     IconButton(
                        //         onPressed: () {
                        //           Get.to(() => PasswordView(), arguments: index);
                        //         },
                        //         icon: const Icon(Icons.edit)),
                        //     // IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                        //   ],
                        // ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class EditDialog extends GetView<MypasswordController> {
  EditDialog({Key? key}) : super(key: key);

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit"),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "d",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Subtitle",
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // save
            box.write("title", ["title", "fdg"]);
          },
          child: const Text("Save"),
        ),
        TextButton(
          onPressed: () {
            print(box.read("title"));

            //  Get.snackbar("title", box.read("title"));

            // cancel
            Get.back();
          },
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
