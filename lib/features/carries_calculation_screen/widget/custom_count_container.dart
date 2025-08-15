import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:philread74/core/constant/icons.dart';
import 'package:philread74/features/carries_calculation_screen/Riverpod/type_carry_cost.dart';
import '../../../core/theme/theme_extension/app_colors.dart';

class CustomCountContainer extends ConsumerWidget {
  final StateProvider controller;
  final int id;
  const CustomCountContainer({
    super.key,
    required this.controller,
    required this.id
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countController(id));
    final perProductPrice = ref.read(controller.notifier).state;
    // final isReadOnly = (ref.watch(valueProvider) - ref.watch(totalCost) > perProductPrice);
    return Container(
      width: 112.w,
      height: 36.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(width: 1.w, color: AppColors.onPrimary),
        color: AppColors.onSurface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppIcons.minus,),
          Text(count.toString(), style: TextStyle(color: Color(0xFF4A4C56)),),
          SvgPicture.asset(AppIcons.plus),
        ],
      )
    );
  }
}
