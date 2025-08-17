import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:philread74/core/constant/icons.dart';
import 'package:philread74/core/constant/padding.dart';
import 'package:philread74/core/theme/theme_extension/app_colors.dart';
import 'package:philread74/core/utils/common_widget/background_screen.dart/background_screen.dart';
import 'package:philread74/features/carries_calculation_screen/Riverpod/type_carry_cost.dart';
import 'package:philread74/features/carries_calculation_screen/widget/custom_container.dart';
import 'package:philread74/features/portion_selection_screen/Riverpod/portionProvider.dart';
import 'package:philread74/features/portion_selection_screen/presentation/widgets/custom_calc_tile.dart';

import '../Riverpod/provider.dart';

class CostCalculationScreen extends StatefulWidget {
  const CostCalculationScreen({super.key});

  @override
  State<CostCalculationScreen> createState() => _CostCalculationScreenState();
}

class _CostCalculationScreenState extends State<CostCalculationScreen> {
  final discountController = TextEditingController();

  @override
  void dispose() {
    discountController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
 @override
  Widget build(BuildContext context) {
    final portionMap = {
      9: {"title": "¼", "icon": AppIcons.onethird, "percentage": 10},
      18: {"title": "½", "icon": AppIcons.halfIcon, "percentage": 7},
      27: {"title": "¾", "icon": AppIcons.quarz, "percentage": 4},
      36: {"title": "Full", "icon": AppIcons.fullIcon, "percentage": 0},
    };

    final style = Theme.of(context).textTheme;

    return BackgroundScreen(
      child: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenHorizontal,
          child: Consumer(
            builder: (_, ref, _) {
              final data = ref.watch(valueProvider);
              final portionData =
                  portionMap[data] ?? {"title": "-", "icon": AppIcons.fullIcon, "percentage": 10};
              final bigCageFinalCost = (ref.read(bigCageCost.notifier).state * ref.read(countController(1).notifier).state).toStringAsFixed(2);
              final smallCageFinalCost = (ref.read(smallCageCost.notifier).state * ref.read(countController(2).notifier).state).toStringAsFixed(2);
              final dollyFinalCost = (ref.read(dollyCost.notifier).state * ref.read(countController(3).notifier).state).toStringAsFixed(2);
              final palletFinalCost = (ref.read(palletCost.notifier).state * ref.read(countController(4).notifier).state).toStringAsFixed(2);
              final totesFinalCost = (ref.read(totesCost.notifier).state * ref.read(countController(5).notifier).state).toStringAsFixed(2);
        
              final netCost = ref.watch(totalCost);
              final disCost = ref.watch(discountProvider);
        
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset(
                        AppIcons.backButton,
                        height: 28.h,
                        width: 28.w,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h,),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Cost of Service & Containers",
                      style: style.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 21.h,),
                  CustomCalcTile(
                    title: portionData["title"] as String,
                    image: portionData["icon"] as String,
                    isSelected: true,
                    width: double.infinity,
                    onTap: () {
                      debugPrint("Selected: ${portionData["title"]}");
                    },
                  ),
                  SizedBox(height: 32.h),
        
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Number of carriers:",
                      style: style.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      CustomContainer(size: 2, text: "Big Cages",),
                      SizedBox(width: 16.w,),
                      CustomContainer(size: 3, text: "£$bigCageFinalCost", isCentered: true,)
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    children: [
                      CustomContainer(size: 2, text: "Small Cages",),
                      SizedBox(width: 16.w,),
                      CustomContainer(size: 3, text: "£$smallCageFinalCost", isCentered: true,)
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    children: [
                      CustomContainer(size: 2, text: "Dollies",),
                      SizedBox(width: 16.w,),
                      CustomContainer(size: 3, text: "£$dollyFinalCost", isCentered: true,)
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    children: [
                      CustomContainer(size: 2, text: "Pallets",),
                      SizedBox(width: 16.w,),
                      CustomContainer(size: 3, text: "£$palletFinalCost", isCentered: true,)
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    children: [
                      CustomContainer(size: 2, text: "Totes",),
                      SizedBox(width: 16.w,),
                      CustomContainer(size: 3, text: "£$totesFinalCost", isCentered: true,)
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  CustomContainer(size: 1, text: "A ${portionData["percentage"]}% extra charge applies for the ${portionData["title"]} portion compared to the full price.", price: netCost.toStringAsFixed(2), both: true,),
                  SizedBox(height: 16.h,),
                  TextFormField(
                    controller: discountController,
                    keyboardType: TextInputType.number,
                    style: style.bodyMedium!.copyWith(color: AppColors.secondary, fontWeight: FontWeight.w300, fontSize: 12.sp),
                    decoration: InputDecoration(
                      hintText: "0.0",
                      hintStyle: style.bodyMedium!.copyWith(color: AppColors.secondary, fontWeight: FontWeight.w300, fontSize: 12.sp),
                      prefix: Text(
                        '£ ',
                        style: style.bodyMedium!.copyWith(color: AppColors.secondary, fontWeight: FontWeight.w300, fontSize: 12.sp),),
                      isDense: true,
                      contentPadding: EdgeInsets.all(10.r),
                      filled: true,
                      fillColor: AppColors.onSurface,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.r),
                        borderSide: BorderSide(width: 1.w, color: AppColors.onPrimary),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.r),
                        borderSide: BorderSide(width: 1.w, color: AppColors.onPrimary),
                      ),
                    ),
                    onChanged: (val) {
                      double parsed = double.tryParse(val) ?? 0.0;
                      if(parsed > netCost) {
                        discountController.text = "";
                      } else {
                        ///discountController.text = parsed.toString();
                        ref.read(discountProvider.notifier).state = parsed;
                      }
                    },
                  ),
                  SizedBox(height: 3.h,),
                  Container(
                    width: double.maxFinite,
                    height: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(width: 1.w, color: AppColors.onPrimary),
                      color: AppColors.onSurface,
                    ),
                    alignment: Alignment.center,
                    child: Text("£ ${(netCost-disCost).toStringAsFixed(2)}", style: style.bodyMedium!.copyWith(color: AppColors.containerTextColor, fontWeight: FontWeight.w400, fontSize: 12.sp),),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
