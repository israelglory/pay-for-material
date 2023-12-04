import 'package:flutter/material.dart';

class ShadowBox extends StatelessWidget {
  final Widget child;
  const ShadowBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 43),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0A787878),
            blurRadius: 0,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0A787878),
            blurRadius: 21,
            offset: Offset(1, 10),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x07787878),
            blurRadius: 39,
            offset: Offset(5, 39),
            spreadRadius: 0,
          )
        ],
      ),
      child: child,
    );
  }
}
