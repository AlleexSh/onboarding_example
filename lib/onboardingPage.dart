import 'package:flutter/material.dart';

import 'onboardingContent.dart';


class OnboardingPage extends StatelessWidget {

  OnboardingContent onboardingContent;

  OnboardingPage(this.onboardingContent, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column (
      children: [
        Expanded(
          child: Image.asset(
            onboardingContent.imageSrc,
            alignment: Alignment.center,
            width: double.infinity,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * onboardingContent.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration (
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
            ),
            border: Border.all(
              width: 0,
              color: Colors.white,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, onboardingContent.bottomPading),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Container(
                  alignment: Alignment.centerLeft,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Text(
                      onboardingContent.title,
                      style: const TextStyle(
                        fontSize: 32,
                        letterSpacing: 1,
                      )
                  ),
                ),
                const Spacer(),
                Text(
                    onboardingContent.text,
                    style: const TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Color(0xFF626262),
                    )
                  //style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
