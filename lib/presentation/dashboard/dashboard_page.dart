import 'package:alquranku/core/styles.dart';
import 'package:alquranku/core/values/colors.dart';
import 'package:alquranku/data/model/surah_response.dart';
import 'package:alquranku/presentation/dashboard/dashboard_controller.dart';
import 'package:alquranku/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "AlquranKu",
          style: GoogleFonts.poppins(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: RefreshIndicator(
        child: GetBuilder<DashboardController>(
            builder: (DashboardController dashboardController) {
          List<Datum> surah = dashboardController.surahList;
          return dashboardController.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primary,
                ))
              : ListView.builder(
                  itemCount: surah.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(
                            Routes.detail,
                            arguments: surah[index].nomor,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                                      surah[index].nomor.toString(),
                                      style: const TextStyle(
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      surah[index].namaLatin ?? '',
                                      style: Styles.blackTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          surah[index]
                                              .tempatTurun
                                              .toString()
                                              .split('.')
                                              .last,
                                          style: Styles.greyTextStyle.copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Text(' - '),
                                        Text(
                                          surah[index].jumlahAyat.toString(),
                                          style: Styles.greyTextStyle.copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              surah[index].nama ?? '',
                              style: Styles.blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        }),
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
      ),
    );
  }
}
