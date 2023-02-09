import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';

import '../routes/app_routes.dart';
import '../ui/pages/onboarding_page/widgets/screen1_widget.dart';
import '../ui/pages/onboarding_page/widgets/screen2_widget.dart';
import '../ui/pages/onboarding_page/widgets/screen3_widget.dart';

class OnboardingController extends GetxController {
  int index = 0;

  final List<PageModel> onboardingPagesList = [
    PageModel(
      widget: Screen1Widget(),
    ),
    PageModel(
      widget: Screen2Widget(),
    ),
    PageModel(
      widget: Screen3Widget(),
    )
  ];

  goToHome() {
    Get.offNamed(AppRoutes.LOGIN);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    print("periodicTimer.value?.cancel()");
  }
}
