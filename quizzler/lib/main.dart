import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questions.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

QuestionProcessor questionProcessor = QuestionProcessor();

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
  ];

  Icon correctIcon = Icon(
    Icons.check,
    color: Colors.green,
  );

  Icon wrongIcon = Icon(
    Icons.close,
    color: Colors.red,
  );

  void checkAnswer(bool answer) {
    Icon iconToAdd = wrongIcon;
    if (answer == questionProcessor.getAnswer()) {
      iconToAdd = correctIcon;
    }
    setState(() {
      scoreKeeper.add(iconToAdd);
      questionProcessor.nextQuestion();
    });
    if (questionProcessor.isFinished()) {
      Alert(
          context: context,
          type: AlertType.success,
          title: "Quizzler",
          desc: "Thanks for playing",
          buttons: [
            DialogButton(
              child: Text(
                'Play Again',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ]).show();
      scoreKeeper = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionProcessor.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
