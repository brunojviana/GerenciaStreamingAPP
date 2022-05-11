import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/onboarding/domain/model/onboarding.dart';
import 'package:localization/localization.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class OnboardingViewModel extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Modular.to.pushNamed('/auth');
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<Onboarding> onboardingPages = [
    Onboarding('lib/assets/images/streaming-online.png', 'manage_subscriptions'.i18n(), 'subscription_description'.i18n()),
    Onboarding('lib/assets/images/aumentando.png', 'spending_controll'.i18n(), 'spending_description'.i18n()),
    Onboarding('lib/assets/images/recomendacao.png', 'recommendations'.i18n(), 'recommendations_description'.i18n())
  ];
}