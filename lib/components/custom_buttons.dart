import 'package:calculator/components/function_button.dart';
import 'package:calculator/components/number_buttons.dart';
import 'package:flutter/material.dart';

class CustomLayout extends StatefulWidget {
  final Size size;
  final String displayText;

  CustomLayout({required this.size, required this.displayText});

  @override
  _CustomLayoutState createState() =>
      _CustomLayoutState(size: size, displayText: displayText);
}

class _CustomLayoutState extends State<CustomLayout> {
  final Size size;
  String displayText;

  _CustomLayoutState({required this.displayText, required this.size});

  String value1 = '';
  String value2 = '';
  String v1 = '';

  bool perCheck = false;
  bool addCheck = false;
  bool subCheck = false;
  bool mulCheck = false;
  bool divCheck = false;

  String total = '';
  String add = '';
  String sub = '';
  String mul = '';
  String div = '';

  Future<void> _negativeOrPositive() async {
    setState(() {
      if (displayText == '') {
        return;
      } else if (displayText.contains('%')) {
        v1 = displayText.substring(0, displayText.indexOf('%') + 1);
        displayText = (displayText.substring(
          (displayText.indexOf('%') + 1),
        )).trim();
        print(displayText);
      } else if (displayText.contains('+')) {
        v1 = displayText.substring(0, displayText.indexOf('+') + 1);

        displayText = (displayText.substring(
          (displayText.indexOf('+') + 1),
        )).trim();
        print(displayText);
      } else if (displayText.contains('-')) {
        v1 = displayText.substring(0, displayText.indexOf('-') + 1);

        displayText = (displayText.substring(
          (displayText.lastIndexOf('-') + 1),
        )).trim();
        print(displayText);
      } else if (displayText.contains('*')) {
        v1 = displayText.substring(0, displayText.indexOf('*') + 1);

        displayText = (displayText.substring(
          (displayText.indexOf('*') + 1),
        )).trim();
      } else if (displayText.contains('/')) {
        v1 = displayText.substring(0, displayText.indexOf('/') + 1);

        displayText = (displayText.substring(
          (displayText.indexOf('/') + 1),
        )).trim();
      }
      if (displayText.contains('.')) {
        displayText = '$v1 ${(0 - double.parse(displayText)).toString()}';
        print(value1 + displayText);
      } else {
        displayText = '$v1 ${(0 - int.parse(displayText)).toString()}';
        print(value1 + displayText);
      }
    });
  }

  Future<void> _percentage() async {
    setState(() {
      value2 = (displayText.substring(
        (displayText.indexOf('%') + 1),
      )).trim();
      print(value2);
      if (value1.contains('.') || value2.contains('.')) {
        String total =
            '${((double.parse(value1) / double.parse(value2)) * 100).toString()}';
        print(total);
        displayText = total.length < 15
            ? '${total.substring(0, total.length)} %'
            : '${total.substring(0, 15)} %';
        print(displayText);
      } else {
        String total =
            '${((int.parse(value1) / int.parse(value2)) * 100).toString()}';
        print(total);
        displayText = total.length < 15
            ? '${total.substring(0, total.length)} %'
            : '${total.substring(0, 13)} %';
        print(displayText);
      }
    });
  }

  Future<void> _addition() async {
    setState(() {
      value2 = (displayText.substring(
        (displayText.indexOf('+') + 1),
      ));
      print(value2);
      if (value1.contains('.') || value2.contains('.')) {
        String total = (double.parse(value1) + double.parse(value2)).toString();
        print(total);
        displayText = total.length < 15
            ? '${total.substring(0, total.length)}'
            : '${total.substring(0, 15)}';
        print(displayText);
      } else {
        String total = (int.parse(value1) + int.parse(value2)).toString();
        print(total);
        displayText = total.length < 15
            ? '${total.substring(0, total.length)}'
            : '${total.substring(0, 15)}';
        print(displayText);
      }
    });
  }

  Future<void> _subtraction() async {
    setState(() {
      value2 = (displayText.substring(
        (displayText.lastIndexOf('-') + 1),
      ));
      print(value2);
      if (value1.contains('.') || value2.contains('.')) {
        String total = (double.parse(value1) - double.parse(value2)).toString();
        print(total);
        displayText = total.length < 15
            ? '${total.substring(0, total.length)}'
            : '${total.substring(0, 15)}';
        print(displayText);
      } else {
        String total = (int.parse(value1) - int.parse(value2)).toString();
        print(total);
        displayText = total.length < 15
            ? '${total.substring(0, total.length)}'
            : '${total.substring(0, 15)}';
        print(displayText);
      }
    });
  }

