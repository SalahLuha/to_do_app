import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/features/auth/presentation/screens/on_boarding_screens/on_boarding_screens.dart';
import '../../../../../core/utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }
  void navigate(){
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.push(context, MaterialPageRoute(builder: (_)=> OnBoardingScreens(),),);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo),
             const SizedBox(height: 24,),
             Text(
              AppString.appName,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
