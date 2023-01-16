import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
            child: Center(
        child: Text('Onboarding'),
      ),
    );
  }
}
