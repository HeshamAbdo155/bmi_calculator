import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class WeightAgeCard extends StatelessWidget {
  const WeightAgeCard({
    Key? key,
    required this.text,
    required this.num,
    required this.kOnPressedMin,
    required this.kOnPressedPlus,
  }) : super(key: key);

  final String text;
  final int num;
  final VoidCallback kOnPressedMin;
  final VoidCallback kOnPressedPlus;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          color: kCardColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: kTextStyle,
              ),
              Text(
                num.toString(),
                style: kNumStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: kOnPressedMin,
                    child: const Icon(
                      Icons.minimize,
                      color: kCardColor,
                    ),
                    elevation: 2.0,
                    fillColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55.0)),
                    constraints: const BoxConstraints.tightFor(
                        width: 55.0, height: 55.0),
                  ),
                  const SizedBox(width: 20),
                  RawMaterialButton(
                    onPressed: kOnPressedPlus,
                    child: const Icon(
                      Icons.add,
                      color: kCardColor,
                    ),
                    elevation: 2.0,
                    fillColor: Colors.black,
                    shape: const CircleBorder(),
                    constraints: const BoxConstraints.tightFor(
                      width: 55.0,
                      height: 55.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
