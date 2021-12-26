import 'dart:ui';

import 'package:bmi_calculator/widgets/height.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ageandweight.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

enum GenderEnum {
  FEMALE,
  MALE,
}

class _BmiCalculatorState extends State<BmiCalculator> {
  static const Color activeColor = Color(0xFFF9116E);
  static const Color inactiveColor = Color(0xFF282C4F);
  static var containerColor = inactiveColor;
  static var containerColor1 = inactiveColor;

  maleFemalebutton(GenderEnum data) {
    if (data == GenderEnum.MALE) {
      containerColor1 = inactiveColor;
      if (containerColor == inactiveColor) {
        containerColor = activeColor;
      } else {
        containerColor = inactiveColor;
      }
    }
    if (data == GenderEnum.FEMALE) {
      containerColor = inactiveColor;
      if (containerColor1 == inactiveColor) {
        containerColor1 = activeColor;
      } else {
        containerColor1 = inactiveColor;
      }
    }
  }

  int _weight = 45;
  double _height = 99.0;
  int _age = 20;
  String? result;
  String? helpTask;
  Color? backgroundColor;
  void bmiCalculator() {
    final bmiHeightCm = _height.round();
    final bmiHeightM = bmiHeightCm / 100;
    final bmiWeight = _weight;
    final bmi = bmiWeight / (bmiHeightM * bmiHeightM);
    if (bmi <= 18.5) {
      result = "Under Weight";
      helpTask = "Please!Eat healthy Food.You are under weight";
      backgroundColor = Colors.white;
    } else if (bmi > 18.5 && bmi <= 24.9) {
      result = "Normal";
      helpTask = "wow! Good healthy body";
      backgroundColor = Colors.green;
    } else if (bmi > 24.9 && bmi <= 29.9) {
      result = "Over Weight";
      helpTask = " Try, some Workout and eating healthy food";
      backgroundColor = Colors.yellow;
    } else if (bmi > 29.9 && bmi <= 34.9) {
      result = "Obesity (Class 1)";
      helpTask = "Opps! Try, some hard Workout and regular Exercies";
      backgroundColor = Colors.red.shade700;
    } else if (bmi > 34.9 && bmi <= 39.9) {
      result = "Obesity (Class 2)";
      helpTask = "Please!  you will have to go to gym and diet controll";
      backgroundColor = Colors.red;
    } else if (bmi > 40) {
      result = "Extreme Obesity (Class 3)";
      helpTask = "you are in over weight, diet controll strictly Now!";
      backgroundColor = Color(0xFF7030A0);
    }

    AlertDialog alertDialog = AlertDialog(
      backgroundColor: backgroundColor,
      content: Container(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result.toString(),
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(fontSize: 35),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              helpTask.toString(),
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: TextStyle(fontSize: 26),
              textAlign: TextAlign.center,
            ))
      ],
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleFemalebutton(GenderEnum.MALE);
                      });
                    },
                    child: ExpandedContainer(
                      containerData: ExpandedCard(
                        icon: FontAwesomeIcons.mars,
                        cardText: 'MALE',
                      ),
                      containerColor: containerColor,
                      borderRad:
                          BorderRadius.only(topLeft: Radius.circular(16.0)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleFemalebutton(GenderEnum.FEMALE);
                      });
                    },
                    child: ExpandedContainer(
                      containerData: ExpandedCard(
                        icon: FontAwesomeIcons.venus,
                        cardText: 'FEMALE',
                      ),
                      containerColor: containerColor1,
                      borderRad:
                          BorderRadius.only(topRight: Radius.circular(16.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ExpandedContainer(
              containerColor: Theme.of(context).backgroundColor,
              containerData: HeightExpanded(
                height: _height,
                heightF: (double value) {
                  setState(() {
                    _height = value;
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: ExpandedContainer(
                    borderRad:
                        BorderRadius.only(bottomLeft: Radius.circular(16.0)),
                    containerColor: Theme.of(context).backgroundColor,
                    containerData: AgeWeight(
                        textValue: 'WEIGHT (KG)',
                        intValue: _weight,
                        incrementFunc: () {
                          setState(() {
                            _weight++;
                          });
                        },
                        decrementFunc: () {
                          setState(() {
                            _weight--;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ExpandedContainer(
                        borderRad: BorderRadius.only(
                            bottomRight: Radius.circular(16.0)),
                        containerData: AgeWeight(
                            textValue: 'AGE',
                            intValue: _age,
                            incrementFunc: () {
                              setState(() {
                                _age++;
                              });
                            },
                            decrementFunc: () {
                              setState(() {
                                _age--;
                              });
                            }),
                        containerColor: Theme.of(context).backgroundColor)),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFF9116E),
            ),
            onPressed: bmiCalculator,
            child: Text(
              'CALCULATE YOUR BMI',
              style: TextStyle(fontSize: 22),
            ),
          ),
        )
      ],
    );
  }
}

class ExpandedContainer extends StatelessWidget {
  final Widget? containerData;
  final BorderRadiusGeometry? borderRad;
  final Color containerColor;
  const ExpandedContainer(
      {required this.containerColor, this.containerData, this.borderRad});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: borderRad,
      ),
      child: containerData,
    );
  }
}

class ExpandedCard extends StatelessWidget {
  final String cardText;
  final IconData icon;
  const ExpandedCard({required this.cardText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          size: 66.0,
        ),
        Text(cardText,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
