import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  BottomButton({@required this.buttonText,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: Center(child: Text('${this.buttonText}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
        color: kButtonColor,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        height: kBottomButtonHeight,
      ),
    );
  }
}
