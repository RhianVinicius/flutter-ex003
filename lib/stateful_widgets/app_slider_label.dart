import 'package:flutter/material.dart';
import 'package:flutter_ex001/theme/app_colors.dart';

class AppSliderLabel extends StatelessWidget {
  final double label;
  final Color color;

  const AppSliderLabel({
    super.key,
    required this.label,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 47,
      height: 25,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 2
          )
        ],
      ),
      child: Center(
        child: Text(
          label.toStringAsFixed(0),
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w900
          ),
        ),
      ),
    );
  }
}