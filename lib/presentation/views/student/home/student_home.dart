import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pay_for_material/core/widgets/custom_appbar.dart';
import 'package:pay_for_material/core/widgets/user_avatar.dart';
import 'package:pay_for_material/core/widgets/user_avatar.dart';
import 'package:pay_for_material/presentation/views/auth/matric_verification.dart';
import 'package:pay_for_material/presentation/views/onboarding/intro_page.dart';
import 'package:pay_for_material/presentation/views/student/home/tabs/active_payement.dart';
import 'package:pay_for_material/presentation/views/student/home/tabs/payment_history.dart';

import '../../../../core/cores.dart';

class StudentHome extends HookWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabIndex = useState(0);
    final bottomNavIndex = useState(0);
    List<Widget> children = const [
      ActivePaymentTab(),
      PaymentHistoryTab(),
    ];
    return DefaultTabController(
      length: 3,
      initialIndex: tabIndex.value,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomAppBar(
              onLogout: () {
                navigationService.pushReplacement(const IntroPage());
              },
            ),
            Expanded(
              child: children[bottomNavIndex.value],
            ),
          ],
        )),

        ///Bottom Navigation Bar for controlling the body or home view.
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.sdn600,
            iconSize: 20.0,
            selectedFontSize: 14.0,
            unselectedFontSize: 14.0,
            onTap: (value) => bottomNavIndex.value = value,
            currentIndex: bottomNavIndex.value,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedIconTheme: const IconThemeData(
              color: AppColors.primary,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.payment_rounded),
                // ImageIcon(
                //   AssetImage(
                //     AppAssets.bottomAssessmentIcon,
                //   ),
                // ),
                label: 'Active Payment',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.payment_rounded),
                //ImageIcon(AssetImage(AppAssets.bookIcon)),
                label: 'Payment History',
              ),
            ]),
      ),
    );
  }
}
