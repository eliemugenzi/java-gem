import 'package:flutter/material.dart';
import 'package:javagem/utils/colors.dart';

class CustomStyles {
  static final buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
