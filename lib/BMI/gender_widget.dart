import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {

  final Function(int) onChange;
  const GenderWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _gender=0;

  final ChoiceChip3DStyle selectedStyle=
  ChoiceChip3DStyle(
      topColor: Colors.grey[200]!,
      backColor: Colors.grey[300]!,
      borderRadius: BorderRadius.circular(15)
  );


  final ChoiceChip3DStyle unselectedStyle=
  ChoiceChip3DStyle(
    topColor: Colors.grey[200]!,
    backColor: Colors.grey[300]!,
    borderRadius: BorderRadius.circular(15)
  );


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          //MALE
          ChoiceChip3D(
            border: Border.all(color: Colors.deepPurple[200]!,),
              style: _gender==1? selectedStyle:unselectedStyle,//ternari operator
              onSelected: (){
              setState(() {
                _gender=1;
              });
              widget.onChange(_gender);
              },
              onUnSelected: (){},
              selected: _gender==1,
              child: Column(
                children: [
                  Image.asset("assets/images/male.png", width: 60, height: 60, ),
                  SizedBox(height: 5,),
                  Text("Male"),
                ],
              )
          ),

          SizedBox(width: 20,),


          //FEMALE
          ChoiceChip3D(
              border: Border.all(color: Colors.deepPurple[200]!),
              style: _gender==2? selectedStyle:unselectedStyle,
              onSelected: (){
                setState(() {
                  _gender=2;
                });
                widget.onChange(_gender);
              },
              onUnSelected: (){},
              selected: _gender==2,
              child: Column(
                children: [
                  Image.asset("assets/images/female.png", width: 60, height: 60,),
                  SizedBox(height: 5,),
                  Text("Female"),
                ],
              )
          )
        ],
      ),
    );
  }
}
