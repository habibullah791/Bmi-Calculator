import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reUseableCard.dart';
import '../components/bottomButton.dart';


class Results extends StatelessWidget {


  const Results({super.key, required this.bmiResults, required this.bmiText, required this.bmiInterPretation});

  final String bmiResults;
  final String bmiText;
  final String bmiInterPretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      backgroundColor: const Color(0xFF0A0E21),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.bottomCenter,
                child: const Text(
                    'Your Result',
                    style: kdigitStyle,
                    textAlign: TextAlign.center,
                ),
              )
          ),
          Expanded(
            flex: 5,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: ReUseableCard(
                  cardColor: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          bmiText.toUpperCase(),
                        style: kresultTextStyle,
                      ),
                      Text(
                        bmiResults,
                        style: kBMITextStyle,
                      ),
                      Text(
                        bmiInterPretation,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],

                  ),
                ),
              )
          ),
          BottomButton(
            title: 'RE-CALCULATE',
            onPress: (){
              Navigator.pop(context);
            },
          )
        ],
      )
    );
  }
}


