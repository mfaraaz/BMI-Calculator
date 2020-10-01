import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableColumn extends StatelessWidget {
  final String text;
  final IconData iconData;
  ReusableColumn({@required this.text,this.iconData });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text("${this.text}",style: kTextStyle,)
      ],
    );
  }
}
