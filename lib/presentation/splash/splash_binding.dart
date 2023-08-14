import 'package:alquranku/data/services/dio_client.dart';
import 'package:alquranku/presentation/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.put(SplashController());
  }
}
