import 'package:flutter/material.dart';

Widget BannerItem(String desc, Size size) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: AssetImage('assets/images/top_background.png'),
            fit: BoxFit.cover)),
    width: size.width * 0.6,
    height: size.height * 0.08,
    //alignment: Alignment.center,
    //color: Colors.blue,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      SizedBox(
        width: size.width * 0.01,
      ),
      Image.asset(
        'assets/images/logo.png',
        height: size.height * 0.4,
        width: size.width * 0.4,
      ),
      Expanded(
        child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            desc,
            style: TextStyle(
                fontSize: size.width * 0.05,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      SizedBox(
        width: size.width * 0.01,
      ),
    ]),
  );
}

Widget textFormField() {
  return Expanded(
    child: Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: TextFormField(
              //onChanged: search,
              maxLength: 500,
              //controller: _textEditingController,
              // decoration: const InputDecoration(
              //     filled: true,
              //     //fillColor: AppColors.white2,
              //     contentPadding: EdgeInsets.symmetric(vertical: 15),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(30),
              //           bottomLeft: Radius.circular(30)),
              //       borderSide: BorderSide(width: 0.8),
              //     ),
              //     //hintText: AppDeviceTerm.hintTextLookForm,
              //     prefixIcon: Icon(
              //       Icons.search,
              //       size: 30,
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(30),
              //           bottomLeft: Radius.circular(30)),
              //       borderSide: BorderSide(width: 0.8),
              //     ),
              //     focusedBorder: UnderlineInputBorder(
              //       borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(30),
              //           bottomLeft: Radius.circular(30)),
              //       borderSide: BorderSide(
              //         width: 4,
              //         color: Colors.blue,
              //       ),
              //     )),
            ),
          ),
        ),
        // Expanded(

        //   child: Container(
        //       //height: 49.55,
        //       decoration: const BoxDecoration(
        //         borderRadius: BorderRadius.only(
        //             topRight: Radius.circular(30),
        //             bottomRight: Radius.circular(30)),
        //         //color: AppColors.white3,
        //       ),
        //       margin: const EdgeInsets.only(top: 3, right: 20, bottom: 5),
        //       child: TextButton(
        //         child: const Text(
        //           'Tìm kiếm',
        //           style: TextStyle(fontSize: 13, color: Colors.black),
        //         ),
        //         onPressed: () {
        //           setState(() {
        //             //look = true;
        //           });
        //         },
        //       )),
        // ),
      ],
    ),
  );
}
