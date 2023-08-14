import 'package:alquranku/data/repository/surah_repository.dart';
import 'package:alquranku/data/services/dio_client.dart';
import 'package:alquranku/presentation/detail/detail_controller.dart';
import 'package:get/get.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<SurahRepository>(
        () => SurahRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut(() => DetailController(Get.find<SurahRepository>()));
  }
}
