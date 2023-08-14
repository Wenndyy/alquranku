import 'package:alquranku/data/model/surah_response.dart';
import 'package:alquranku/data/repository/surah_repository.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final SurahRepository surahRepository;

  DashboardController(this.surahRepository);
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    getSurah();
    update();
  }

  List<Datum> surahList = [];

  Future<void> getSurah() async {
    isLoading = true;
    List<Datum> result = await surahRepository.getSurah();
    surahList = result;
    isLoading = false;
    update();
  }
}
