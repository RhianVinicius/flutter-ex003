

import 'package:flutter/material.dart';
import 'package:flutter_ex001/theme/app_colors.dart';


class AppSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final Color color;

  const AppSlider({
    super.key,
    required this.value,
    required this.onChanged,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: color,
        inactiveTrackColor:  AppColors.greyLight,
        thumbColor: AppColors.white,
        overlayColor: const Color(0x00FFFFFF),
        trackHeight: 10,
        valueIndicatorColor: color,
        valueIndicatorTextStyle: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 10)
      ),
      child: Slider(
        value: value,
        min: 0,
        max: 255,
        divisions: 255,
        label: value.toStringAsFixed(0),
        onChanged: onChanged,
      ),
    );
  }
}