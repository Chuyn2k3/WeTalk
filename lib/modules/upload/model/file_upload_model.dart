import 'dart:io';

import 'package:flutter/cupertino.dart';

class UploadFile {
  UploadFile({
    required this.file,
    required this.thumnaill,
    required this.fileName,
    required this.fileSize,
  });

  File file;
  Widget thumnaill;
  String fileName;
  String fileSize;
}
