import 'package:alquranku/core/styles.dart';
import 'package:alquranku/core/values/colors.dart';
import 'package:alquranku/data/model/detail_surah_response.dart';
import 'package:alquranku/presentation/detail/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPageArgs {
  final String nomor;

  DetailPageArgs({
    required this.nomor,
  });
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    // Call API
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (detailController) {
        Data? detailSurah = detailController.detailSurah;
        return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: AppColors.primary,
              ),
              title: Text(
                detailSurah?.namaLatin ?? '',
                style: Styles.greenTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: AppColors.background,
              elevation: 0,
            ),
            body: detailController.isloading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ))
                : ListView.builder(
                    itemCount: detailSurah?.ayat?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 27,
                                    height: 27,
                                    decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius:
                                            BorderRadius.circular(27 / 2)),
                                    child: Center(
                                      child: Text(
                                        detailSurah!.ayat![index].nomorAyat
                                            .toString(),
                                        style: const TextStyle(
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Flexible(
                                    child: Text(
                                      detailSurah.ayat![index].teksArab ??
                                          'No teksArab',
                                      textAlign: TextAlign.right,
                                      style: Styles.blackTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                detailSurah.ayat![index].teksLatin ??
                                    'No teksLatin',
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ));
      },
    );
  }
}
