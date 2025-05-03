import 'package:flutter/material.dart';
import 'package:flutter_ex001/stateful_widgets/app_slider.dart';
import 'package:flutter_ex001/stateful_widgets/app_slider_label.dart';
import 'package:flutter_ex001/theme/app_colors.dart';

enum ColorFormats {hex, rgb}

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
  ColorFormats _currentFormat = ColorFormats.hex;
  String _currentFormatName = 'Hexadecimal';

  String _convertColor(Color color) {
    switch (_currentFormat) {
      case ColorFormats.hex:
        _currentFormatName = 'Hexadecimal';
        return _convertToHex(color);
      case ColorFormats.rgb:
        _currentFormatName = 'RGB';
        return _converToRGB(color);
    }
  }

  void _updateCurrentFormat() {
    setState(() {
      _currentFormat = ColorFormats.values[(_currentFormat.index + 1) % ColorFormats.values.length];
    });
  }


  Color _returnCurrentColor() {
    return Color.fromARGB(
      255,
      int.parse(_redValue.toStringAsFixed(0)),
      int.parse(_greenValue.toStringAsFixed(0)),
      int.parse(_blueValue.toStringAsFixed(0))
    );
  }

  String _convertToHex(Color color) {
    return '#'
      '${(color.r * 255).toInt().toRadixString(16).padLeft(2, '0').toUpperCase()}'
      '${(color.g * 255).toInt().toRadixString(16).padLeft(2, '0').toUpperCase()}'
      '${(color.b * 255).toInt().toRadixString(16).padLeft(2, '0').toUpperCase()}';
  }

  String _converToRGB(Color color) {
    return 'rgb('
      '${(color.r * 255).toStringAsFixed(0)}, '
      '${(color.g * 255).toStringAsFixed(0)}, '
      '${(color.b * 255).toStringAsFixed(0)})';
  }


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
            SizedBox(
              height: panelHeight / 1.4,
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                    child: Center(
                      child: Text(
                        'Painel de Cores',
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 40,
                          fontWeight: FontWeight.w900
                        )
                      ),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 255,
                    height: 255,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadow,
                          blurRadius: 3,
                          spreadRadius: 2
                        )
                      ]
                    ),
                    child: Center(
                      child: Container(
                        width: 230,
                        height: 230,
                        decoration: BoxDecoration(
                          color: _returnCurrentColor(),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadow,
                              blurRadius: 1,
                              spreadRadius: 0
                            )
                          ]
                        ),
                      ),
                    )
                  ),


                  SizedBox(
                    child: Column(

                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 2),
                                color: AppColors.shadow,
                                blurRadius: 2,
                              )
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.all(2),
                            child: SelectableText(
                              _convertColor(_returnCurrentColor()),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                
                                                
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ElevatedButton(
                            onPressed: _updateCurrentFormat,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(10),
                              backgroundColor: AppColors.primaryDark,
                              foregroundColor: AppColors.white,
                              shadowColor: AppColors.black,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              )
                              
                            ),
                            child: Container(
                              padding: EdgeInsets.all(2),
                              child: Text(
                                _currentFormatName,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ),
                        )
                      ],
                    ),
                  )
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
                              AppSliderLabel(label: _redValue, color: AppColors.red),
                              AppSlider(
                                value: _redValue,
                                onChanged: _updateRedValue,
                                color: AppColors.red
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
                              AppSliderLabel(label: _greenValue, color: AppColors.green),
                              AppSlider(
                                value: _greenValue,
                                onChanged: _updateGreenValue,
                                color: AppColors.green
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
                              AppSliderLabel(label: _blueValue, color: AppColors.blue),
                              AppSlider(
                                value: _blueValue,
                                onChanged: _updateBlueValue,
                                color: AppColors.blue
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