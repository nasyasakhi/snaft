import 'package:flutter/material.dart';
import 'package:snaft/size_config.dart';

// =============== COLORS ===============
const primaryColor = Color(0xFF6BC75B);
const secondaryColor = Color(0xFFFF8473);
const secondaryColorThin = Color(0xFFFFC0B8);

const textColor = Color(0xFF333335);
const textColorSmall = Color(0xFF8C8C8C);

// =============== TEXT ===============
const mainTitle = TextStyle(
  color: primaryColor,
  fontSize: 24,
  fontWeight: FontWeight.w600
);

const subMainTitle = TextStyle(
  color: textColorSmall,
  fontSize: 16,
);

var textTitle = TextStyle(
  color: textColor,
  fontSize: getProportionateScreenWidth(24.0),
  fontWeight: FontWeight.w600
);

const subTitle = TextStyle(
  color: textColor,
  fontSize: 22,
  fontWeight: FontWeight.w600
);

const linkText = TextStyle(
  color: secondaryColor,
  fontSize: 16,
);

const cardTitle = TextStyle(
  color: textColor,
  fontSize: 16,
);

const cardText = TextStyle(
  color: textColorSmall,
  fontSize: 14,
);

const buttonBgText = TextStyle(
  color: Colors.white,
  fontSize: 16,
);

// =============== SIZE & DURATION ===============
// Animation Duration
const animationDuration = Duration(milliseconds: 200);

// Value for Padding Size
const defaultPadding = 20.0;

// Border Radius
const borderRadiusSizeMine = 18.0;

// input border 
InputBorder enabledUnderline = const UnderlineInputBorder(
  borderSide: BorderSide(
    width: 1,
    color: textColorSmall
  )
);

InputBorder focusedUnderline = const UnderlineInputBorder(
  borderSide: BorderSide(
    width: 1,
    color: primaryColor
  )
);

InputBorder errorUnderline = const UnderlineInputBorder(
  borderSide: BorderSide(
    width: 1,
    color: Colors.red
  )
);
