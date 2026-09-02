import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utills/app_assets.dart';
import '../../../core/utills/app_strings.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Image.asset(
          AppAssets.logo,
          height: 100.h,
          width: 100.w,
        ),
      ],
    );
  }
}
