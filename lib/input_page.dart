import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets.dart';
import 'const.dart';

enum Gender { male, female }

int currentHeightValue = 180;
int currentWeightValue = 50;
int currentAgeValue = 21;
int bmi;


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender currentGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: IconWidget(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                    color: currentGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    onPress: () {
                      setState(() {
                        currentGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: IconWidget(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                    color: currentGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    onPress: () {
                      setState(() {
                        currentGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(
                    color: activeCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: defaultTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              currentHeightValue.toString(),
                              style: largeTextStyle,
                            ),
                            Text(
                              'cm',
                              style: defaultTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            thumbColor: Colors.blue,
                          ),
                          child: Slider(
                            value: currentHeightValue.toDouble(),
                            min: 120,
                            max: 220,
                            divisions: 100,
                            label: currentHeightValue.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                currentHeightValue = value.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(
                    color: activeCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: defaultTextStyle,
                        ),
                        Text(
                          currentWeightValue.toString(),
                          style: largeTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    currentWeightValue++;
                                  });
                                }),
                            SizedBox(width: 20),
                            CircleButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    currentWeightValue--;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    color: activeCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: defaultTextStyle,
                        ),
                        Text(
                          currentAgeValue.toString(),
                          style: largeTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  currentAgeValue++;
                                });
                              },
                            ),
                            SizedBox(width: 20),
                            CircleButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  currentAgeValue--;
                                });
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
          BottomButton(
              text: 'CALCULATE BMI',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      height: currentHeightValue,
                      weight: currentWeightValue,
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
