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
import 'package:philread74/features/login_screen/presentation/widgets/customButtons.dart';
import 'package:philread74/features/portion_selection_screen/Riverpod/portionProvider.dart';
import 'package:philread74/features/portion_selection_screen/presentation/widgets/custom_calc_tile.dart';

class CarriesCalculationScreen extends StatelessWidget {
  const CarriesCalculationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final portionMap = {
      9: {"title": "1/4", "icon": AppIcons.onethird},
      18: {"title": "1/2", "icon": AppIcons.halfIcon},
      27: {"title": "3/4", "icon": AppIcons.quarz},
      36: {"title": "Full", "icon": AppIcons.fullIcon},
    };

    final style = Theme.of(context).textTheme;

    return BackgroundScreen(
      child: Padding(
        padding: AppPadding.screenHorizontal,
        child: Consumer(
          builder: (contex, ref, _) {
            final data = ref.watch(valueProvider);
            final portionData =
                portionMap[data] ?? {"title": "-", "icon": AppIcons.fullIcon};

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

                SizedBox(height: 40.h),

                Spacer(),
                Custombuttons(title: "Go to cost", onTap: () {
                  context.push(RouteName.costCalculationScreen);
                }),
              ],
            );
          },
        ),
      ),
    );
  }
}
