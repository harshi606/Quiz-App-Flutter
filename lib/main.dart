// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable, use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static const questions = [
    {
      'Questiontext': 'What is flutter?',
      'answertext': [
        {'Text': 'Cross-platform framework', 'score': 1},
        {'Text': 'Android framework', 'score': 0},
        {'Text': 'IOS Framework', 'score': 0}
      ],
    },
    {
      'Questiontext': 'Which of the following widgets use for layout?',
      'answertext': [
        {'Text': 'Text', 'score': 0},
        {'Text': 'Expanded', 'score': 0},
        {'Text': 'Column', 'score': 1}
      ],
    },
    {
      'Questiontext':
          'Which of these functions contain the code which houses the widgets of your app?',
      'answertext': [
        {'Text': 'build()', 'score': 1},
        {'Text': 'random()', 'score': 0},
        {'Text': 'runApp()', 'score': 0}
      ],
    },
    {
      'Questiontext': 'Flutter uses one code base',
      'answertext': [
        {'Text': 'True', 'score': 1},
        {'Text': 'False', 'score': 0}
      ],
    },
    {
      'Questiontext': 'List different types of widgets available in Flutter?',
      'answertext': [
        {'Text': 'Stateless', 'score': 0},
        {'Text': 'Statefull', 'score': 0},
        {'Text': 'Both', 'score': 1}
      ],
    },
    {
      'Questiontext':
          'What is the name of the command you use to verify you have setup your flutter environment correctly?',
      'answertext': [
        {'Text': 'flutter run', 'score': 0},
        {'Text': 'flutter doctor', 'score': 1},
        {'Text': 'dart export', 'score': 0}
      ],
    },
    {
      'Questiontext': 'Which company developed Flutter?',
      'answertext': [
        {'Text': 'Micosoft', 'score': 0},
        {'Text': 'Google', 'score': 1},
        {'Text': 'Amazon', 'score': 0}
      ],
    },
    {
      'Questiontext': 'Flutter apps are written in?',
      'answertext': [
        {'Text': 'Java', 'score': 0},
        {'Text': 'dart', 'score': 1},
        {'Text': 'C++', 'score': 0}
      ],
    },
    {
      'Questiontext': 'Are stateless widgets mutable or immutable?',
      'answertext': [
        {'Text': 'Mutable', 'score': 0},
        {'Text': 'Immutable', 'score': 1}
      ],
    },
  ];
  var questionindex = 0;
  var total = 0;
  void _resetQuiz() {
    setState(() {
      questionindex = 0;
      total = 0;
    });
  }

  void _answerQuestion(int score) {
    total += score;
    setState(() {
      questionindex = questionindex + 1;
    });

    // ignore: avoid_print
    print(questionindex);
    if (questionindex < questions.length) {
      // ignore: avoid_print
      print("More questions");
    }
  }

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('Quiz App'),
        ),
        // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
        body: questionindex < questions.length
            ? Column(
                // ignore: prefer_const_literals_to_create_immutables, duplicate_ignore
                children: [
                  // ignore: prefer_const_constructors
                  Question(
                    questions[questionindex]['Questiontext'].toString(),
                  ),
                  // ignore: deprecated_member_use
                  ...(questions[questionindex]['answertext']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(() => _answerQuestion(answer['score'] as int),
                        answer['Text'] as String);
                  }).toList()
                ],
              )
            : Result(total, _resetQuiz),
      ),
    );
  }
}
