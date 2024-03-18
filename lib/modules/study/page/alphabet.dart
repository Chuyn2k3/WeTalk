import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/study_link_image.dart';
import 'package:flutter_app/modules/study/widget/letters_alphabet.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AlphabetScreen extends StatefulWidget {
  @override
  State<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Bảng chữ cái')),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: size.height*0.01,),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset('assets/images/anhnkt4.png'),
          ),
          Gap(size.height * 0.01),
          Text('Ấn vào để xem video hướng dẫn',style:  GoogleFonts.lato( fontSize: size.width*0.04),),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(30),
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              crossAxisCount: 4, // Number of columns
              children: List.generate(Letters_Alphabet!.length, (index) {
                return InkWell(child: Letter(image:Letters_Alphabet![index],size:size),
                onTap: () {
                  
                },);
              }).toList(),
            ),
          )
        ],
      )),
    );
  }
}
