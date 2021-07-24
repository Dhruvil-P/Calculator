import 'package:calculator/components/custom_buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Color _primaryColor = Color(0xFF444444);

  String _displayText = TextEditingController().text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: _primaryColor,
          ),
          child: CustomLayout(
            size: size,
            displayText: _displayText,
          ),
        ),
      ),
    );
  }
}
