import 'package:flutter/material.dart';

import '../cores.dart';

class CustomAppBar extends StatelessWidget {
  final String? name;
  final String? matricNumber;
  final Function() onLogout;
  const CustomAppBar(
      {super.key, this.name, this.matricNumber, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                name ?? 'Onaolapo Doctor',
                color: AppColors.appBlack,
                fontFamily: FontFamily.outfitMedium,
                fontSize: 14,
              ),
              AppText(
                matricNumber ?? 'Matric no: 20210001',
                color: AppColors.appBlack,
                fontFamily: FontFamily.outfitMedium,
                fontSize: 12,
              ),
            ],
          ),
          GestureDetector(
            onTap: onLogout,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.exit_to_app_rounded,
                  color: AppColors.primary,
                  size: 12,
                ),
                Spacing.width(8.0),
                AppText(
                  'Logout',
                  color: AppColors.primary,
                  fontFamily: FontFamily.outfitMedium,
                  fontSize: 12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
