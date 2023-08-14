import 'package:alquranku/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 2000)).then((value) async {
      await Get.offAllNamed(Routes.dashboard);
    });
  }
}
