import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:philread74/core/constant/icons.dart';
import 'package:philread74/features/carries_calculation_screen/Riverpod/carriesCalculation_provider.dart';
import 'package:philread74/features/carries_calculation_screen/Riverpod/type_carry_cost.dart';
import 'package:philread74/features/portion_selection_screen/Riverpod/portionProvider.dart';
import '../../../core/theme/theme_extension/app_colors.dart';

class PredefinedCountContainer extends StatelessWidget {
  final int id;
  const PredefinedCountContainer({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      width: 105.w,
      height: 36.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(width: 1.w, color: AppColors.onPrimary),
        color: AppColors.onSurface,
      ),
      alignment: Alignment.center,
      child: Consumer(
        builder: (_,ref,_) {
          final dollyCount = ref.watch(countController(3));
          int totesCount = dollyCount * 5;
          //ref.read(countController(id).notifier).state = totesCount;
          return Text(
              totesCount.toString(),
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            maxLines: 1,
            style: style.bodyMedium!.copyWith(color: AppColors.freezeColor, fontWeight: FontWeight.w400, fontSize: 12.sp),
          );
        }
      ),
    );
  }
}
