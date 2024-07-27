part of 'app_pages.dart';

/// used to switch pages
class Routes {
  static const login = _Paths.login;
  static const password_forgoten = _Paths.password_forgoten;
  static const reset_password = _Paths.reset_password;
  static const dashboard = _Paths.dashboard;
  static const paiement = _Paths.paiement;
  static const evenements = _Paths.evenements;
  static const details_evenement = _Paths.details_evenement;
}

/// contains a list of route names.
// made separately to make it easier to manage route naming
class _Paths {
  static const login = '/login';
  static const password_forgoten = '/password_forgoten';
  static const reset_password = '/reset_password';
  static const dashboard = '/dashboard';
  static const paiement = '/paiement';
  static const evenements = '/evenements';
  static const details_evenement = '/details_evenement';

  // Example :
  // static const index = '/';
  // static const splash = '/splash';
  // static const product = '/product';
}
