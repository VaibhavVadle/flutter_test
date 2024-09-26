import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/models/contact_model.dart';
import 'package:test_app/widgets/app_image.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.contact,
    required this.onTap,
  });

  final ContactModel contact;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          child: Row(
            children: [
              AppNetworkImage(
                contact.profileUrl,
                height: 40.w,
                width: 40.w,
                borderRadius: 100.r,
              ),
              8.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.name,
                      style: AppTextStyle.primaryF17W400,
                    ),
                    2.verticalSpace,
                    Text(
                      contact.number.toString(),
                      style: AppTextStyle.primaryF14W400
                          .copyWith(color: AppTheme.hintTextColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
