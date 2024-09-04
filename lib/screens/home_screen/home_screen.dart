import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/core/extensions/extensions.dart';
import 'package:test_app/data/dummy_data.dart';
import 'package:test_app/widgets/app_gradient_divider.dart';
import 'package:test_app/widgets/app_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Grid View'),
    Tab(text: 'List View'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          15.verticalSpace,
          _buildCarouselView(context),
          AppGradientDivider(height: 20.h),
          Expanded(
            child: DefaultTabController(
              length: myTabs.length,
              child: Column(
                children: [
                  TabBar(
                    tabs: myTabs,
                    labelStyle: AppTextStyle.title2,
                    indicatorColor: AppTheme.darkTeal,
                    indicatorSize: TabBarIndicatorSize.label,
                  ),
                   const Expanded(
                    child: TabBarView(
                      children: [
                        _GridViewWidget(foodImages),
                        _ListViewWidget(foodImages),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselView(BuildContext context) {
    return SizedBox(
          height: 250.h,
          child: CarouselView(
            itemExtent: context.width * 0.7,
            shrinkExtent: context.width * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r)),
            children: List.generate(
              foodImages.length,
              (index) {
                return AppNetworkImage(foodImages[index]);
              },
            ),
          ),
        );
  }
}

class _GridViewWidget extends StatelessWidget {
  const _GridViewWidget(this.images, {super.key});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.w,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return AppNetworkImage(images[index]);
      },
    );
  }
}

class _ListViewWidget extends StatelessWidget {
  const _ListViewWidget(this.images, {super.key});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      itemCount: images.length,
      separatorBuilder: (context, index) => 20.verticalSpace,
      itemBuilder: (context, index) {
        return AppNetworkImage(
          images[index],
          height: 200,
          width: double.infinity,
        );
      },
    );
  }
}
