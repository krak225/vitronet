import 'dart:ui';

import 'package:get_storage/get_storage.dart';

import 'app/config/routes/app_pages.dart';
import 'app/config/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/data/services/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  DependecyInjection.init();

  runApp(const VitroNet());
}

class VitroNet extends StatelessWidget {
  const VitroNet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'VitroNet',
      theme: AppTheme.basic,
      initialRoute: AppPages.login,
      getPages: AppPages.routes,
      scrollBehavior: CustomScrollBehaviour(),
      debugShowCheckedModeBanner: false,
    );

  }
}

class CustomScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
