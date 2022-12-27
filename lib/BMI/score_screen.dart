
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiScore;
  final int age;

  String? bmiStatus;
  String? bmiInterpretation;//This is the message that i show to userface
  Color? bmiStatusColor;
  ScoreScreen({Key? key, required this.bmiScore, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        centerTitle: true,
        title: Text("BMI Score"),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Card(
          elevation: 12,
          shape: RoundedRectangleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your Score", style: TextStyle(fontSize: 30, color: Colors.deepPurple[400]),),

              SizedBox(height: 10,),

              PrettyGauge(
                gaugeSize: 300,
                minValue: 0,
                maxValue: 40,
                segments: [
                  GaugeSegment("UnderWeight", 18.5, Colors.red),
                  GaugeSegment("Normal", 6.4, Colors.green),
                  GaugeSegment("OverWeight", 5, Colors.orange),
                  GaugeSegment("Obese", 10.1, Colors.pink)
                ],
                valueWidget: Text(bmiScore.toStringAsFixed(1),
                style: TextStyle(fontSize: 40),
                ),
                currentValue: bmiScore.toDouble(),
                needleColor: Colors.deepPurple[300]!,
              ),
              SizedBox(height: 10,),

              Text(bmiStatus!, style: TextStyle(fontSize: 20, color: bmiStatusColor!),),

              SizedBox(height: 10,),

              Text(bmiInterpretation!,
              style: TextStyle(fontSize: 17),
              ),
              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.deepPurple[300],
                      ),
                      child: Text("Re-calculate")),

                  SizedBox(width: 10,),

                  ElevatedButton(onPressed: (){
                    Share.share("Your BMI is ${bmiScore.toStringAsFixed(1)} at age $age");
                  },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.deepPurple[300]
                      ),
                      child: Text("Share")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }



  //BMI CALCULATE
  void setBmiInterpretation(){
    if (bmiScore>30){
        bmiStatus="Obese";
        bmiInterpretation="Do work out and diet to reduce obesity";
        bmiStatusColor= Colors.pink;
    }
    else if (bmiScore>=25){
      bmiStatus="Overweight";
      bmiInterpretation="Do regular exercise to reduce the weight";
      bmiStatusColor= Colors.orange;
    }
    else if (bmiScore>=18.5){
      bmiStatus="Normal";
      bmiInterpretation="Enjoy! you are fit";
      bmiStatusColor= Colors.green;
    }
    else if (bmiScore<18.5){
      bmiStatus="Underweight";
      bmiInterpretation="Try to increase your weight";
      bmiStatusColor= Colors.red;
    }
  }
}
