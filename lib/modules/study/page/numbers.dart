import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/study_link_image.dart';
import 'package:flutter_app/modules/study/widget/letters_alphabet.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberScreen extends StatefulWidget {
  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Bảng chữ số')),
      body: SafeArea(
          child: Column(
        children: [
          Gap(size.height * 0.01),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.asset('assets/images/numbers.jpg'),
          ),
          Gap(size.height * 0.01),
          Text('Ấn vào để xem video hướng dẫn',style:  GoogleFonts.lato( fontSize: size.width*0.04),),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(30),
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              crossAxisCount: 4, // Number of columns
              children: List.generate(Number_List!.length, (index) {
                return Letter(image: Number_List![index], size: size);
              }).toList(),
            ),
          )
        ],
      )),
    );
  }
}
