import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/constants.dart';
import 'package:flutter_app/data/term/constants.dart';

class CustomCard1 extends StatefulWidget {
  const CustomCard1(
      {
      required this.size,
      required this.image,
      required this.title,})
      // required this.statusOn,
      // required this.statusOff})
      : super();

  final Size size;
  final Image image;
  final String title;
  // final String statusOn;
  // final String statusOff;

  @override
  _CustomCard1State createState() => _CustomCard1State();
}

class _CustomCard1State extends State<CustomCard1>
    with SingleTickerProviderStateMixin {
  // late AnimationController _animationController;
  // late Animation<Alignment> _animation;
  // bool isChecked = true;

  @override
  void initState() {
    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 350),
    // );

    // _animation = Tween<Alignment>(
    //         begin: Alignment.bottomCenter, end: Alignment.topCenter)
    //     .animate(
    //   CurvedAnimation(
    //     parent: _animationController,
    //     curve: Curves.linear,
    //     reverseCurve: Curves.easeInBack,
    //   ),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height*0.2,
      width: widget.size.width * 0.35,
      decoration: BoxDecoration(
        color: kBgColor,
        borderRadius: BorderRadius.circular(20),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 8,
        //     offset: Offset(3, 3),
        //   ),
        //   BoxShadow(
        //     color: Colors.white,
        //     blurRadius: 0,
        //     offset: Offset(-3, -3),
        //   ),
        //],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.image,
            SizedBox(height: widget.size.height*0.01),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kBlueColor,
              ),
            ),
            // Text(
            //   isChecked ? widget.statusOff : widget.statusOn,
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     color: isChecked ? Colors.grey.withOpacity(0.6) : kGreenColor,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
