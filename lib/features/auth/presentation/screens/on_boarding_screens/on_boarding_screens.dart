import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/features/auth/data/model/on_boarding_model.dart';
import 'package:to_do_app/features/task/presentation/screens/home_screen/home_screen.dart';
import 'package:to_do_app/features/task/presentation/screens/widgets/elevated_button_widgets.dart';
import 'package:to_do_app/features/task/presentation/screens/widgets/text_button_widgets.dart';
import '../../../../../core/utils/app_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreens extends StatelessWidget {
  OnBoardingScreens({super.key});

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: controller,
                      itemCount: OnBoardingModel.onBoardingScreens.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            //skip text
                            index != 2
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextButtonWidgets(
                                      text: AppString.skip,
                                      onTap: () {
                                        controller.jumpToPage(2);
                                      },
                                    ),
                                  )
                                : SizedBox(
                                    height: 50.h,
                                  ),
                            SizedBox(
                              height: 16.h,
                            ),

                            //image
                            Image.asset(
                               height: 280.h,
                                width: 280.w,
                                OnBoardingModel
                                    .onBoardingScreens[index].imgPath),
                            SizedBox(
                              height: 16.h,
                            ),

                            //dots
                            SmoothPageIndicator(
                              controller: controller,
                              count: 3,
                              effect: const ExpandingDotsEffect(
                                activeDotColor: AppColors.primary,
                                dotHeight: 10,
                                spacing: 8,
                              ),
                            ),
                            SizedBox(
                              height: 52.h,
                            ),

                            //title
                            Text(
                              OnBoardingModel.onBoardingScreens[index].title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            //sub title
                            Text(
                              OnBoardingModel.onBoardingScreens[index].subTitle,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            SizedBox(
                              height: 90.h,
                            ),
                            //buttons
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //back button
                                index != 0
                                    ? TextButtonWidgets(
                                        text: AppString.back,
                                        onTap: () {
                                          controller.previousPage(
                                              duration: const Duration(
                                                  milliseconds: 1000),
                                              curve: Curves
                                                  .fastLinearToSlowEaseIn);
                                        },
                                      )
                                    : Container(),
                                const Spacer(),
                                //next button
                                index != 2
                                    ? ElevatedButtonWidgets(
                                        text: AppString.next,
                                        onTap: () {
                                          controller.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 1000),
                                              curve: Curves
                                                  .fastLinearToSlowEaseIn);
                                        },
                                      )
                                    : ElevatedButtonWidgets(
                                        //Navigator to home Screen
                                        text: AppString.getStarted,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  const HomeScreen(),
                                            ),
                                          );
                                        },
                                      ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
