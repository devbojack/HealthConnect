import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/image_constants.dart';

Widget updateLoading() => Container(
  width: double.infinity,
  alignment: Alignment.center,
  child: SizedBox(
      height: 60,
      child: Lottie.asset(loadingLottie, fit: BoxFit.contain)),
);