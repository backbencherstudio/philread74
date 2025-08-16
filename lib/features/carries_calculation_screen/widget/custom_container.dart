import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philread74/core/theme/theme_extension/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final bool? isCentered;
  final int size;
  final String? text;
  final String? price;
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
    final style = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: (size == 1) ? 344.w : (size == 2) ? 216.w : 105.w,
      height: (size != 1) ? 36.h : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(width: 1.w, color: AppColors.onPrimary),
        color: AppColors.onSurface,
      ),
      alignment: (isCentered == true) ? Alignment.center : Alignment.centerLeft,
      child: (both == true) ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 260.w,
              child: Text(text ?? "", style: style.bodyMedium?.copyWith(color: AppColors.containerTextColor, fontSize: 12.sp, fontWeight: FontWeight.w400))
          ),
          Text("£$price" ?? "£0.0", style: style.bodyMedium?.copyWith(color: AppColors.containerTextColor, fontSize: 12.sp, fontWeight: FontWeight.w400)),
        ],
      ) : (text != null) ? Text(text ?? "", style: style.bodyMedium?.copyWith(color: AppColors.containerTextColor, fontSize: 12.sp, fontWeight: FontWeight.w400)) : Text("£$price", style: style.bodyMedium?.copyWith(color: AppColors.containerTextColor, fontSize: 12.sp, fontWeight: FontWeight.w400)),
    );
  }
}
