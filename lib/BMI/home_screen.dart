import 'dart:math';

import 'package:bmi_calculator/BMI/age_weight_widget.dart';
import 'package:bmi_calculator/BMI/gender_widget.dart';
import 'package:bmi_calculator/BMI/height_widget.dart';
import 'package:bmi_calculator/BMI/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _gender=0;
  int _height=150;
  int _age=30;
  int _weight=50;
  bool _isFinished=false;
  double _bmiScore=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(

        title: Text(
          "BMI Calculator",
          style: TextStyle(
              fontSize: 36, color: Colors.black, fontFamily: "Coolvetica"),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        elevation: 0,
      ),
      body:
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/wp5.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(12),

            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(),
              child: Column(
                children: [


                  GenderWidget(
                    onChange: (genderVal){
                      _gender=genderVal;
                    },
                  ),


                  HeightWidget(
                    onChange: (heightVal){
                      _height=heightVal;
                  },
                  ),

                  SizedBox(height: 30,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgeWeightWidget(onChange: (ageVal){
                        _age=ageVal;
                      },
                          title: "Age",
                          initValue: 30,
                          min: 0,
                          max: 100
                      ),

                      AgeWeightWidget(onChange: (weightVal){
                        _weight=weightVal;
                      },
                          title: "Weight(KG)",
                          initValue: 50,
                          min: 0,
                          max: 200
                      ),
                    ],
                  ),

                  SizedBox(height: 30,),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                    child: SwipeableButtonView(
                      isFinished: _isFinished,
                        onFinish: () async {
                        await Navigator.push(
                            context, PageTransition(
                            child: ScoreScreen(
                              bmiScore: _bmiScore,
                              age: _age),
                            type: PageTransitionType.fade));
                          setState(() {
                            //CALCULATE BMI HERE
                            _isFinished=false;
                          });
                        },
                        onWaitingProcess: (){
                        calculateBMI();

                        Future.delayed(Duration(seconds: 1),(){
                          setState(() {
                            //CALCULATE BMI HERE
                            _isFinished=true;
                          });
                        });

                        },
                        activeColor: Colors.deepPurple[100]!,
                        buttonWidget: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                        buttonText: "CALCULATE",
                      buttontextstyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500 ),

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void calculateBMI(){
    _bmiScore= _weight/pow(_height/100,2);
  }
}
