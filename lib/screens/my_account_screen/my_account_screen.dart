import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/core/extensions/extensions.dart';
import 'package:test_app/core/routes/routes.dart';
import 'package:test_app/models/option_model.dart';
import 'package:test_app/widgets/bank_card_widget.dart';
import 'package:test_app/widgets/option_category_card.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.defaultBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            _buildHomeBg(context),
            Column(
              children: [
                _buildAppBar(),
                _buildCardListView(context),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        4.verticalSpace,
                        _buildPaymentMethodOptions(),
                        _buildRechargeOptions(context),
                        _buildFinancialServicesOptions(),
                        8.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodOptions() {
    return OptionCategoryCard(
      title: AppString.paymentMethods,
      options: [
        OptionModel(
          title: AppString.bankAccount,
          path: AppAsset.bankAccount,
          onTap: () {
            // TODO : Add logic of bank account on tap
          },
        ),
        OptionModel(
          title: AppString.aIPayWallet,
          path: AppAsset.aiPayWallet,
          onTap: () {
            // TODO : Add logic of ai pay wallet on tap
          },
        ),
        OptionModel(
          title: AppString.creditLineOnUPI,
          path: AppAsset.creditLineOnUpi,
          onTap: () {
            // TODO : Add logic of credit line on UPI on tap
          },
        ),
        OptionModel(
          title: AppString.digitalCurrency,
          path: AppAsset.digitalCurrency,
          onTap: () {
            // TODO : Add logic of digital currency on tap
          },
        ),
      ],
    );
  }

  Widget _buildRechargeOptions(BuildContext context) {
    return OptionCategoryCard(title: AppString.recharge, options: [
      OptionModel(
        title: AppString.mobileRecharge,
        path: AppAsset.mobileRecharge,
        onTap: () {
          // TODO : Add logic of Mobile Recharge on tap
          Navigator.pushNamed(context, Routes.mobileRechargeScreen);
        },
      ),
      OptionModel(
        title: AppString.fastag,
        path: AppAsset.fastTag,
        onTap: () {
          // TODO : Add logic of fast tag on tap
        },
      ),
      OptionModel(
        title: AppString.dth,
        path: AppAsset.dth,
        onTap: () {
          // TODO : Add logic of DTH on tap
        },
      ),
      OptionModel(
        title: AppString.cableTvRecharge,
        path: AppAsset.cableTvRecharge,
        onTap: () {
          // TODO : Add logic of cable tv recharge on tap
        },
      ),
    ]);
  }

  Widget _buildFinancialServicesOptions() {
    return OptionCategoryCard(
      title: AppString.financialServices,
      options: [
        OptionModel(
          title: AppString.loanEmi,
          path: AppAsset.loanEmi,
          onTap: () {
            // TODO : Add logic of Loan EMI on tap
          },
        ),
        OptionModel(
          title: AppString.insurance,
          path: AppAsset.insurance,
          onTap: () {
            // TODO : Add logic of Insurance on tap
          },
        ),
        OptionModel(
          title: AppString.educationFee,
          path: AppAsset.educationFee,
          onTap: () {
            // TODO : Add logic of Education Fee on tap
          },
        ),
        OptionModel(
          title: AppString.creditCardBillPayment,
          path: AppAsset.creditCardBillPayment,
          onTap: () {
            // TODO : Add logic of Credit Card Bill Payment on tap
          },
        ),
        OptionModel(
          title: AppString.municipalTax,
          path: AppAsset.municipalTax,
          onTap: () {
            // TODO : Add logic of Municipal Tax on tap
          },
        ),
      ],
    );
  }

  Widget _buildCardListView(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 204.h),
      items: cardList(),
    );
  }

  List<Widget> cardList() {
    return List.generate(
      5,
      (index) {
        return const BankCardWidget();
      },
    );
  }

  Widget _buildHomeBg(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppTheme.defaultPrimary,
          height: context.height * 0.22,
        ),
        Expanded(
          child: Container(
            color: AppTheme.defaultBackgroundColor,
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.defaultContainerColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 15.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppAsset.logo,
              height: 50.w,
              width: 50.w,
            ),
            15.horizontalSpace,
            Expanded(
              child: Text(
                AppString.logo,
                style: AppTextStyle.primaryF20W700,
              ),
            ),
            Badge(
              isLabelVisible: true,
              backgroundColor: AppTheme.red,
              smallSize: 14.w,
              largeSize: 14.w,
              label: Text(
                "5",
                style:
                    AppTextStyle.primaryF7W700.copyWith(color: AppTheme.white),
              ),
              child: SvgPicture.asset(
                AppAsset.notification,
                height: 28.w,
                width: 28.w,
              ),
            ),
            10.horizontalSpace,
            Image.asset(
              AppAsset.profilePlaceholder,
              height: 50.w,
              width: 50.w,
            )
          ],
        ),
      ),
    );
  }
}
