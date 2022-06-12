class OnboardingInfo {
  final String title, description, image;

  OnboardingInfo(
      {required this.title, required this.description, required this.image});
}

final List<OnboardingInfo> onboard_data = [
  OnboardingInfo(
      title: "slide 1",
      description: "description 1",
      image: 'assets/logotipo.png'),
  OnboardingInfo(
      title: "slide 2",
      description: "description 2",
      image: 'assets/logotipo.png'),
  OnboardingInfo(
      title: "slide 3",
      description: "description 3",
      image: 'assets/logotipo.png'),
];
