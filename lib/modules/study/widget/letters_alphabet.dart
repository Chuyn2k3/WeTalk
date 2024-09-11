import 'package:flutter/material.dart';

// Widget Letter(Image image,Size size) {
//   return Container(
//     height: size.height*0.05,
//     width: size.height*0.05,
//     child: image,
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.purple)),
//   );
// }

class Letter extends StatelessWidget {
  const Letter({super.key, required this.image, required this.size});
  final String image;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 116, 68, 220),width: 1.5)),
      child: Image.asset(image,
          height: size.height * 0.02, width: size.height * 0.02),
    );
  }
}
