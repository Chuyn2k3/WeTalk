import 'package:flutter/material.dart';

Widget TopicStudy(Size size) {
  return Container(
    margin: EdgeInsets.all(8),
    width: size.width*0.9,
    height: size.height*0.06,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 159, 157, 157),
      borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    child: Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: Text(
              'Động vật',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
        Icon(
          Icons.arrow_forward,
          size: 24.0,
        ),
      ],
    )
  );
}
