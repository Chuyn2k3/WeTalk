import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/constants.dart';


class HomeFunctionCustomCard extends StatefulWidget {
  const HomeFunctionCustomCard(
      {
      required this.size,
      required this.icon,
      required this.title,})
      : super();

  final Size size;
  final Icon icon;
  final String title;

  @override
  _HomeFunctionCustomCardState createState() => _HomeFunctionCustomCardState();
}

class _HomeFunctionCustomCardState extends State<HomeFunctionCustomCard>
    with SingleTickerProviderStateMixin {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height*0.16,
      width: widget.size.width * 0.35,
      decoration: BoxDecoration(
        color: kBgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 0,
            offset: Offset(-3, -3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.icon,
            SizedBox(height: 10),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kBlueColor,
              ),
            ),           
          ],
        ),
      ),
    );
  }
}
