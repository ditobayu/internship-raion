part of "pages.dart";

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    "Grow Your\nFinancial Today",
    "Build From\nZero to Freedom",
    "Start Together",
  ];

  List<String> subTitles = [
    "lorem lorem lorem you to\nlorem goal",
    "lorem lorem lorem lorem to\nget all the benefits",
    "lorem lorem lorem from\nzero with our system",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  "assets/img_onboarding3.png",
                  height: 331,
                ),
                Image.asset(
                  "assets/img_onboarding3.png",
                  height: 331,
                ),
                Image.asset(
                  "assets/img_onboarding3.png",
                  height: 331,
                ),
              ],
              options: CarouselOptions(
                  height: 331,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
              carouselController: carouselController,
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    titles[currentIndex],
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: semiBold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Text(
                    subTitles[currentIndex],
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: currentIndex == 2 ? 38 : 50,
                  ),
                  currentIndex == 2
                      ? Column(
                          children: [
                            CustomFilledButton(
                              title: "Masuk",
                              backgroundColor: blueColor,
                              onPressed: () {
                                context.read<PageBloc>().add(GoToLoginPage());
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFilledButton(
                              title: "Daftar",
                              backgroundColor: orangeColor,
                              onPressed: () {
                                context.read<PageBloc>().add(GoToLoginPage());
                              },
                            )
                          ],
                        )
                      : CustomFilledButton(
                          title: "Lanjut",
                          backgroundColor: blueColor,
                          onPressed: () {
                            carouselController.nextPage();
                          })
                  //  Row(
                  //     children: [
                  //       Container(
                  //         height: 12,
                  //         width: 12,
                  //         decoration: BoxDecoration(
                  //           color:
                  //               currentIndex == 0 ? blueColor : greyColor,
                  //           shape: BoxShape.circle,
                  //         ),
                  //         margin: const EdgeInsets.only(right: 10),
                  //       ),
                  //       Container(
                  //         height: 12,
                  //         width: 12,
                  //         decoration: BoxDecoration(
                  //           color:
                  //               currentIndex == 1 ? blueColor : greyColor,
                  //           shape: BoxShape.circle,
                  //         ),
                  //         margin: const EdgeInsets.only(right: 10),
                  //       ),
                  //       Container(
                  //         height: 12,
                  //         width: 12,
                  //         decoration: BoxDecoration(
                  //           color:
                  //               currentIndex == 2 ? blueColor : greyColor,
                  //           shape: BoxShape.circle,
                  //         ),
                  //         margin: const EdgeInsets.only(right: 10),
                  //       ),
                  //       const Spacer(),
                  //       ElevatedButton(
                  //         child: Text(
                  //           "Continue",
                  //         ),
                  //         onPressed: () {
                  //           carouselController.nextPage();
                  //         },
                  //       )
                  //     ],
                  //   ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
