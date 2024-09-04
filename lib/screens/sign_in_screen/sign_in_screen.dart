import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/core/routes/routes.dart';
import 'package:test_app/core/utils/app_validation.dart';
import 'package:test_app/widgets/primary_button.dart';
import 'package:test_app/widgets/primary_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void initState() {
    context.read<AuthBloc>().add(SetInitState());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (!state.loading &&
                  state.isSuccess &&
                  state.event is UserSignInEvent) {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.dashBoardScreen, (route) => false);
              }
            },
            child: Column(
              children: [
                70.verticalSpace,
                _buildAppLogo(),
                50.verticalSpace,
                _buildSignInText(),
                25.verticalSpace,
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildEmailField(),
                      20.verticalSpace,
                      _buildPasswordField(),
                      8.verticalSpace,
                      _buildForgotPassText(context),
                      8.verticalSpace,
                      _buildSignInButton(),
                      20.verticalSpace,
                      Text(
                        "Or",
                        style: AppTextStyle.body,
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialIcon(
                            icon: AppAsset.google,
                            onTap: () {},
                          ),
                          20.horizontalSpace,
                          _buildSocialIcon(
                            icon: AppAsset.facebook,
                            onTap: () {},
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      _buildSignUpTextButton(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon({
    required String icon,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppTheme.highlightColor,
        child: SvgPicture.asset(
          icon,
          height: 24.w,
          width: 24.w,
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return PrimaryTextField(
      label: "Email",
      controller: _email,
      validator: AppValidation.emailValidation,
    );
  }

  Widget _buildPasswordField() {
    return PrimaryTextField(
      label: "Password",
      controller: _password,
      validator: AppValidation.passwordValidation,
      isPassword: true,
    );
  }

  Widget _buildForgotPassText(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, "Forgot Password Screen");
        },
        child: Text(
          'Forgot Password?',
          style: AppTextStyle.body,
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return PrimaryButton(
          label: "Sign In",
          isLoading: state.loading,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<AuthBloc>().add(UserSignInEvent(email: _email.text));
            }
          },
        );
      },
    );
  }

  Widget _buildSignUpTextButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.signUpScreen);
      },
      child: Text.rich(
        TextSpan(
          text: "Don’t have an account? ",
          children: [
            TextSpan(
              text: "Sign Up",
              style: AppTextStyle.body.copyWith(color: AppTheme.defaultPrimary),
            ),
          ],
        ),
        style: AppTextStyle.body,
      ),
    );
  }

  Widget _buildSignInText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Sign In",
        textAlign: TextAlign.left,
        style: AppTextStyle.title1,
      ),
    );
  }

  Widget _buildAppLogo() {
    return Image.asset(
      AppAsset.appLogo,
      height: 100,
    );
  }
}
