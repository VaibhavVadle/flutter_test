part of 'extensions.dart';

extension WidgetExtension on Widget {
  Padding get defaultPadding => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: this,
      );

  Padding paddingSymmetric({
    double? horizontal,
    double? vertical,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 0.0,
        vertical: vertical ?? 0.0,
      ),
      child: this,
    );
  }

  Padding paddingOnly({
    double? left,
    double? right,
    double? bottom,
    double? top,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? 0.0,
        right: right ?? 0.0,
        bottom: bottom ?? 0.0,
        top: top ?? 0.0,
      ),
      child: this,
    );
  }

  Padding paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Padding paddingFromLTRB(
    double L,
    double T,
    double R,
    double B,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(L, T, R, B),
      child: this,
    );
  }

  Container addTapAreaOnly({
    double? left,
    double? right,
    double? bottom,
    double? top,
  }) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(
        left: left ?? 0.0,
        right: right ?? 0.0,
        bottom: bottom ?? 0.0,
        top: top ?? 0.0,
      ),
      child: this,
    );
  }

  Container addTapAreaAll(double value) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Container addTapAreaSymmetric({
    double? horizontal,
    double? vertical,
  }) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 0.0,
        vertical: vertical ?? 0.0,
      ),
      child: this,
    );
  }
}
