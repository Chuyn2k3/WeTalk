import 'package:flutter/material.dart';

AppBar uploadAppBar() {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 54, 63, 230),
    title: Text('Cung cấp dữ liệu'),
    elevation: 0,
    actions: [
      Container(
        padding: EdgeInsets.all(10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white, // Thay đổi màu ở đây
            ),
            onPressed: () {},
            child: Text(
              'Lưu',
              style: TextStyle(color: Color.fromARGB(255, 54, 63, 230)),
            )),
      )
    ],
  );
}
