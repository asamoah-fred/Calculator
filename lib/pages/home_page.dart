import 'package:calculator/core/viewModels/calculation.dart';
import 'package:calculator/core/viewModels/toggle_theme.dart';
import 'package:calculator/pages/widgets/calculation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ThemeModel themeModel;
  late CalculationImpl calculation;
  @override
  Widget build(BuildContext context) {
    themeModel = context.read<ThemeModel>();
    calculation = context.watch<CalculationImpl>();

    final isLightMode = themeModel.mode == ThemeMode.light;
    final width = MediaQuery.of(context).size.width;

    final showFirstNumber = calculation.firstOperand == 0 ? '' : calculation.firstOperand;
    final showSecondNumber = calculation.secondOperand == 0 ? '' : calculation.secondOperand;
    final showOperator = calculation.operator ?? '';

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 45),
            child: Center(
              child: Container(
                width: 110,
                height: 42,
                decoration: BoxDecoration(
                  color: isLightMode ? Color(0xffF9F9F9) : Color(0xFF292D36),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        themeModel.toggleMode(SelectedTheme.Light);
                      },
                      child: SvgPicture.asset('assets/dark.svg'),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        themeModel.toggleMode(SelectedTheme.Dark);
                      },
                      child: SvgPicture.asset('assets/light.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Flexible(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 24, bottom: 5),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //concat the values
                    Text(
                      "$showFirstNumber$showOperator$showSecondNumber",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "${calculation.result}",
                      style: TextStyle(
                        fontSize: 54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Can extract but for readability and easy understanding of the codebase I will leave it like this.
          Container(
            decoration: BoxDecoration(
              color: isLightMode ? Color(0xffF9F9F9) : Color(0xFF292D36),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      getButton(
                          text: 'AC',
                          onTap: () => clear(),
                          width: width,
                          textColor: Color(0xFF35D5B7)),
                      getButton(
                          text: '+/_', onTap: () {}, width: width, textColor: Color(0xFF35D5B7)),
                      getButton(
                          text: '%', onTap: () {}, width: width, textColor: Color(0xFF35D5B7)),
                      getButton(
                          text: '/',
                          onTap: () => operatorPressed('/'),
                          width: width,
                          textColor: Color(0xFFE96668)),
                    ],
                  ),
                  Row(
                    children: [
                      getButton(
                          text: '7',
                          onTap: () => numberPressed(7),
                          width: width,
                          textColor: isLightMode ? Colors.black : Colors.white),
                      getButton(
                          text: '8',
                          onTap: () => numberPressed(8),
                          width: width,
                          textColor: isLightMode ? Colors.black : Colors.white),
                      getButton(
                          text: '9',
                          onTap: () => numberPressed(9),
                          width: width,
                          textColor: isLightMode ? Colors.black : Colors.white),
                      getButton(
                          text: 'x',
                          onTap: () => operatorPressed('x'),
                          width: width,
                          textColor: Color(0xFFE96668)),
                    ],
                  ),
                  Row(
                    children: [
                      getButton(
                          text: '4',
                          onTap: () => numberPressed(4),
                          width: width,
                          textColor: isLightMode ? Colors.black : Colors.white),
                      getButton(
                          text: '5',
                          onTap: () => numberPressed(5),
                          width: width,
                          textColor: isLightMode ? Colors.black : Colors.white),
                      getButton(
                          text: '6',
                          onTap: () => numberPressed(6),
                          width: width,
                          textColor: isLightMode ? Colors.black : Colors.white),
                      getButton(
                          text: '-',
                          onTap: () => operatorPressed('-'),
                          width: width,
                          textColor: Color(0xFFE96668)),
                    ],
                  ),
                  Row(
                    children: [
                      getButton(
                          text: '1',
                          onTap: () => numberPressed(1),
                          width: width,
                          textColor: isLightMode ? Colors.black : Colors.white),
                      getButton(
                          text: '2',
                          onTap: () => numberPressed(2),
                          width: width,
                          textColor: isLightMode ? Colors.black : Colors.white),
                      getButton(
                          text: '3',
                          onTap: () => numberPressed(3),
                          width: width,
                          textColor: isLightMode ? Colors.black : Colors.white),
                      getButton(
                          text: '+',
                          onTap: () => operatorPressed('+'),
                          width: width,
                          textColor: Color(0xFFE96668))
                    ],
                  ),
                  Row(
                    children: [
                      getButton(
                          text: 'C',
                          onTap: clear,
                          textColor: isLightMode ? Colors.black : Colors.white,
                          width: width),
                      getButton(
                          text: '0',
                          onTap: () => numberPressed(0),
                          width: width,
                          textColor: isLightMode ? Colors.black : Colors.white),
                      getButton(
                          text: '.',
                          onTap: clear,
                          width: width,
                          textColor: isLightMode ? Colors.black : Colors.white),
                      getButton(
                          text: '=',
                          onTap: () => calculateResult(),
                          width: width,
                          textColor: Color(0xFFE96668)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  numberPressed(int number) {
    calculation.numberPressed(number);
  }

  operatorPressed(String operator) {
    calculation.operatorPressed(operator);
    print(operator);
  }

  calculateResult() {
    calculation.calculateResult();
  }

  clear() {
    calculation.clear();
  }
}
