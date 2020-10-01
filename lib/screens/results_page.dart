import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justforfun/constants.dart';
import 'package:justforfun/widgets/bottom_button.dart';
import 'package:justforfun/widgets/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.getBMI,@required this.getBMIText,@required this.getBMIInter});
  final String getBMI;
  final String getBMIText;
  final String getBMIInter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text('Your Result',style: kResultStyle,),
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
            ),
          ),
          Expanded(
            flex: 7,
            child: ReusableCard(color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${getBMIText.toUpperCase()}',style: kResultTextStyle,),
                Text('$getBMI',style: kBMIStyle,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('$getBMIInter',style: kBMITextStyle,textAlign: TextAlign.center,),
                ),
              ],
            ),
            ),
          ),
          BottomButton(buttonText: 'RECALCULATE',onTap: (){
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}
