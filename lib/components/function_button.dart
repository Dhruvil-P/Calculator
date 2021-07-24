import 'package:flutter/material.dart';

class FunctionButton extends StatefulWidget {
  final Size size;
  final String displayText;
  final String value1;
  final String text;
  final Function function;

  FunctionButton({
    required this.displayText,
    required this.value1,
    required this.function,
    required this.size,
    required this.text,
  });

  @override
  _FunctionButtonState createState() => _FunctionButtonState(
        size: size,
        displayText: displayText,
        value1: value1,
        function: function,
        text: text,
      );
}

class _FunctionButtonState extends State<FunctionButton> {
  final Size size;
  String displayText;
  String value1;
  final String text;
  final Function function;

  _FunctionButtonState({
    required this.size,
    required this.displayText,
    required this.value1,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        width: size.width * 0.18,
        height: size.height * 0.1,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: text == '='
                ? AssetImage('assets/images/equals-button.png')
                : AssetImage('assets/images/function-button.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text,
          style: TextStyle(
            color: text == '=' ? Color(0xFFE4E4E4) : Color(0xFF000000),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
