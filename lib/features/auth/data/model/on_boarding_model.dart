import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';

class OnBoardingModel {
  final String imgPath;
  final String title;
  final String subTitle;

  OnBoardingModel(
      {required this.imgPath,
        required this.title,
        required this.subTitle,});
  static List<OnBoardingModel> onBoardingScreens=[
    OnBoardingModel(

      imgPath: AppAssets.on1, title: AppString.onBoardingTitleOne, subTitle: AppString.onBoardingSubTitleOne,
    ),
    OnBoardingModel(
      imgPath: AppAssets.on2, title: AppString.onBoardingTitleTwo, subTitle: AppString.onBoardingSubTitleTwo,
    ),
    OnBoardingModel(
      imgPath: AppAssets.on3, title: AppString.onBoardingTitleThree, subTitle: AppString.onBoardingSubTitleThree,
    ),

  ];
}