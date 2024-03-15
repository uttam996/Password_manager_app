
import 'package:get/get.dart';
import 'package:password/app/modules/views/Password_view.dart';

class Routes {
  static const String passwordview = '/passwordview';

}

final getPages =[
  GetPage(name: Routes.passwordview, page:()=> PasswordView())
];