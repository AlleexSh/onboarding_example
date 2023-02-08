import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'onboardingContent.dart';
import 'onboardingPage.dart';

late PageController _pageController;
List<OnboardingContent> onboardingContentList = [];
int _pageIndex = 0;

class OnboardingScreen extends StatefulWidget{
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);

  }

  @override
  void dispose (){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return getOnboardingScreen(context);
  }

  MaterialApp getOnboardingScreen(BuildContext context) {
    onboardingContentList = OnboardingContent.getOnboardingContentList();

    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Styles.GetColorOnboarding(),
          body: Center (
            child: Container (
              decoration: const BoxDecoration (
                  color: Color(0xFFb642f5),
              ),
              child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        itemCount: onboardingContentList.length,
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState ((){
                            _pageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) => OnboardingPage(onboardingContentList[index]),
                      ),
                    ),
                    getContainerButton(context),
                  ]
              ),
            ),
          )
      ),
    );
  }
}


Container getContainerButton (BuildContext context) {
  return Container(
    padding: const EdgeInsets.fromLTRB(0, 0, 30,30),
    decoration: const BoxDecoration (
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 0,0),
      child: Row(
        children: [
          ...List.generate(
            onboardingContentList.length,
                (index) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: getDotIndicator(index == _pageIndex),
            ),
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: ()   {
                if (_pageIndex == onboardingContentList.length - 1){
                  // TO DO something
                } else {
                  _pageController.nextPage(
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 400),
                  );
                }
              },
              style: ButtonStyle (
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFb642f5)),
                  alignment: Alignment.center,
                  minimumSize: MaterialStateProperty.all<Size>(const Size(180, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )
                  )
              ),
              child: Row (
                children: const [
                  Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                      )
                  ),
                ],
              )
          )
        ],
      ),
    ),
  );
}

AnimatedContainer getDotIndicator (bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 6,
    width: isActive ? 25 : 10,
    decoration: BoxDecoration (
      color: isActive ? const Color(0xFFb642f5) : const Color(0xFFC0C0C0),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    ),
  );
}
