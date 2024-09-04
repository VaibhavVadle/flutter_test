import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/core/extensions/extensions.dart';

class DefaultRouteWidget extends StatelessWidget {
  const DefaultRouteWidget({
    super.key,
    required this.screenName,
  });

  final String screenName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15.h),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: Colors.transparent,
                  child: SvgPicture.asset(
                    AppAsset.backArrow,
                    height: 22.w,
                    width: 22.w,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '$screenName is not implemented',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ).defaultPadding,
      ),
    );
  }
}
