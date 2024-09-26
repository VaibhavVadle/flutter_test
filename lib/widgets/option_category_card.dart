import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/core/extensions/extensions.dart';
import 'package:test_app/models/option_model.dart';
import 'package:test_app/widgets/option_widget.dart';

class OptionCategoryCard extends StatelessWidget {
  const OptionCategoryCard({
    super.key,
    required this.title,
    required this.options,
  });

  final String title;
  final List<OptionModel> options;

  @override
  Widget build(BuildContext context) {
    double optionItemWidth = (context.width - 48.w) / 4;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 10.h,
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.w),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.primaryF16W500,
          ),
          4.verticalSpace,
          Wrap(
            children: List.generate(
              options.length,
              (index) {
                return OptionWidget(
                  option: options[index],
                  width: optionItemWidth,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
