
import 'package:flutter/material.dart';
import 'package:glamee/core/common/widgets/custom_button.dart';
import 'package:glamee/core/contants/constants.dart';
import 'package:glamee/core/theme/app_palette.dart';
import 'package:glamee/features/auth/presentation/screens/signin_screen.dart';


import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {

    static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const OnboardingScreen(),
        );
      });
  const OnboardingScreen({super.key});
  

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;
  SharedPreferences? prefs;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    pref();
    super.initState();
  }

  void pref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
              '${Constants.assetImg}background.webp',
            ),
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                image: "group.webp",
                title: "Beauty Made Simple Wellness Made Essential",
                content: "Transform Your Look, Transform Your Life, Your Ultimate Desire Awaits Here.",
              ),
              makePage(
                  image: "graph.webp",
                  title: "Track Your Progress, Celebrate Your Success",
                  content:
                      "Stay motivated by watching your transformation unfold. Ready to begin?",
                  button: true,
                  prefs: prefs),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Widget makePage(
      {image, title, content, button = false, SharedPreferences? prefs}) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              Constants.assetImg + image,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            title,
            style: const TextStyle(
                color: AppPalette.gradient1, fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            content,
            style: const TextStyle(
                color: AppPalette.gradient1, fontSize: 15, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          button == false
              ? Container()
              : GestureDetector(
                  onTap: () {
                    // Provider.of<NumberEntryProvider>(context, listen: false)
                    //     .setCount(1);

                    // introApp.num = 1;
                    prefs!.setString('x-auth-token', '');

                    Navigator.pushReplacement(
                        context, SigninScreen.route());
                  },
                  child:  CustomButton( buttonText: "Commençons", onPressed: (){},))
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 8,
        width: isActive ? 30 : 8,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: AppPalette.gradient2, borderRadius: BorderRadius.circular(5)));
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 2; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
