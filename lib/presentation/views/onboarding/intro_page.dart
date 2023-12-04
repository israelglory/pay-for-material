import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pay_for_material/core/cores.dart';
import 'package:pay_for_material/presentation/views/auth/matric_verification.dart';

class IntroPage extends StatefulHookWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  void pageNavigator(int index) {
    if (pageController.hasClients) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currIndex = useState(0);
    final List<String> images = [
      AppAssets.sp1,
      AppAssets.sp2,
      AppAssets.sp3,
    ];
    final List<String> greenText = [
      "Payformaterial",
      "Your Transactions",
      "Intuitive Design"
    ];
    final List<String> texts = [
      "Welcome To",
      "Security and convenience of",
      "User-friendly interface and"
    ];
    final List<String> subtexts = [
      'Your ultimate online payment solution designed exclusively for students.',
      'Enjoy the convenience of making online payments with ease and simplicity. No more fumbling with cash',
      'Our user-friendly interface and intuitive design make it effortless to navigate through the payment process',
    ];
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              controller: pageController,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      images[index],
                      height: MediaQuery.of(context).size.height * 0.55,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                    Spacing.height(
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 56.0),
                      child: AppText(
                        texts[index],
                        color: AppColors.black,
                        fontSize: 34,
                        alignment: TextAlign.center,
                        fontFamily: FontFamily.outfitSemiBold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 56.0),
                      child: AppText(
                        greenText[index],
                        color: AppColors.primary,
                        fontSize: 34,
                        alignment: TextAlign.center,
                        fontFamily: FontFamily.outfitSemiBold,
                      ),
                    ),
                    const Spacing.height(16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 61.0),
                      child: AppText(
                        subtexts[index],
                        color: AppColors.black,
                        alignment: TextAlign.center,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacing.height(
                      MediaQuery.of(context).size.height * 0.027,
                    ),
                  ],
                );
              },
              onPageChanged: (index) {
                currIndex.value = index;
              },
            ),
          ),
          ////Buttons

          Visibility(
            visible: currIndex.value != 2,
            child: navButtons(
              currIndex: currIndex.value,
              onNext: () {
                if (currIndex.value != 2) {
                  pageNavigator(currIndex.value + 1);
                }
              },
              onPrev: () {
                if (currIndex.value != 0) {
                  pageNavigator(currIndex.value - 1);
                }
              },
            ),
            replacement: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppButton(
                loading: false,
                onPressed: () {
                  navigationService.pushReplacement(const MatricVerification());
                },
                title: 'Get Started',
              ),
            ),
          ),
          Spacing.height(
            MediaQuery.of(context).size.height * 0.1,
          )
        ],
      ),
    );
  }
}

Widget navButtons(
    {required int currIndex,
    required Function() onNext,
    required Function() onPrev}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 61.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onPrev,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.primary),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
        ),
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: currIndex == 0 ? AppColors.primary : AppColors.appGrey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: currIndex == 1 ? AppColors.primary : AppColors.appGrey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: currIndex == 2 ? AppColors.primary : AppColors.appGrey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onNext,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.primary),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}
