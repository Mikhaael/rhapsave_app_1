import 'package:flutter/material.dart';

const sPadding = 24.0;
const sSecondaryPadding = sPadding - sPadding / 3;

Widget vSpace([double height = sPadding]) {
  return SizedBox(
    height: height,
  );
}

Widget hSpace([double width = sPadding]) {
  return SizedBox(
    width: width,
  );
}
