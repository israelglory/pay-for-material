import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_for_material/core/constants/assets.dart';
import 'package:pay_for_material/core/constants/colors.dart';

class SearchItem extends StatelessWidget {
  final Color? color;
  final TextEditingController controller;
  final String hintText;
  const SearchItem(
      {Key? key, this.color, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: color ?? AppColors.sdn200),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
          )),
          SvgPicture.asset(AppAssets.searchIconSvg),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
