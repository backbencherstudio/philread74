import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:philread74/core/constant/icons.dart';
import 'package:philread74/core/routes/route_name.dart';
import 'package:philread74/core/theme/theme_extension/app_colors.dart';
import 'package:philread74/core/utils/common_widget/background_screen.dart/background_screen.dart';
import 'package:philread74/features/login_screen/presentation/widgets/customButtons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BackgroundScreen(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Center(
              child: Container(
                width: 336.w,
                padding: EdgeInsets.all(24.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.onSurface,
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(AppIcons.logo),
                    SizedBox(height: 36.h),
                    Text(
                      "Login Data",
                      style: style.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Enter your email and password ",
                      style: style.bodySmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: AppColors.secondary,
                      ),
                    ),
                    SizedBox(height: 36.h),
        
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "NTO Pay Number",
                        style: style.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: nameController,
                      style: style.labelMedium!.copyWith(
                        color: AppColors.borderColor,
                      ),
                    ),
        
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password ",
                        style: style.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: passwordController,
                      style: style.labelMedium!.copyWith(
                        color: AppColors.borderColor,
                      ),
                    ),
                    SizedBox(height: 32.h),
        
                    Custombuttons(
                      title: "Login",
                      onTap: () {
                        if (passwordController.text.trim() == "Baby123" &&
                            nameController.text.trim() == "VR001") {
                          context.go(RouteName.carriageSelectionScreen);
                        } else {
                          Fluttertoast.showToast(
                            msg: "Credentials not matched",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
