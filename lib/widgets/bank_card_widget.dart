import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';

class BankCardWidget extends StatelessWidget {
  const BankCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184.h,
      padding: EdgeInsets.fromLTRB(24.w, 13.h, 24.w, 19.h),
      margin: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
        color: AppTheme.defaultBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
        image: const DecorationImage(
          image: AssetImage(AppAsset.cardBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBankName(),
          3.verticalSpace,
          _buildCurrentBalanceText(),
          7.verticalSpace,
          _viewBalanceButton(
            onTap: () {
              // TODO: Add logic to show balance
            },
          ),
          const Spacer(),
          _buildCardNumberAndAccountType(number: "098801234567"),
        ],
      ),
    );
  }

  Widget _buildCurrentBalanceText() {
    return Text(
      AppString.currentBalance,
      style: AppTextStyle.primaryF14W500,
    );
  }

  Widget _buildCardNumberAndAccountType({
    required String number,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            number,
            style: AppTextStyle.primaryF16W700,
          ),
        ),
        Text(
          AppString.mySavingAccount,
          style: AppTextStyle.primaryF12W700,
        )
      ],
    );
  }

  Widget _viewBalanceButton({
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 2.h,
          horizontal: 10.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(
            color: AppTheme.primaryBorderColor,
            width: 1.w,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAsset.eyeVisible,
              height: 24.w,
              width: 24.w,
            ),
            10.horizontalSpace,
            Text(
              AppString.viewBalance,
              style: AppTextStyle.primaryF16W600.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppAsset.add,
          height: 28.w,
          width: 28.w,
        ),
        5.horizontalSpace,
        Text(
          "ABC BANK",
          style: AppTextStyle.primaryF16W600.copyWith(
            fontStyle: FontStyle.italic,
          ),
        )
      ],
    );
  }
}
