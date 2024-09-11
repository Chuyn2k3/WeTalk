import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:tflite_plugin/src/tfite_object_detection_api_model.dart';

class BndBox extends StatelessWidget {
  final List<Recognition> results;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;


  const BndBox(this.results, this.previewH, this.previewW, this.screenH, this.screenW, {super.key}
      );

  @override
  Widget build(BuildContext context) {
    List<Widget> renderBoxes() {
      return results.map((re) {
        var x0 = re.location.left;
        var w0 =  re.location.right;
        var y0 =  re.location.top;
        var h0 =  re.location.bottom;
        var scaleW, scaleH, x, y, w, h;

        if (screenH / screenW > previewH / previewW) {
          scaleW = screenH / previewH * previewW;
          scaleH = screenH;
          var difW = (scaleW - screenW) / scaleW;
          x = (x0 - difW / 2) * scaleW;
          w = w0 * scaleW;
          if (x0 < difW / 2) w -= (difW / 2 - x0) * scaleW;
          y = y0 * scaleH;
          h = h0 * scaleH;
        } else {
          scaleH = screenW / previewW * previewH;
          scaleW = screenW;
          var difH = (scaleH - screenH) / scaleH;
          x = x0 * scaleW;
          w = w0 * scaleW;
          y = (y0 - difH / 2) * scaleH;
          h = h0 * scaleH;
          if (y0 < difH / 2) h -= (difH / 2 - y0) * scaleH;
        }

        return Positioned(
          left: math.max(0, x),
          top: math.max(0, y),
          width: w,
          height: h,
          child: Container(
            padding: const EdgeInsets.only(top: 5.0, left: 5.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromRGBO(37, 213, 253, 1.0),
                width: 3.0,
              ),
            ),
            child: Text(
              "${re.id} ${(re.confidence * 29).toStringAsFixed(0)}%",
              style: const TextStyle(
                color: Color.fromRGBO(37, 213, 253, 1.0),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList();
    }

    List<Widget> renderStrings() {
      double offset = -10;
      return results.map((re) {
        offset = offset + 14;
        return Positioned(
          left: 10,
          top: offset,
          width: screenW,
          height: screenH,
          child: Text(
            "${re.title} ${(re.confidence)}%",
            style: const TextStyle(
              color: Color.fromRGBO(37, 213, 253, 1.0),
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList();
    }

    // List<Widget> _renderKeypoints() {
    //   var lists = <Widget>[];
    //   results.forEach((re) {
    //     var list = re["keypoints"].values.map<Widget>((k) {
    //       var _x = k["x"];
    //       var _y = k["y"];
    //       var scaleW, scaleH, x, y;

    //       if (screenH / screenW > previewH / previewW) {
    //         scaleW = screenH / previewH * previewW;
    //         scaleH = screenH;
    //         var difW = (scaleW - screenW) / scaleW;
    //         x = (_x - difW / 2) * scaleW;
    //         y = _y * scaleH;
    //       } else {
    //         scaleH = screenW / previewW * previewH;
    //         scaleW = screenW;
    //         var difH = (scaleH - screenH) / scaleH;
    //         x = _x * scaleW;
    //         y = (_y - difH / 2) * scaleH;
    //       }
    //       return Positioned(
    //         left: x - 6,
    //         top: y - 6,
    //         width: 100,
    //         height: 12,
    //         child: Container(
    //           child: Text(
    //             "● ${k["part"]}",
    //             style: TextStyle(
    //               color: Color.fromRGBO(37, 213, 253, 1.0),
    //               fontSize: 12.0,
    //             ),
    //           ),
    //         ),
    //       );
    //     }).toList();

    //     lists..addAll(list);
    //   });

    //   return lists;
    // }

    return Column(
      children: renderStrings(),
    );
  }
}
