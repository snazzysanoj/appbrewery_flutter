import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0x99161629);
const bottomCardColor = Colors.red;

enum Gender { male, female }

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
                  child: CardWidget(color: activeCardColor),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(color: activeCardColor),
                ),
                Expanded(
                  child: CardWidget(color: activeCardColor),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: bottomCardColor,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
