import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/src/features/onboarding/presentation/viewmodel/onboarding_viewmodel.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:localization/localization.dart';
import '../../../../../theme.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);
  final viewmodel = OnboardingViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
            children: [
              PageView.builder(
                controller: viewmodel.pageController,
                onPageChanged: viewmodel.selectedPageIndex,
                itemCount: viewmodel.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(viewmodel.onboardingPages[index].imageAsset, height: 200, width: 200),
                      const SizedBox(height: 32),
                      Text(viewmodel.onboardingPages[index].title,
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(viewmodel.onboardingPages[index].description,
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondary,
                          ),
                      ),
                    ]);
                }
              ),
              Positioned(
                bottom: 30,
                left: 165,
                right: 165,
                child: Row(
                  children: List.generate(
                    viewmodel.onboardingPages.length,
                    (index) => Obx(() {
                        return Container(
                          margin: const EdgeInsets.all(4),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: viewmodel.selectedPageIndex.value == index
                              ? AppColors.primaryLight
                              : AppColors.accent,
                            shape: BoxShape.circle
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.primaryLight),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: viewmodel.forwardAction,
                  child: Text(viewmodel.isLastPage ? 'start'.i18n() : 'next'.i18n()),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.primaryLight),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Modular.to.pushNamed('/login');
                },
                  child: Text('skip_onboarding'.i18n()),
                ),
              )              
            ],
          ),
      ),
    );
  }
}