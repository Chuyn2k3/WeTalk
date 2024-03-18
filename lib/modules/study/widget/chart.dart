
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/data/term/text_style.dart';

class ChartWidget extends StatefulWidget {
  final double percentage;
  const ChartWidget({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  // late Animation<double> _animation;

  // void initAnimation() {
  //   _controller = AnimationController(
  //     vsync: this,
  //     duration: Duration(milliseconds: 1500),
  //   );
  //   _animation = Tween<double>(
  //     begin: 0.0,
  //     end: widget.percentage,
  //   ).animate(_controller);
  //   _controller.forward();
  // }

  @override
  void initState() {
    //initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      // child: AnimatedBuilder(
      //   animation: _animation,
      //   builder: (context, _) => 
        child:Stack(
          children: [
            Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.green,
          width: 15,
        ),
      ),
              ),
            ),
            Center(
                child: Image.asset('assets/images/trophy.png')
            //     Text(
            //   "${(_animation.value * 100).toInt()}%",
            //   style: AppTextStyles.heading,
            // )
            )
          ],
        ),
      //),
    );
  }
}
