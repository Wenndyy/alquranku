import 'package:alquranku/data/model/detail_surah_response.dart';
import 'package:alquranku/data/repository/surah_repository.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final SurahRepository surahRepository;

  DetailController(this.surahRepository);

  late int nomor;
  Data? detailSurah;
  bool isloading = false;

  @override
  void onInit() {
    super.onInit();

    nomor = Get.arguments as int;
    getDetailSurah();

    update();
  }

  // Change the type to Data?

  Future<void> getDetailSurah() async {
    isloading = true;
    update();
    var result = await surahRepository.getDetailSurah(nomor: nomor);

    detailSurah = result;
    isloading = false;

    update();
  }
}
