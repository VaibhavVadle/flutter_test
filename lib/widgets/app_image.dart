import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_app/core/app_theme.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage(
    this.image, {
    super.key,
    this.fit,
    this.color,
    this.borderRadius,
    this.height,
    this.width,
  });

  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      child: CachedNetworkImage(
        imageUrl: image,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        alignment: Alignment.center,
        color: color,
        imageBuilder: (context, imageUrl) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageUrl,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        errorWidget: (context, url, error) => _buildErrorWidget(),
        placeholder: (context, url) => _buildErrorWidget(),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: Container(
        height: height,
        width: width,
        color: AppTheme.white,
      ),
    );
  }
}
