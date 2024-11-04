import 'package:flutter/material.dart';

class AppColors {
  static const Color loginGradientStart = Color(0xFFfbab66);
  static const Color loginGradientEnd = Color(0xFFf7418c);
  static const Color buttonColor = Colors.white; // Color del texto del botón
}

class AppGradients {
  static const LinearGradient loginBackground = LinearGradient(
    colors: [AppColors.loginGradientStart, AppColors.loginGradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
