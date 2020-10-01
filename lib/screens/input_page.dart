import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:justforfun/screens/results_page.dart';
import 'package:justforfun/widgets/reusable_card.dart';
import '../widgets/reusable_column.dart';
import '../constants.dart';
import '../widgets/round_icon_button.dart';
import '../widgets/bottom_button.dart';
import 'package:justforfun/calculator_brain.dart';

enum Gender{
  male,
female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height=180;
  int age=20;
  int weight=60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(color: selectedGender==Gender.male?kActiveCardColor:kInactiveCardColor,
                    cardChild: ReusableColumn(text: 'MALE',
                      iconData: FontAwesomeIcons.mars,)
                    ,
                  fn: (){
                    setState(() {
                      selectedGender=Gender.male;
                    });
                  },)
                  ,
                ),
                Expanded(
                  child: ReusableCard(color: selectedGender==Gender.female?kActiveCardColor:kInactiveCardColor,
                  cardChild: ReusableColumn(text: 'FEMALE',
                    iconData: FontAwesomeIcons.venus,)
                    ,
                  fn: (){
                    setState(() {
                      selectedGender=Gender.female;
                    });
                  },)
                  ,
                )
              ],
            ),
          ),
          Expanded(
            child:ReusableCard(color: kActiveCardColor,
              cardChild:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT',style: kTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('$height',style: kNumberTextStyle,),
                      Text('cm',style: kTextStyle,),

                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: kInactiveSlider,
                      activeTrackColor: Colors.white,
                      thumbColor: kButtonColor,
                      overlayColor: Color(0x29eb1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min:120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height=newValue.floor();
                        });
                      },
                    ),
                  )
                ],
              ) ,)
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',style: kTextStyle,),
                      Text('$weight',style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus,fn: (){
                            setState(() {
                              weight=weight>2?weight-1:2;
                            });
                          },),
                          SizedBox(width: 10,),
                          RoundIconButton(icon: FontAwesomeIcons.plus,fn: (){
                            setState(() {
                              weight=weight<200?weight+1:200;
                            });
                          },),
                        ],
                      )
                    ],
                  ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',style: kTextStyle,),
                      Text('$age',style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus,fn: (){
                            setState(() {
                              age=age>0?age-1:0;
                            });
                          },),
                          SizedBox(width: 10,),
                          RoundIconButton(icon: FontAwesomeIcons.plus,fn: (){
                            setState(() {
                              age=age<100?age+1:100;
                            });
                          },),
                        ],
                      )
                    ],
                  ),),
                )
              ],
            ),
          ),
          BottomButton(buttonText: 'CALCULATE',onTap: (){
            CalculatorBrain cal=CalculatorBrain(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(getBMI: cal.getBMI(),getBMIText: cal.getResult(),getBMIInter: cal.getInterpretation(),)));
          },)
        ],
      )
    );
  }
}


