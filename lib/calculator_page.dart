import 'package:calculator/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:calculator/calc_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator/utilities.dart';
import 'package:provider/provider.dart';
import 'package:calculator/constants.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String expression = '';
  String answer = '';

  Widget numberButton({String content, Function onPressed}) {
    return CalcButton(
      childWidget: Text(
        content,
        style: TextStyle(
          fontSize: 30,
          color: Theme.of(context).primaryColor,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      onPressed: () {
        setState(() {
          expression = expression + content + '';
        });
      },
    );
  }

  Widget fontAwesomeButton({IconData data, Function onPressed}) {
    Calculator calculator = Calculator();
    String operator = calculator.findOperator(data);
    return CalcButton(
      childWidget: FaIcon(
        data,
        size: 24,
        color: Theme.of(context).focusColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      onPressed: onPressed ??
          () {
            setState(
              () {
                expression = expression + operator;
              },
            );
          },
    );
  }

  Widget additionalButton({String content, Function onPressed}) {
    return CalcButton(
      childWidget: Text(
        content,
        style: TextStyle(
          fontSize: 30,
          color: Theme.of(context).primaryColorLight,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(15.0),
                        ),
                        foregroundColor: MaterialStateProperty.all(
                            themeNotifier.isDark
                                ? Theme.of(context).highlightColor
                                : Theme.of(context).primaryColor),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).canvasColor),
                        shape: MaterialStateProperty.all(kLightButtonBorder),
                      ),
                      onPressed: () {
                        themeNotifier.isDark = false;
                      },
                      child: const Icon(
                        Icons.wb_sunny_outlined,
                        size: 30,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(18.0),
                        ),
                        foregroundColor: MaterialStateProperty.all(
                            themeNotifier.isDark
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).highlightColor),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).canvasColor),
                        shape: MaterialStateProperty.all(kDarkButtonBorder),
                      ),
                      onPressed: () {
                        themeNotifier.isDark = true;
                      },
                      child: const Icon(
                        FontAwesomeIcons.moon,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 30, 30, 0),
                        child: Text(
                          '$expression ',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          answer,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 20, 30, 0),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        GridView.count(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          crossAxisCount: 4,
                          children: <Widget>[
                            additionalButton(
                              content: 'AC',
                              onPressed: () {
                                setState(
                                  () {
                                    expression = '';
                                    answer = '';
                                  },
                                );
                              },
                            ),
                            additionalButton(
                              content: '+/-',
                              onPressed: () {},
                            ),
                            CalcButton(
                              childWidget: FaIcon(
                                FontAwesomeIcons.percent,
                                size: 24,
                                color: Theme.of(context).primaryColorLight,
                              ),
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                            ),
                            fontAwesomeButton(data: FontAwesomeIcons.divide),
                            numberButton(
                              content: '7',
                            ),
                            numberButton(content: '8'),
                            numberButton(content: '9'),
                            fontAwesomeButton(data: FontAwesomeIcons.times),
                            numberButton(content: '4'),
                            numberButton(content: '5'),
                            numberButton(content: '6'),
                            fontAwesomeButton(
                                data: FontAwesomeIcons.solidWindowMinimize),
                            numberButton(content: '1'),
                            numberButton(content: '2'),
                            numberButton(content: '3'),
                            fontAwesomeButton(data: FontAwesomeIcons.plus),
                            CalcButton(
                              childWidget: Icon(
                                Icons.refresh,
                                size: 35,
                                color: Theme.of(context).primaryColor,
                              ),
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                            ),
                            numberButton(content: '0'),
                            numberButton(content: '.'),
                            fontAwesomeButton(
                              data: FontAwesomeIcons.equals,
                              onPressed: () {
                                Calculator calculator = Calculator();
                                setState(
                                  () {
                                    answer = calculator
                                        .evaluateExpression(expression);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
