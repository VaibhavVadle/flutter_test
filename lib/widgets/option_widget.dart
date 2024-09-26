import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/core/extensions/extensions.dart';
import 'package:test_app/models/option_model.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.option,
    required this.width,
  });

  final OptionModel option;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10.r),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: option.onTap,
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              3.verticalSpace,
              option.path.isSvg
                  ? SvgPicture.asset(
                      option.path,
                      height: 40.w,
                      width: 40.w,
                    )
                  : Image.asset(
                      option.path,
                      height: 40.w,
                      width: 40.w,
                    ),
              4.verticalSpace,
              Text(
                option.title,
                textAlign: TextAlign.center,
                style: AppTextStyle.primaryF10W500,
              ),
              8.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
