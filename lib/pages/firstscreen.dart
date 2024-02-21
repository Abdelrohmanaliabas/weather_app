import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'there is no weather 😔 start',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          'searching now 🔍',
          style: TextStyle(
            fontSize: 30,
          ),
        )
      ],
    );
  }
}
