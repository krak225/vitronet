import 'package:hello_depart/app/features/dashboard/views/screens/password_forgoten_screen.dart';

import '../../features/dashboard/bindings/dashboard_binding.dart';
import '../../features/dashboard/views/screens/dashboard_screen.dart';
import 'package:get/get.dart';

import '../../features/dashboard/views/screens/details_evenement_screen.dart';
import '../../features/dashboard/views/screens/login_screen.dart';
import '../../features/dashboard/views/screens/reset_password_screen.dart';
import '../../features/dashboard/views/screens/vetements_screen.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  static const initial = Routes.dashboard;
  static const login = Routes.login;
  static const paiement = Routes.paiement;
  static const password_forgoten = Routes.password_forgoten;
  static const reset_password = Routes.reset_password;
  static const evenements = Routes.evenements;
  static const details_evenement = Routes.details_evenement;

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
    GetPage(
      name: _Paths.password_forgoten,
      page: () => PasswordForgotenScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.reset_password,
      page: () => ResetPasswordScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.evenements,
      page: () => VetementsScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.details_evenement,
      page: () => DetailsEvenementScreen(),
      binding: DashboardBinding(),
    ),
  ];



}
