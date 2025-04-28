import 'package:flutter/material.dart';
import 'package:flutter_ex001/theme/app_colors.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent ({super.key});

  @override
  State<HomePageContent> createState() {
    return HomePageContentState();
  }
}


class HomePageContentState extends State<HomePageContent> {
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
              child: Column(
                children: [
                  
                ],
              )
            )
          ],
        );
      }
    );
  }
}