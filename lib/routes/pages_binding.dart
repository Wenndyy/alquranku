import 'package:alquranku/presentation/dashboard/dashboard_binding.dart';
import 'package:alquranku/presentation/dashboard/dashboard_page.dart';
import 'package:alquranku/presentation/detail/detail_binding.dart';
import 'package:alquranku/presentation/detail/detail_page.dart';
import 'package:alquranku/presentation/splash/splash_binding.dart';
import 'package:alquranku/presentation/splash/splash_page.dart';
import 'package:alquranku/routes/routes.dart';
import 'package:get/get.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SpalshPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.detail,
      page: () => const DetailPage(),
      binding: DetailBinding(),
      arguments: String,
    )
  ];
}
