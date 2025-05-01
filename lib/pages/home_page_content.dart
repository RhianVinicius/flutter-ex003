import 'package:flutter/material.dart';
import 'package:flutter_ex001/stateful_widgets/app_slider.dart';
import 'package:flutter_ex001/stateful_widgets/app_slider_label.dart';
import 'package:flutter_ex001/theme/app_colors.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent ({super.key});

  @override
  State<HomePageContent> createState() {
    return HomePageContentState();
  }
}


class HomePageContentState extends State<HomePageContent> {
  double _redValue = 0;
  double _greenValue = 0;
  double _blueValue = 0;

  void _updateRedValue(double newValue) {
    setState(() {
      _redValue = newValue;
    });
  }

  void _updateGreenValue(double newValue) {
    setState(() {
      _greenValue = newValue;
    });
  }

  void _updateBlueValue(double newValue) {
    setState(() {
      _blueValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double panelHeight = constraints.maxHeight;

        return Column(
          children: [
            Container(
              height: panelHeight / 2,
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    color: AppColors.white,
                    child: Center(
                      child: Container(
                        width: 230,
                        height: 230,
                        color: AppColors.grey,
                      ),
                    )
                  ),
                  Text("Cor")
                ],
              )
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double totalHeight = constraints.maxHeight; 

                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: totalHeight / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppSliderLabel(label: _redValue, color: AppColors.primary),
                              AppSlider(
                                value: _redValue,
                                onChanged: _updateRedValue,
                                color: AppColors.primary
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: totalHeight / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppSliderLabel(label: _greenValue, color: AppColors.primary),
                              AppSlider(
                                value: _greenValue,
                                onChanged: _updateGreenValue,
                                color: AppColors.primary
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: totalHeight / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppSliderLabel(label: _blueValue, color: AppColors.primary),
                              AppSlider(
                                value: _blueValue,
                                onChanged: _updateBlueValue,
                                color: AppColors.primary
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            )
          ],
        );
      }
    );
  }
}