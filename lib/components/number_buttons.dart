import 'package:flutter/material.dart';

class NumberButton extends StatefulWidget {
  final Size size;
  final String displayText;
  final String number;
  final Function displayNumber;

  NumberButton(
      {required this.size,
      required this.displayText,
      required this.number,
      required this.displayNumber});

  @override
  _NumberButtonState createState() => _NumberButtonState(
      displayText: '',
      size: size,
      number: number,
      displayNumber: displayNumber);
}

class _NumberButtonState extends State<NumberButton> {
  final Size size;
  String displayText;
  final String number;
  Function displayNumber;

  _NumberButtonState(
      {required this.number,
      required this.displayText,
      required this.size,
      required this.displayNumber});

  final Color _textColor = Color(0xFF000000);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => displayNumber(),
      child: Container(
        width: number == '0' ? size.width * 0.4 : size.width * 0.18,
        height: size.height * 0.1,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/number-button.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          number,
          style: TextStyle(
            color: _textColor,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
