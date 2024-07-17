import '../../features/dashboard/bindings/dashboard_binding.dart';
import '../../features/dashboard/bindings/paiement_binding.dart';
import '../../features/dashboard/views/screens/dashboard_screen.dart';
import 'package:get/get.dart';

import '../../features/dashboard/views/screens/login_screen.dart';
import '../../features/dashboard/views/screens/paiement_screen.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  static const initial = Routes.dashboard;
  static const login = Routes.login;
  static const paiement = Routes.paiement;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
