import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philread74/core/theme/theme_extension/app_colors.dart';

class Custombuttons extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final double? width;
  const Custombuttons({super.key,
  required this.title,
  required this.onTap,
  this.width,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 288.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.primary
        ),
        child: Center(child: Text(title,
        style: style.bodyMedium,
        )),
      ),
    );
  }
}