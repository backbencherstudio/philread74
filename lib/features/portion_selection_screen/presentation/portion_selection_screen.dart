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
import 'package:philread74/features/carriage_selection_screen/Riverpod/selectionProvider.dart';
import 'package:philread74/features/login_screen/presentation/widgets/customButtons.dart';
import 'package:philread74/features/portion_selection_screen/Riverpod/portionProvider.dart';
import 'package:philread74/features/portion_selection_screen/presentation/widgets/custom_calc_tile.dart';

class PortionSelectionScreen extends StatelessWidget {
  const PortionSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> carriage = ["1/4", "1/2", "3/4", "Full"];
    final List<String> images = [
      AppIcons.onethird,
      AppIcons.halfIcon,
      AppIcons.quarz,
      AppIcons.fullIcon,
    ];
    final style = Theme.of(context).textTheme;

    return BackgroundScreen(
      child: Padding(
        padding: AppPadding.screenHorizontal,
        child: Column(
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Portion of the Carriage",
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
                      return CustomCalcTile(
                        image: images[index],
                        title: carriage[index],
                        onTap: () {
                          ref.read(selectedIndexProvider.notifier).state =
                              index;
                        },
                        isSelected: isSelected == index,
                      );
                    },
                  ),
                );
              },
            ),
            Spacer(),
            Consumer(
              builder: (context, ref, _) {
                final selectedIndex = ref.watch(selectedIndexProvider);

                return Custombuttons(
                  title: "Next",
                  onTap: () {
                    if (selectedIndex == 0) {
                      ref.read(valueProvider.notifier).state = 9.00;
                    } else if (selectedIndex == 1) {
                      ref.read(valueProvider.notifier).state = 18.00;
                    } else if (selectedIndex == 2) {
                      ref.read(valueProvider.notifier).state = 27.00;
                    } else if (selectedIndex == 3) {
                      ref.read(valueProvider.notifier).state = 36.00;
                    }
                    final updatedValue = ref.read(
                      valueProvider,
                    ); // read after update
                    debugPrint("\n\n$updatedValue\n\n");

                     context.push(RouteName.carriesCalculationScreen);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
