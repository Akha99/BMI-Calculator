import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {

  final Function (int) onChange;
  const HeightWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {

  int _height= 150;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 4,
          color: Colors.deepPurple[100],
          shape: RoundedRectangleBorder(
              side:BorderSide(
                color: Colors.deepPurple[100]!
              ),
              borderRadius:BorderRadius.circular(10),
          ),
      child: Column(
        children: [
          Text("Height", style:
          TextStyle(
              fontSize: 27,
              color: Colors.black87,
              fontFamily: "Coolvetica"
          ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_height.toString(),style: TextStyle(fontSize: 30),
              ),
              SizedBox(width: 5,),
              Text("cm", style: TextStyle(fontSize: 20, color: Colors.grey.shade700),)

            ],
          ),
          Slider(
            min: 0,
            max: 280,
            value: _height.toDouble(),
            thumbColor: Colors.yellow,
            onChanged: (value){
              setState(() {
                _height=value.toInt();
              });
              widget.onChange(_height);
            },
          )
        ],
      )),
    );
  }
}
