import 'package:flutter/material.dart';
import 'package:snaft/const.dart';
import 'package:snaft/ui/splash/components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  List<Map<String, String>> splashData = [
    {
      "title": "Eat Healthy",
      "subtitle": "Maintaining good health should be the \n primary focus of everyone.",
      "image": "assets/images/splash/splash_snaft_1.png"
    },
    {
      "title": "Healthy Recipes",
      "subtitle": "Browse thousands of healthy recipes \n from all over the world.",
      "image": "assets/images/splash/splash_snaft_2.png"
    },
    {
      "title": "Track Your Health",
      "subtitle": "With amazing inbuilt tools you can \n track your progress.",
      "image": "assets/images/splash/splash_snaft_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            }, 
            child: const Text(
              'Skip',
              style: mainTitle,
            )
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    title: splashData[index]["title"]!,
                    subtitle: splashData[index]["subtitle"]!,
                    image: splashData[index]["image"]!,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                splashData.length,
                (index) => _dotsIndicator(index: index),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadiusSizeMine),
                        ),

                      ),
                      onPressed: () {
                        if (currentPage == splashData.length - 1) {
                          Navigator.pushNamed(context, '/login');
                        } else {
                          _pageController.nextPage(
                            duration: animationDuration,
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: Text(
                        currentPage == splashData.length - 1 ? "Get Started" : "Next",
                        style: buttonBgText
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding * 3)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage == index ? secondaryColor : secondaryColorThin,
      ),
      width: currentPage == index ? 20 : 14,
      height: 10,
      duration: animationDuration,
    );
  }
  }