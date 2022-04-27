import 'package:bmi_calculator/components/calculateButton.dart';
import 'package:bmi_calculator/components/genderCard.dart';
import 'package:bmi_calculator/components/weightAgeCard.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../Calculation.dart';
import 'resultScreen.dart';

enum Gender { male, female }

String title = 'BMI Calculator';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Gender? gender;
  int height = 180;
  int weight = 80;
  int age = 22;

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  GenderCard(
                    kOnTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    kColor: gender == Gender.male ? Colors.blue : kCardColor,
                    kIcon: Icons.male,
                    kText: 'MALE',
                  ),
                  GenderCard(
                    kOnTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    kColor: gender == Gender.female ? Colors.pink : kCardColor,
                    kIcon: Icons.female,
                    kText: 'FEMALE',
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  color: kCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'HEIGHT',
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumStyle,
                          ),
                          const Text(
                            'Cm',
                            style: kTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.black,
                          inactiveTrackColor: Colors.black45,
                          thumbColor: Colors.amber,
                          overlayColor: Colors.black45,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 13.0),
                        ),
                        child: Slider(
                          min: 120,
                          max: 220,
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  WeightAgeCard(
                    text: 'Weight',
                    num: weight,
                    kOnPressedMin: () {
                      setState(() {
                        if (weight > 30) {
                          weight--;
                        }
                      });
                    },
                    kOnPressedPlus: () {
                      setState(() {
                        if (weight < 200) {
                          weight++;
                        }
                      });
                    },
                  ),
                  WeightAgeCard(
                    text: 'AGE',
                    num: age,
                    kOnPressedMin: () {
                      setState(() {
                        if (age > 1) {
                          age--;
                        }
                      });
                    },
                    kOnPressedPlus: () {
                      setState(() {
                        if (age < 100) {
                          age++;
                        }
                      });
                    },
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: CalculateButton(
                text: 'Calculate BMI',
                onTap: () {
                  Calculation calc = Calculation(
                    kWeight: weight,
                    kHeight: height,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        textCalc: calc.calculateBMI(),
                        textResult: calc.result(),
                        textInterpretation: calc.interpretation(),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
