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

class CustomCountContainer extends ConsumerStatefulWidget {
  final int id;
  const CustomCountContainer({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<CustomCountContainer> createState() =>
      _CustomCountContainerState();
}

class _CustomCountContainerState extends ConsumerState<CustomCountContainer> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    final initialCount = ref.read(countController(widget.id));
    _textController = TextEditingController(text: initialCount.toString());
  }

  @override
  void didUpdateWidget(covariant CustomCountContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    final currentCount = ref.read(countController(widget.id));
    if (_textController.text != currentCount.toString()) {
      _textController.text = currentCount.toString();
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final count = ref.watch(countController(widget.id));
    final countNotifier = ref.read(countController(widget.id).notifier);
    final itemSizes = ref.watch(itemSizesProvider);
    final isFreeze = ref.watch(readOnly(itemSizes[widget.id] ?? 0.0));

    final restSpace = ref.watch(valueProvider) - ref.watch(totalSpace);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      width: 105.w,
      height: 36.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(width: 1.w, color: AppColors.onPrimary),
        color: AppColors.onSurface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              if (count > 0) countNotifier.state = count - 1;
            },
            child: SizedBox(
                width: 14.w,
                child: SvgPicture.asset(AppIcons.minus, colorFilter: ColorFilter.mode((isFreeze) ? AppColors.freezeColor : AppColors.containerTextColor, BlendMode.srcIn),)),
          ),

          Expanded(
            child: SizedBox(
              width: 30.w,
              child: TextFormField(

                readOnly: isFreeze,
                controller: _textController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: style.bodyMedium!.copyWith(color: (isFreeze) ? AppColors.freezeColor : AppColors.containerTextColor, fontWeight: FontWeight.w400, fontSize: 12.sp),
                onChanged: (val) {
                  final parsed = int.tryParse(_textController.text) ?? 0;
                    final space = (itemSizes[widget.id] ?? 0.0) * parsed;
                    if (space <= restSpace) {
                      countNotifier.state = parsed;
                      debugPrint(val);
                    } else {
                      debugPrint("NOT OK");
                      _textController.text = "0";
                      countNotifier.state = 0;
                    }
                },
              ),
            ),
          ),

          /// Plus button
          InkWell(
            onTap: () {
              if(!isFreeze) countNotifier.state = count + 1;
            },
            child: SizedBox(
              width: 14.w,
                child: SvgPicture.asset(AppIcons.plus, colorFilter: ColorFilter.mode((isFreeze) ? AppColors.freezeColor : AppColors.containerTextColor, BlendMode.srcIn),)
            ),
          ),
        ],
      ),
    );
  }
}
