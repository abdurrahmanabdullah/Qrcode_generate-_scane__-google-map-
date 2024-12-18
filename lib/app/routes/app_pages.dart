import 'package:get/get.dart';
import 'package:qrcode/app/modules/home/views/scan_code.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const ScanCode(),
      binding: HomeBinding(),
    ),
  ];
}