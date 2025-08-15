import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philread74/core/theme/theme_extension/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final bool? isCentered;
  final int size;
  final String? text;
  final double? price;
  final bool? both;
  const CustomContainer({
    super.key,
    required this.size,
    this.isCentered,
    this.price,
    this.text,
    this.both
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (size == 1) ? 344.w : (size == 2) ? 216.w : 112.w,
      height: 36.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(width: 1.w, color: AppColors.onPrimary),
        color: AppColors.onSurface,
      ),
      alignment: (isCentered == true) ? Alignment.center : Alignment.centerLeft,
      child: (both == true) ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text ?? "", style: TextStyle(color: Color(0xFF4A4C56)),),
          Text("£${price ?? 0.0}"),
        ],
      ) : (text != null) ? Text(text ?? "") : Text("£${price ?? 0.0}"),
    );
  }
}
