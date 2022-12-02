import 'package:calculator/core/viewModels/calculation.dart';
import 'package:calculator/core/viewModels/toggle_theme.dart';
import 'package:calculator/pages/home_page.dart';
import 'package:calculator/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>(
          create: (context) => ThemeModel(),
        ),
        ChangeNotifierProvider<CalculationImpl>(
          create: (context) => CalculationImpl(),
        ),
      ],
      child: Consumer<ThemeModel>(
        builder: (_, themeModel, __) {
          print(themeModel.mode);
          return MaterialApp(
            title: 'Calculator',
            themeMode: themeModel.mode,
            theme: lighThemeData(),
            darkTheme: darkThemeData(),
            home: HomePage(),
          );
        },
      ),
    );
  }
}
