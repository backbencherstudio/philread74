import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:philread74/core/constant/padding.dart';
import 'package:philread74/core/theme/theme_extension/app_colors.dart';
import 'package:philread74/core/utils/common_widget/background_screen.dart/background_screen.dart';
import 'package:philread74/features/carriage_selection_screen/Riverpod/selectionProvider.dart';
import 'package:philread74/features/carriage_selection_screen/presentation/widgets/customTiles.dart';
import 'package:philread74/features/login_screen/presentation/widgets/customButtons.dart';

class CarriageSelectionScreen extends StatelessWidget {
  const CarriageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> carriage = [
      "Carriage A",
      "Carriage B",
      "Carriage C",
      "Carriage D",
    ];
    final style = Theme.of(context).textTheme;

    return BackgroundScreen(
      child: Padding(
        padding: AppPadding.screenHorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 36.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Train Carriage:",
                style: style.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),

            SizedBox(height: 40.h),

            //grid tile

            // Customtiles(title: 'Carriage A',),
            Consumer(
              builder: (context, ref, _) {
                final isSelected = ref.watch(selectedIndexProvider);
                return SizedBox(
                  height: 260.h,
                  child: Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1.3,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Customtiles(title: carriage[index],
                        onTap: () {
                          ref.watch(selectedIndexProvider.notifier).state =index;
                        }, isSelected: isSelected == index,
                        );
                      },
                    ),
                  ),
                );
              }
            ),
            Spacer(),
            Custombuttons(title: "Next", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
