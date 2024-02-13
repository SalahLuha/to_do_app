import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnBoardingScreens extends StatelessWidget {
   OnBoardingScreens({super.key});

 PageController controller =  PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(controller: controller,itemCount: 3,itemBuilder:(context, index) {
                  return Column(
                    children: [ //skip text
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          child: Text(
                            AppString.skip,
                            style: GoogleFonts.lato(
                              color: Colors.white.withOpacity(.44),
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 16,),
                
                
                      //image
                      Image.asset(AppAssets.on1),
                      const SizedBox(height: 16,),
                
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
                      const SizedBox(height: 52,),
                
                
                      //title
                      Text(
                        AppString.onBoardingTitleOne,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      //sub title
                      Text(
                        AppString.onBoardingSubTitleOne,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 100,),
                    ],
                  );
                } ),
              ),

              //buttons
              Row(
                children: [
                  //back button
                  TextButton(
                    child: Text(
                      AppString.back,
                      style: GoogleFonts.lato(
                        color: Colors.white.withOpacity(.44),
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  //next button
                  ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        AppString.next,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
