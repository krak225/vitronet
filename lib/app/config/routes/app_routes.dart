part of 'app_pages.dart';

/// used to switch pages
class Routes {
  static const login = _Paths.login;
  static const dashboard = _Paths.dashboard;
  static const paiement = _Paths.paiement;
}

/// contains a list of route names.
// made separately to make it easier to manage route naming
class _Paths {
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const paiement = '/paiement';

  // Example :
  // static const index = '/';
  // static const splash = '/splash';
  // static const product = '/product';
}
