import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:philread74/core/constant/icons.dart';
import 'package:philread74/core/constant/padding.dart';
import 'package:philread74/core/theme/theme_extension/app_colors.dart';
import 'package:philread74/core/utils/common_widget/background_screen.dart/background_screen.dart';
import 'package:philread74/features/login_screen/presentation/widgets/customButtons.dart';

class CarriageSelectionScreen extends StatelessWidget {
  const CarriageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Spacer(),
            Custombuttons(title: "Next", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
