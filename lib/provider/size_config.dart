import 'package:flutter/material.dart';


class SizeConfig{
  static MediaQueryData? _mediaQueryData;
  static double? screenHeight;
  static double? screenWidth;
  static double? blockSizeH;
  static double? blockSizeW;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData?.size.height;
    screenWidth = _mediaQueryData?.size.width;
    blockSizeH = screenHeight! / 100;
    blockSizeW = screenWidth! / 100;
  }
}