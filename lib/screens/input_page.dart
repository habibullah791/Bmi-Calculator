import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/iconContent.dart';
import '../components/reUseableCard.dart';
import '../constants.dart';
import 'results.dart';
import '../components/bottomButton.dart';
import '../calculate_BMI.dart';


enum Gender{
  male,
  feMale
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = Gender.male;
  double height = 120;
  int weight = 45;
  int age = 20;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(
          child:  Text('BMI CALCULATOR'),
        ),
        backgroundColor: kactiveCardColor
      ),
      body: Column(
        children: <Widget> [
          Expanded(
            child: Row(
              children:  <Widget>[
                Expanded(
                  child:  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                      },
                    child:  ReUseableCard(
                      cardColor: selectedGender == Gender.male ? kinActiveCardColor : kactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',

                      ),
                    ),
                  ),
                ),
                Expanded(
                  child:  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.feMale;
                      });
                    },
                    child:  ReUseableCard(
                      cardColor: selectedGender == Gender.feMale ? kinActiveCardColor : kactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:  ReUseableCard(
              cardColor: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('HEIGHT', style: klabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toInt().toString(),
                        style: kdigitStyle,
                      ),
                      const Text('cm', style: klabelTextStyle,)
                    ],
                  ),
                  // padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x428d1136),
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      trackHeight: 2,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(
                        value: height,
                        min: 120,
                        max: 220,
                        // mouseCursor: ,

                        onChanged: (double newValue){
                          setState(() {
                            // print(newValue.round());
                            height = newValue;
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:  <Widget>[
                Expanded(
                  child: ReUseableCard(
                    cardColor: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('WEIGHT', style: klabelTextStyle),
                        Text(weight.toString(), style: kdigitStyle,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // FloatingActionButton(onPressed: onPressed)
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReUseableCard(
                    cardColor: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('AGE', style: klabelTextStyle),
                        Text(age.toString(), style: kdigitStyle,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // FloatingActionButton(onPressed: onPressed)
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE',
            onPress: (){
              CalculateBMI calc =  CalculateBMI(
                  weight,
                  height.toInt(),
                  0.0
              );
              Navigator.push(
                  context,
                MaterialPageRoute(
                    builder: (context) => Results(
                        bmiResults: calc.calculateBMI(),
                        bmiText: calc.getResult(),
                        bmiInterPretation: calc.getInterPretation()
                    )
                )
              );
            },
          )
        ],
      )
    );
  }
}

class RoundIconButton extends StatelessWidget {

  const RoundIconButton({super.key, required this.icon, required this.onPress});

  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      constraints: const BoxConstraints.tightFor(
        width: 70.0,
        height: 45.0
      ),
      elevation: 6,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),

      //child
      child: Icon(icon),
    );
  }
}

