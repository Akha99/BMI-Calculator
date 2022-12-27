import 'package:flutter/material.dart';

class AgeWeightWidget extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;

  const AgeWeightWidget(
      {Key? key,
      required this.onChange,
      required this.title,
      required this.initValue,
      required this.min,
      required this.max})
      : super(key: key);

  @override
  State<AgeWeightWidget> createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),

        child: Container(
          height: 100,
          width: 150,
          child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.deepPurple[200]!),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [


                Text(widget.title,
                    style: TextStyle(fontSize: 22.5, color: Colors.grey)),

                SizedBox(
                  height: 10,
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14.9),
                  child: Row(
                    children: [

                      //-
                      InkWell(
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.blue[300],
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            if (counter > widget.min) {
                              counter--;
                            }
                          });
                          widget.onChange(counter);
                        },
                      ),


                      SizedBox(
                        width: 15,
                      ),

                      //For num in the middle og - & +
                      Text(
                        counter.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 15,
                      ),

                      //+
                      InkWell(
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.blue[300],
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            if (counter < widget.max) {
                              counter++;
                            }
                          });
                          widget.onChange(counter);
                        },
                      ),
                    ],
                  ),
                )
              ])),
        ));
  }
}
