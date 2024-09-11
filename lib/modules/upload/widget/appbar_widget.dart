import 'package:flutter/material.dart';

AppBar uploadAppBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 54, 63, 230),
    title: const Text('Cung cấp dữ liệu'),
    elevation: 0,
    actions: [
      Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Thay đổi màu ở đây
            ),
            onPressed: () {},
            child: const Text(
              'Lưu',
              style: TextStyle(color: Color.fromARGB(255, 54, 63, 230)),
            )),
      )
    ],
  );
}
