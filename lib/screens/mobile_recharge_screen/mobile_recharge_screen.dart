import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/core/extensions/extensions.dart';
import 'package:test_app/data/dummy_data.dart';
import 'package:test_app/widgets/app_search_text_field.dart';
import 'package:test_app/widgets/contact_widget.dart';
import 'package:test_app/widgets/primary_app_bar.dart';

class MobileRechargeScreen extends StatefulWidget {
  const MobileRechargeScreen({super.key});

  @override
  State<MobileRechargeScreen> createState() => _MobileRechargeScreenState();
}

class _MobileRechargeScreenState extends State<MobileRechargeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _buildHomeBg(context),
            Column(
              children: [
                _buildAppBar(),
                _buildCardListView(context),
                12.verticalSpace,
                _buildPhoneNumberCard(),
                8.verticalSpace,
                _buildAllContactCard(),
                22.verticalSpace,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllContactCard() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.verticalSpace,
            Text(
              AppString.allContact,
              textAlign: TextAlign.start,
              style: AppTextStyle.primaryF16W600,
            ),
            5.verticalSpace,
            Expanded(
              child: ListView.separated(
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  var contact = contactList[index];
                  return ContactWidget(
                    contact: contact,
                    onTap: () {

                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 0,
                  color: AppTheme.lightDividerColor,
                  thickness: 1.w,
                ).paddingOnly(right: 16.w),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneNumberCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 24.h),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppString.phoneNumber,
            textAlign: TextAlign.left,
            style: AppTextStyle.primaryF16W600,
          ),
          12.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: AppSearchTextField(controller: searchController),
              ),
              16.horizontalSpace,
              GestureDetector(
                onTap: () {
                  // TODO: Navigate to contact book screen
                },
                child: SvgPicture.asset(
                  AppAsset.contactBook,
                  height: 30.w,
                  width: 30.w,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHomeBg(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppTheme.defaultPrimary,
          height: context.height * 0.284,
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
    return const PrimaryAppBar(
      title: AppString.mobileRecharge,
      showBackButton: true,
    );
  }

  Widget _buildCardListView(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(aspectRatio: 320 / 90),
      items: List.generate(
        3,
        (index) => Image.asset(AppAsset.offerCard),
      ),
    );
  }
}
