// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vpn_ui/extension/hexToColor.dart';

class TimeDigit extends StatelessWidget {
  const TimeDigit(this.text, {Key? key, required this.width}) : super(key: key);
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(fontSize: 36, color: HexColor.fromHex('#53D29A')),
        textAlign: TextAlign.center,
      ),
    );
  }
}
