import 'package:bmi_calculator/components/calculateButton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/mainScreen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.textCalc,
    required this.textResult,
    required this.textInterpretation,
  }) : super(key: key);

  final String textCalc, textResult, textInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: kTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: kCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(textResult,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 40.0,
                        )),
                    Text(textCalc,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 100.0,
                        )),
                    Text(
                      textInterpretation,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: CalculateButton(
              text: 'Re-Calculate',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
