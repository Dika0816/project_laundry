import 'package:flutter/material.dart';

class Validate extends StatelessWidget {
  Validate({required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 4.0),
        Text(
          message,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
