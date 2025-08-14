import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:philread74/core/theme/theme_extension/app_colors.dart';

class CustomCalcTile extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isSelected;
  final String image;
  const CustomCalcTile({super.key,
  required this.title,
  required this.onTap,
  required this.isSelected,
  required this.image
  });

  @override
  Widget build(BuildContext context) {
        final style = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(24.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color:isSelected ?  AppColors.primary : AppColors.onSurface,
        ),
        child: Column(
          children: [
            SvgPicture.asset(image),
            SizedBox(height: 10.h,),
            Text(title,
              style: style.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color:isSelected? AppColors.onSurface : AppColors.primary,
                  ),
            )
          ],
        ),
      ),
    );
  }
}