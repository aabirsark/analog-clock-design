import 'package:analog_app/core/my_provider.dart';
import 'package:analog_app/screens/home_screen.dart';
import 'package:analog_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyAnalogApp());

class MyAnalogApp extends StatelessWidget {
  const MyAnalogApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyThemeProvider(),
      child: Consumer<MyThemeProvider>(
        builder: (context, theme, child) {
          return MaterialApp(
            title: "Analog App",
            debugShowCheckedModeBanner: false,
            theme: themeData(context),
            darkTheme: darkThemeData(context),
            themeMode: theme.themeMode ? ThemeMode.light : ThemeMode.dark,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
/*
MaterialApp(
      title: "Analog App",
      debugShowCheckedModeBanner: false,
      theme: themeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
*/
