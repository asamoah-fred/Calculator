import 'package:calculator/core/viewModels/toggle_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorButton extends StatelessWidget {
  CalculatorButton(
      {required this.label,
      required this.onTap,
      required this.size,
      this.backgroundColor = Colors.white,
      this.labelColor = Colors.black});

  final String label;
  final VoidCallback onTap;
  final double size;
  final Color backgroundColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    final themeModel = context.read<ThemeModel>();
    final isLightMode = themeModel.mode == ThemeMode.light;
    return Padding(
        padding: EdgeInsets.all(6),
        child: InkWell(
          onTap: onTap,
          child: Container(
            // width: size,
            // height: size,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              color: isLightMode ? Color(0xffF2F2F2) : Color(0xFF272B33),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(fontSize: 24, color: labelColor),
              ),
            ),
          ),
        ));
  }
}

//A function that returns a widget, specifically CalculatorButton
Widget getButton({
  required String text,
  required VoidCallback onTap,
  required width,
  Color backgroundColor = Colors.white,
  Color textColor = Colors.black,
}) {
  return Expanded(
    child: CalculatorButton(
      label: text,
      onTap: onTap,
      size: width / 4 - 12,
      backgroundColor: backgroundColor,
      labelColor: textColor,
    ),
  );
}
