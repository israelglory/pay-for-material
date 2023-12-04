import 'package:flutter/material.dart';

import '../../../../core/cores.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final String icon;

  @override
  Widget build(BuildContext context) {
    return AppRectangle(
      radius: 8,
      padding: const EdgeInsets.all(12),
      color: AppColors.primary,
      width: 48,
      height: 48,
      child: Image.asset(
        icon,
        height: 20,
      ),
    );
  }
}
