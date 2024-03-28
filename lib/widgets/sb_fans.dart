import 'package:flutter/material.dart';
import 'package:healthconnect/constants/image_constants.dart';


Widget sbFans(double mHeight) => SizedBox(
    height: mHeight * 20,
    width: double.infinity,
    child: const Align(
      alignment: Alignment.bottomRight,
      child: Image(
        image: AssetImage(sbFansImage),
        fit: BoxFit.contain,
      ),
    )
);