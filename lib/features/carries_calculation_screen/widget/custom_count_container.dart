import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:philread74/core/constant/icons.dart';
import 'package:philread74/features/carries_calculation_screen/Riverpod/type_carry_cost.dart';
import '../../../core/theme/theme_extension/app_colors.dart';

class CustomCountContainer extends ConsumerStatefulWidget {
  final StateProvider controller;
  final int id;
  const CustomCountContainer({
    super.key,
    required this.controller,
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
    final isFreeze = ref.watch(readOnly(widget.controller));

    if (_textController.text != count.toString()) {
      _textController.text = count.toString();
    }

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
            child: SvgPicture.asset(AppIcons.minus, width: 11.25.w,),
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
                style: style.bodyMedium!.copyWith(color: AppColors.containerTextColor, fontWeight: FontWeight.w400, fontSize: 12.sp),
                onChanged: (val) {
                  final parsed = int.tryParse(val);
                  if (parsed != null && parsed >= 0) {
                    countNotifier.state = parsed;
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
            child: SvgPicture.asset(AppIcons.plus, width: 11.25.w,),
          ),
        ],
      ),
    );
  }
}
