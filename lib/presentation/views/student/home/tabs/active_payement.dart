import 'package:flutter/material.dart';
import 'package:pay_for_material/core/cores.dart';

import '../../widgets/student_widgets.dart';

class ActivePaymentTab extends StatefulWidget {
  const ActivePaymentTab({super.key});

  @override
  State<ActivePaymentTab> createState() => _ActivePaymentTabState();
}

class _ActivePaymentTabState extends State<ActivePaymentTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppText(
            'Payments',
            color: AppColors.appBlack,
            fontSize: 18,
            fontFamily: FontFamily.outfitMedium,
          ),
          AppText(
            'Manage and pay for manuals and other payment',
            color: AppColors.appBlack,
            fontSize: 12,
            fontFamily: FontFamily.outfitRegular,
          ),
          Spacing.height(16.0),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CardItem(
                  manualDescription: 'Fundamentals of Python',
                  manualName: 'CSC 201',
                  onPayNow: () {},
                  manualPrice: '#1500',
                  isGrey: index % 2 == 0,
                );
              },
              itemCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
