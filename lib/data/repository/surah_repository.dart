import 'package:alquranku/core/values/urls.dart';
import 'package:alquranku/data/model/detail_surah_response.dart';
import 'package:alquranku/data/model/surah_response.dart';
import 'package:alquranku/data/services/dio_client.dart';
import 'package:flutter/foundation.dart';

abstract class SurahRepository {
  Future<List<Datum>> getSurah();
  Future<Data?> getDetailSurah({
    required int nomor,
  });
}

class SurahRepositoryImpl implements SurahRepository {
  final DioClient dioClient;
  SurahRepositoryImpl(this.dioClient);

  @override
  Future<List<Datum>> getSurah() async {
    try {
      final result = await dioClient.get(
        Urls.surah,
      );
      SurahResponse res = SurahResponse.fromJson(result);
      return res.data ?? [];
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getCourses: $e, $stackTrace');
      }
      return [];
    }
  }

  @override
  Future<Data?> getDetailSurah({required int nomor}) async {
    try {
      final result = await dioClient.get(Urls.detailSurah(nomor));
      print('API Response: $result'); // Debug print

      if (result is Map<String, dynamic>) {
        DetailSurahResponse res = DetailSurahResponse.fromJson(result);
        return res.data;
      } else {
        print('Unexpected API response format: $result');
        return null; // Handle the error appropriately
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getDetailSurah: $e, $stackTrace');
      }
      return null; // or handle the error appropriately
    }
  }
}
