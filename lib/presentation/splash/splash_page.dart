import 'package:alquranku/core/styles.dart';
import 'package:alquranku/core/values/colors.dart';
import 'package:flutter/material.dart';

class SpalshPage extends StatelessWidget {
  const SpalshPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Text(
          "AlquranKu",
          style: Styles.whiteTextStyle.copyWith(
            fontSize: 26,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
