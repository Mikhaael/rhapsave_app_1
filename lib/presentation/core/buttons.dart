import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

primaryButton(
        {required String text,
        required GestureTapCallback onPressed,
        required Color fillColor,
        required Color textColor,
        double leftPadding = 0,
        double rightPadding = 0,
        double bottomPadding = 6,
        double topPadding = 6,
        double borderRadius = 8,
        MainAxisAlignment viewAlignment = MainAxisAlignment.center,
        TextStyle? textStyle,
        FontWeight fontWeight = FontWeight.w500}) =>
    InkWell(
      child: Container(
        height: 40.0,
        padding: EdgeInsets.only(
          left: leftPadding,
          right: rightPadding,
          top: topPadding,
          bottom: bottomPadding,
        ),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: viewAlignment,
          children: [
            Text(
              text,
              style: textStyle ??
                  GoogleFonts.poppins(
                    color: textColor,
                    fontWeight: fontWeight,
                    fontSize: 16.0,
                  ),
            ),
          ],
        ),
      ),
    );