  Future<void> _product() async {
    setState(() {
      value2 = (displayText.substring(
        (displayText.indexOf('*') + 1),
      ));
      print(value2);
      if (value1.contains('.') || value2.contains('.')) {
        String total = (double.parse(value1) * double.parse(value2)).toString();
        print(total);
        displayText = total.length < 15
            ? '${total.substring(0, total.length)}'
            : '${total.substring(0, 15)}';
        print(displayText);
      } else {
        String total = (int.parse(value1) * int.parse(value2)).toString();
        print(total);
        displayText = total.length < 15
            ? '${total.substring(0, total.length)}'
            : '${total.substring(0, 15)}';
        print(displayText);
      }
    });
  }

  Future<void> _division() async {
    setState(() {
      value2 = (displayText.substring(
        (displayText.indexOf('/') + 1),
      ));
      print(value2);
      if (value1.contains('.') || value2.contains('.')) {
        String total = (double.parse(value1) / double.parse(value2)).toString();
        print(total);
        displayText = total.length < 15
            ? '${total.substring(0, total.length)}'
            : '${total.substring(0, 15)}';
        print(displayText);
      } else {
        String total = (int.parse(value1) / int.parse(value2)).toString();
        print(total);
        displayText = total.length < 15
            ? '${total.substring(0, total.length)}'
            : '${total.substring(0, 15)}';
        print(displayText);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onPanUpdate: (details) {
            if (displayText.length == 0) {
              return;
            } else {
              if (details.delta.dx * 0.5 < 0) {
                print(details.delta.dx.floor() * 0.5);
                setState(() {
                  displayText =
                      displayText.substring(0, displayText.length - 1);
                  print(displayText);
                });
              }
            }
          },
          child: Container(
            width: widget.size.width * 0.9,
            height: widget.size.height * 0.1,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/display-bar.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              displayText.length < 30
                  ? displayText
                  : displayText.substring(0, 30),
              style: TextStyle(
                color: Colors.white70,
                fontSize: displayText.length < 15 ? 40 : 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          width: size.width * 0.9,
          height: size.height * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FunctionButton(
                    displayText: displayText,
                    value1: value1,
                    function: () {
                      setState(() {
                        value1 = '';
                        value2 = '';
                        v1 = '';

                        perCheck = false;
                        addCheck = false;
                        subCheck = false;
                        mulCheck = false;
                        divCheck = false;

                        total = '';
                        add = '';
                        sub = '';
                        mul = '';
                        div = '';

                        displayText = '';
                      });
                    },
                    size: size,
                    text: 'AC',
                  ),
                  FunctionButton(
                    displayText: displayText,
                    value1: value1,
                    function: () {
                      _negativeOrPositive();
                    },
                    size: size,
                    text: '+/-',
                  ),
                  FunctionButton(
                    displayText: displayText,
                    value1: value1,
                    function: () {
                      setState(() {
                        if (displayText.contains('%') |
                            displayText.contains('+') |
                            displayText.contains('*') |
                            displayText.contains('/')) {
                          return;
                        } else if (displayText.indexOf('-') > 1) {
                          return;
                        } else if ('-'.allMatches(displayText).length > 1) {
                          return;
                        } else {
                          if (displayText == '') {
                            return;
                          } else {
                            perCheck = true;

                            value1 = displayText;
                            print(value1);

                            displayText += ' % ';
                            print(displayText);
                          }
                        }
                      });
                    },
                    size: size,
                    text: '%',
                  ),
                  FunctionButton(
                    displayText: displayText,
                    value1: value1,
                    function: () {
                      if (perCheck) {
                        _percentage();
                      } else if (addCheck) {
                        _addition();
                      } else if (subCheck) {
                        _subtraction();
                      } else if (mulCheck) {
                        _product();
                      } else if (divCheck) {
                        _division();
                      }
                      setState(() {
                        perCheck =
                            addCheck = subCheck = mulCheck = divCheck = false;
                      });
                    },
                    size: size,
                    text: '=',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  NumberButton(
                    size: size,
                    displayText: displayText,
                    number: '7',
                    displayNumber: () {
                      setState(() {
                        if (displayText == "") {
                          displayText = '7';
                        } else {
                          displayText += '7';
                        }
                      });
                    },
                  ),
                  NumberButton(
                    size: size,
                    displayText: displayText,
                    number: '8',
                    displayNumber: () {
                      setState(() {
                        if (displayText == "") {
                          displayText = '8';
                        } else {
                          displayText += '8';
                        }
                      });
                    },
                  ),
                  NumberButton(
                    size: size,
                    displayText: displayText,
                    number: '9',
                    displayNumber: () {
                      setState(() {
                        if (displayText == "") {
                          displayText = '9';
                        } else {
                          displayText += '9';
                        }
                      });
                    },
                  ),
                  FunctionButton(
                    displayText: displayText,
                    value1: value1,
                    function: () {
                      setState(() {
                        if (displayText.contains('%') |
                            displayText.contains('+') |
                            displayText.contains('*') |
                            displayText.contains('/')) {
                          return;
                        } else if (displayText.indexOf('-') > 1) {
                          return;
                        } else if ('-'.allMatches(displayText).length > 1) {
                          return;
                        } else {
                          if (displayText == '') {
                            return;
                          } else {
                            addCheck = true;

                            value1 = displayText;
                            print(value1);

                            displayText += ' + ';
                          }
                        }
                      });
                    },
                    size: size,
                    text: '+',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  NumberButton(
                    size: size,
                    displayText: displayText,
                    number: '4',
                    displayNumber: () {
                      setState(() {
                        if (displayText == "") {
                          displayText = '4';
                        } else {
                          displayText += '4';
                        }
                      });
                    },
                  ),
                  NumberButton(
                    size: size,
                    displayText: displayText,
                    number: '5',
                    displayNumber: () {
                      setState(() {
                        if (displayText == "") {
                          displayText = '5';
                        } else {
                          displayText += '5';
                        }
                      });
                    },
                  ),
                  NumberButton(
                    size: size,
                    displayText: displayText,
                    number: '6',
                    displayNumber: () {
                      setState(() {
                        if (displayText == "") {
                          displayText = '6';
                        } else {
                          displayText += '6';
                        }
                      });
                    },
                  ),
                  FunctionButton(
                    displayText: displayText,
                    value1: value1,
                    function: () {
                      setState(() {
                        if (displayText.contains('%') |
                            displayText.contains('+') |
                            displayText.contains('*') |
                            displayText.contains('/')) {
                          return;
                        } else if (displayText.indexOf('-') > 1) {
                          return;
                        } else if ('-'.allMatches(displayText).length > 1) {
                          return;
                        } else {
                          if (displayText == '') {
                            return;
                          } else {
                            subCheck = true;

                            value1 = displayText;
                            print(value1);

                            displayText += ' - ';
                            print(displayText);
                          }
                        }
                      });
                    },
                    size: size,
                    text: '-',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  NumberButton(
                    size: size,
                    displayText: displayText,
                    number: '1',
                    displayNumber: () {
                      setState(() {
                        if (displayText == "") {
                          displayText = '1';
                        } else {
                          displayText += '1';
                        }
                      });
                    },
                  ),
                  NumberButton(
                    size: size,
                    displayText: displayText,
                    number: '2',
                    displayNumber: () {
                      setState(() {
                        if (displayText == "") {
                          displayText = '2';
                        } else {
                          displayText += '2';
                        }
                      });
                    },
                  ),
                  NumberButton(
                    size: size,
                    displayText: displayText,
                    number: '3',
                    displayNumber: () {
                      setState(() {
                        if (displayText == "") {
                          displayText = '3';
                        } else {
                          displayText += '3';
                        }
                      });
                    },
                  ),
                  FunctionButton(
                    displayText: displayText,
                    value1: value1,
                    function: () {
                      setState(() {
                        if (displayText.contains('%') |
                            displayText.contains('+') |
                            displayText.contains('*') |
                            displayText.contains('/')) {
                          return;
                        } else if (displayText.indexOf('-') > 1) {
                          return;
                        } else if ('-'.allMatches(displayText).length > 1) {
                          return;
                        } else {
                          if (displayText == '') {
                            return;
                          } else {
                            mulCheck = true;

                            value1 = displayText;
                            print(value1);

                            displayText += ' * ';
                            print(displayText);
                          }
                        }
                      });
                    },
                    size: size,
                    text: '*',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  NumberButton(
                    size: size,
                    displayText: displayText,
                    number: '0',
                    displayNumber: () {
                      setState(() {
                        if (displayText == "") {
                          displayText = '0';
                        } else {
                          displayText += '0';
                        }
                      });
                    },
                  ),
                  NumberButton(
                    size: size,
                    displayText: displayText,
                    number: '.',
                    displayNumber: () {
                      setState(() {
                        if ('.'.allMatches(displayText).length > 1) {
                          return;
                        } else {
                          displayText += '.';
                        }
                      });
                    },
                  ),
                  FunctionButton(
                    displayText: displayText,
                    value1: value1,
                    function: () {
                      setState(() {
                        if (displayText.contains('%') |
                            displayText.contains('+') |
                            displayText.contains('*') |
                            displayText.contains('/')) {
                          return;
                        } else if (displayText.indexOf('-') > 1) {
                          return;
                        } else if ('-'.allMatches(displayText).length > 1) {
                          return;
                        } else {
                          if (displayText == '') {
                            return;
                          } else {
                            divCheck = true;

                            value1 = displayText;
                            print(value1);

                            displayText += ' / ';
                            print(displayText);
                          }
                        }
                      });
                    },
                    size: size,
                    text: '/',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
