import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_calulator/calculator/calculator_logic.dart';
import 'package:neumorphic_calulator/calculator/calculator_view.dart';
import 'package:neumorphic_calulator/calculator/neumorphic_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: kDarkBackgroundColour,
      ),
      theme: ThemeData(
        canvasColor: kBackgroundColour,
        backgroundColor: Color.fromRGBO(231, 240, 247, 1),
        scaffoldBackgroundColor: Color.fromRGBO(231, 240, 247, 1),
        textTheme: TextTheme(
          headline1: GoogleFonts.dmSans(
            textStyle: TextStyle(
              fontSize: 43,
              fontWeight: FontWeight.w900,
              color: Color.fromRGBO(49, 68, 105, 1),
            ),
          ),
          headline4: GoogleFonts.dmSans(
            textStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(49, 68, 105, 1),
            ),
          ),
        ),
      ),
      home: Builder(
        builder: (BuildContext context) {
          final brightnessValue = MediaQuery.of(context).platformBrightness;
          bool isDark = brightnessValue == Brightness.dark;
          final theme = isDark ? darkNeumorphicTheme : lightNeumorphicTheme;
          return MultiProvider(
            providers: [
              ProxyProvider0<NeumorphicTheme>(update: (_, __) => theme),
              ChangeNotifierProvider<Calculator>(create: (_) => Calculator())
            ],
            child: CalculatorView(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
