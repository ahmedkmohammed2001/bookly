import 'package:bookly/Featchers/Splash/presentation/views/widgets/SlidingText.dart';
import 'package:bookly/core/utlis/app_router.dart';
import 'package:bookly/core/utlis/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key});

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> sliderAnimation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetsData.logo),
          const SizedBox(
            height: 4,
          ),
          SlidingText(sliderAnimation: sliderAnimation)
        ]);
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    sliderAnimation = Tween<Offset>(begin: const Offset(0, 8), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
    sliderAnimation.addListener(() {
      setState(() {});
    });
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
    
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}
