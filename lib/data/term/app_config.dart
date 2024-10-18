// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppConfig {
  AppConfig._();
  static const phoneNumber = "0912834422";
  static const emailDefault = "ibme.lab@gmail.com";
  static const linkWebSite = "https://lab.ibme.edu.vn";
}

extension GetOrientation on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;
}

extension GetSize on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
}
