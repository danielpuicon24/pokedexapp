import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';

class CustomInputLoadingInput extends StatelessWidget {
  const CustomInputLoadingInput({
    super.key,
    this.size = 15,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        backgroundColor: AppColors().colorWhite,
        color: AppColors.primary600,
        strokeCap: StrokeCap.round,
        strokeWidth: 2,
      ),
    );
  }
}
