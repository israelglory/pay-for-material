import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/cores.dart';

class CardItem extends StatelessWidget {
  final String manualName;
  final String manualDescription;
  final String manualPrice;
  final Function() onPayNow;
  final bool isGrey;
  const CardItem(
      {super.key,
      required this.manualName,
      required this.manualDescription,
      required this.manualPrice,
      required this.onPayNow,
      required this.isGrey});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: isGrey ? AppColors.appGrey : AppColors.appWhite,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                manualName,
                color: AppColors.appBlack,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              const Spacing.height(10.0),
              AppText(
                manualDescription,
                color: AppColors.appBlack,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                manualPrice,
                color: AppColors.appBlack,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              const Spacing.height(10.0),
              GestureDetector(
                onTap: onPayNow,
                child: button(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget button() {
  return Container(
    //width: 79,
    //height: 32,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: AppColors.primary,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Pay now',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}

class PaymentHistoryCardItem extends StatelessWidget {
  final String manualName;
  final String manualDescription;
  final String manualPrice;
  final Function() onPayNow;
  final bool isGrey;
  const PaymentHistoryCardItem(
      {super.key,
      required this.manualName,
      required this.manualDescription,
      required this.manualPrice,
      required this.onPayNow,
      required this.isGrey});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: isGrey ? AppColors.appGrey : AppColors.appWhite,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                manualName,
                color: AppColors.appBlack,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              const Spacing.height(10.0),
              AppText(
                manualDescription,
                color: AppColors.appBlack,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                manualPrice,
                color: AppColors.appBlack,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              const Spacing.height(10.0),
              GestureDetector(
                onTap: onPayNow,
                child: paymentHistorybutton(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget paymentHistorybutton() {
  return Container(
    //width: 79,
    //height: 32,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.primary,
          width: 1,
        )),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.download_outlined,
          color: AppColors.primary,
          size: 14,
        ),
        Spacing.width(4.0),
        AppText(
          'Receipt',
          color: AppColors.primary,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ],
    ),
  );
}
