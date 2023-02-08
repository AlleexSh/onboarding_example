class OnboardingContent {

  String title;
  String imageSrc;
  String text;
  double height;
  double bottomPading;

  OnboardingContent(this.title, this.imageSrc, this.text, [this.height = 0.4, this.bottomPading = 50]);

  static getOnboardingContentList () {

    final List<OnboardingContent> _list = [

      OnboardingContent(
          "What do you think about Flutter?",
          "lib/Images/OnboardingStep1.png",
          "Flutter is an open source framework by Google for multi-platform applications from a single codebase."
      ),

      OnboardingContent(
          "Reach users on every screen",
          "lib/Images/OnboardingStep2.png",
          "Deploy to multiple devices from a single codebase: mobile, web, desktop, and embedded devices."
      ),

      OnboardingContent(
          "Transform your workflow",
          "lib/Images/OnboardingStep3.png",
          "Take control of your codebase with automated testing, "
              "developer tooling, and everything else you need to "
              "build production-quality apps."
      ),

      OnboardingContent(
          "Trusted by many",
          "lib/Images/OnboardingStep4.png",
          "Flutter is supported and used by Google, trusted by well-known "
              "brands around the world, and maintained by a community "
              "of global developers."
      ),


    ];

    return _list;
  }
}
