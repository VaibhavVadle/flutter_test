import 'package:flutter/material.dart';
import 'package:test_app/core/constants/constants.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "ORDER SCREEN",
        style: AppTextStyle.title2,
      ),
    );
  }
}
