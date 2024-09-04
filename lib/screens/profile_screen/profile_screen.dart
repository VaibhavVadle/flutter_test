import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/core/routes/routes.dart';
import 'package:test_app/core/storage/app_storage.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/widgets/primary_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    user = AppStorage.getUser;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (!state.loading &&
            state.isSuccess &&
            state.event is UserLogOutEvent) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.signInScreen,
            (route) => false,
          );
        }
      },
      builder: (BuildContext context, AuthState state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserWelcomeWidget(),
                _buildLogOutButton(state, context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildUserWelcomeWidget() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello, ${user?.name ?? ""}",
            style: AppTextStyle.title1,
          ),
          if (user != null && (user?.email.isNotEmpty ?? false))
            Text(
              user!.email,
              style:
              AppTextStyle.title2.copyWith(color: AppTheme.hintTextColor),
            ),
        ],
      ),
    );
  }

  Widget _buildLogOutButton(AuthState state, BuildContext context) {
    return Center(
      child: PrimaryButton(
        label: "Log Out",
        isLoading: state.loading,
        onPressed: () {
          context.read<AuthBloc>().add(UserLogOutEvent());
        },
      ),
    );
  }
}
