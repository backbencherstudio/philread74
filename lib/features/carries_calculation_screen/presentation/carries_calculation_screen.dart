  import 'package:flutter/material.dart';
  import 'package:flutter_riverpod/flutter_riverpod.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:flutter_svg/svg.dart';
  import 'package:go_router/go_router.dart';
  import 'package:philread74/core/constant/icons.dart';
  import 'package:philread74/core/constant/padding.dart';
  import 'package:philread74/core/routes/route_name.dart';
  import 'package:philread74/core/theme/theme_extension/app_colors.dart';
  import 'package:philread74/core/utils/common_widget/background_screen.dart/background_screen.dart';
  import 'package:philread74/features/carries_calculation_screen/Riverpod/carriesCalculation_provider.dart';
  import 'package:philread74/features/carries_calculation_screen/Riverpod/type_carry_cost.dart';
  import 'package:philread74/features/carries_calculation_screen/widget/custom_container.dart';
  import 'package:philread74/features/carries_calculation_screen/widget/custom_count_container.dart';
  import 'package:philread74/features/carries_calculation_screen/widget/predefined_count_container.dart';
import 'package:philread74/features/cost_calculation_screen/Riverpod/provider.dart';
  import 'package:philread74/features/login_screen/presentation/widgets/customButtons.dart';
  import 'package:philread74/features/portion_selection_screen/Riverpod/portionProvider.dart';
  import 'package:philread74/features/portion_selection_screen/presentation/widgets/custom_calc_tile.dart';

  class CarriesCalculationScreen extends ConsumerWidget {
    const CarriesCalculationScreen({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {
      final portionMap = {
        9: {"title": "1/4", "icon": AppIcons.onethird},
        18: {"title": "1/2", "icon": AppIcons.halfIcon},
        27: {"title": "3/4", "icon": AppIcons.quarz},
        36: {"title": "Full", "icon": AppIcons.fullIcon},
      };

      final style = Theme.of(context).textTheme;
      final data = ref.watch(valueProvider);
      final portionData =
          portionMap[data] ?? {"title": "-", "icon": AppIcons.fullIcon};
      return BackgroundScreen(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.screenHorizontal,
            child: Consumer(
              builder: (_, ref, _) {

                Future.microtask((){
                  if (data == 9.00) {
                    ref
                        .read(bigCageCost.notifier)
                        .state = 25.04;
                    ref
                        .read(smallCageCost.notifier)
                        .state = 16.17;
                    ref
                        .read(dollyCost.notifier)
                        .state = 6.26;
                    ref
                        .read(totesCost.notifier)
                        .state = 1.25;
                    ref
                        .read(palletCost.notifier)
                        .state = 31.31;
                  } else if (data == 18.00) {
                    ref
                        .read(bigCageCost.notifier)
                        .state = 24.36;
                    ref
                        .read(smallCageCost.notifier)
                        .state = 15.73;
                    ref
                        .read(dollyCost.notifier)
                        .state = 6.09;
                    ref
                        .read(totesCost.notifier)
                        .state = 1.22;
                    ref
                        .read(palletCost.notifier)
                        .state = 30.45;
                  } else if (data == 27.00) {
                    ref
                        .read(bigCageCost.notifier)
                        .state = 23.68;
                    ref
                        .read(smallCageCost.notifier)
                        .state = 15.29;
                    ref
                        .read(dollyCost.notifier)
                        .state = 5.92;
                    ref
                        .read(totesCost.notifier)
                        .state = 1.18;
                    ref
                        .read(palletCost.notifier)
                        .state = 29.60;
                  } else {
                    ref
                        .read(bigCageCost.notifier)
                        .state = 22.77;
                    ref
                        .read(smallCageCost.notifier)
                        .state = 14.70;
                    ref
                        .read(dollyCost.notifier)
                        .state = 5.69;
                    ref
                        .read(totesCost.notifier)
                        .state = 1.14;
                    ref
                        .read(palletCost.notifier)
                        .state = 28.46;
                  }
                });

                final totalCapacity = ref.watch(totalSpace);

                return Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref.invalidate(countController);
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

                    SizedBox(height: 36.h),

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
                        CustomCountContainer(id: 1)
                      ],
                    ),
                    SizedBox(height: 16.h,),
                    Row(
                      children: [
                        CustomContainer(size: 2, text: "Small Cages",),
                        SizedBox(width: 16.w,),
                        CustomCountContainer(id: 2)
                      ],
                    ),
                    SizedBox(height: 16.h,),
                    Row(
                      children: [
                        CustomContainer(size: 2, text: "Dollies",),
                        SizedBox(width: 16.w,),
                        CustomCountContainer(id: 3)
                      ],
                    ),
                    SizedBox(height: 16.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("  (Totes)", style: style.bodyMedium?.copyWith(color: AppColors.containerTextColor, fontSize: 12.sp, fontWeight: FontWeight.w400),),
                        PredefinedCountContainer(id: 5)
                      ],
                    ),
                    SizedBox(height: 16.h,),
                    Row(
                      children: [
                        CustomContainer(size: 2, text: "Pallets",),
                        SizedBox(width: 16.w,),
                        CustomCountContainer(id: 4)
                      ],
                    ),
                    SizedBox(height: 16.h,),
                    Row(
                      children: [
                        CustomContainer(size: 2, text: "Total",),
                        SizedBox(width: 16.w,),
                        CustomContainer(size: 3, text: "${ref.read(totalSpace.notifier).state.toStringAsFixed(2)} m²", isCentered: true,)
                      ],
                    ),
                    SizedBox(height: 59.h,),
                    Custombuttons(title: "Go to cost", onTap: () {
                      context.push(RouteName.costCalculationScreen);
                    }),
                  ],
                );
              },
            ),
          ),
        ),
      );
    }
  }
