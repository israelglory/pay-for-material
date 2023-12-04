import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/cores.dart';
import 'create_account.dart';

class AccountTypePage extends HookWidget {
  const AccountTypePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedRole = useState(UserType.educator);
    return Scaffold(
      appBar: const MyAppBar(),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacing.mediumHeight(),
              const AppText(
                'Get Started',
                fontSize: 24,
                color: AppColors.sdn900,
                fontFamily: FontFamily.outfitBold,
              ),
              const Spacing.tinyHeight(),
              const AppText(
                'Select Account Type',
                fontSize: 16,
                color: AppColors.sdn600,
                // fontFamily: FontFamily.outfitRegular,
              ),
              const Spacing.height(64),
              AccountTypeItem(
                selected: selectedRole.value == UserType.educator,
                title: 'Educator',
                subtitle: 'Create an setup assessments',
                icon: Icons.school_outlined,
                onTap: () => selectedRole.value = UserType.educator,
              ),
              const Spacing.mediumHeight(),
              AccountTypeItem(
                selected: selectedRole.value == UserType.student,
                title: 'Student',
                subtitle: 'Register and take assessments',
                icon: Icons.person_outline,
                onTap: () => selectedRole.value = UserType.student,
              ),
              const Spacing.largeHeight(),
              AppButton(
                onPressed: () {
                  navigationService.pushReplacement(
                    CreateAccountPage(role: selectedRole.value),
                  );
                },
                title: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountTypeItem extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String title, subtitle;
  final Function()? onTap;
  const AccountTypeItem({
    Key? key,
    required this.selected,
    required this.title,
    required this.subtitle,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AppRectangle(
        radius: 8,
        color: selected ? AppColors.primary : AppColors.white,
        borderColor: selected ? AppColors.primary : AppColors.sdn200,
        padding: const EdgeInsets.all(20),
        shadow: selected
            ? const BoxShadow(color: AppColors.primary, blurRadius: 10)
            : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacing.mediumHeight(),
                  Icon(
                    icon,
                    size: 40,
                    color: selected ? AppColors.primary : AppColors.sdn600,
                  ),
                  const Spacing.mediumHeight(),
                  AppText(
                    title,
                    color: AppColors.sdn900,
                    fontFamily: selected
                        ? FontFamily.outfitSemiBold
                        : FontFamily.outfitMedium,
                    fontSize: 20,
                  ),
                  const Spacing.tinyHeight(),
                  AppText(
                    subtitle,
                    color: AppColors.sdn600,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
            selected
                ? const DoneIcon(
                    size: 32,
                    color: AppColors.primary,
                  )
                : const AppRectangle(
                    color: AppColors.white,
                    radius: 200,
                    borderColor: AppColors.sdn200,
                    height: 32,
                    width: 32,
                  )
          ],
        ),
      ),
    );
  }
}
