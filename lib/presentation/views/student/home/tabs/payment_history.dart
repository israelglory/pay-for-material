import 'package:flutter/material.dart';

import '../../../../../core/cores.dart';
import '../../widgets/student_widgets.dart';

class PaymentHistoryTab extends StatefulWidget {
  const PaymentHistoryTab({super.key});

  @override
  State<PaymentHistoryTab> createState() => _PaymentHistoryTabState();
}

class _PaymentHistoryTabState extends State<PaymentHistoryTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AppText(
            'Payments History',
            color: AppColors.appBlack,
            fontSize: 18,
            fontFamily: FontFamily.outfitMedium,
          ),
          const AppText(
            'Manage your payment history',
            color: AppColors.appBlack,
            fontSize: 12,
            fontFamily: FontFamily.outfitRegular,
          ),
          const Spacing.height(16.0),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return PaymentHistoryCardItem(
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
