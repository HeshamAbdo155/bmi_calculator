import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    Key? key,
    required this.kColor,
    required this.kIcon,
    required this.kText,
    required this.kOnTap,
  }) : super(key: key);

  final Color kColor;
  final IconData kIcon;
  final String kText;
  final VoidCallback kOnTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: kOnTap,
          child: Card(
            color: kColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(kIcon, color: Colors.black, size: 80.0),
                const SizedBox(height: 15.0),
                Text(
                  kText,
                  style: kTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
