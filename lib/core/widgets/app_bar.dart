import 'package:flutter/material.dart';

import '../cores.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String? title;

  const MyAppBar({Key? key, this.actions, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title ?? 'Onaolapo Doctor',
                color: AppColors.primary,
                fontFamily: FontFamily.outfitBold,
                fontSize: 20,
              ),
              AppText(
                title ?? 'Matric no: 20210001',
                color: AppColors.primary,
                fontFamily: FontFamily.outfitBold,
                fontSize: 20,
              ),
            ],
          ),
        ],
      ),
      actions: actions,
      backgroundColor: AppColors.appWhite,
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(85);
}
