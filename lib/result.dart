// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Result extends StatelessWidget {
  final int resultScore;
  // ignore: non_constant_identifier_names
  final VoidCallback ResetHandler;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  Result(this.resultScore, this.ResetHandler);

  String get resultPhrase {
    var res = 'Congrats';
    if (resultScore <= 5) {
      res = 'Better luck next time !';
    } else if (resultScore > 5) {
      res = 'Good Job';
    }

    return res;
  }

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          // ignore: deprecated_member_use
          RaisedButton(onPressed: ResetHandler, child: Text('Reset'))
        ],
      ),
    );
  }
}
