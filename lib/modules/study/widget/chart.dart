import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final double percentage;
  const ChartWidget({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    //initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,

      child: Stack(
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
          Center(child: Image.asset('assets/images/trophy.png'))
        ],
      ),
      //),
    );
  }
}
