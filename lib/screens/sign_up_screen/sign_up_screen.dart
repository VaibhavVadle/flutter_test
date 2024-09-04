import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/core/routes/routes.dart';
import 'package:test_app/core/utils/app_validation.dart';
import 'package:test_app/widgets/common_widget.dart';
import 'package:test_app/widgets/primary_button.dart';
import 'package:test_app/widgets/primary_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool isTermsAccept = false;

  @override
  void initState() {
    context.read<AuthBloc>().add(SetInitState());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
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
                  state.event is UserSignUpEvent) {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.dashBoardScreen, (route) => false);
              }
            },
            child: Column(
              children: [
                CommonWidget.backButton(context),
                30.verticalSpace,
                _buildSignUpText(),
                25.verticalSpace,
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildNameField(),
                      20.verticalSpace,
                      _buildEmailField(),
                      20.verticalSpace,
                      _buildPasswordField(),
                      20.verticalSpace,
                      _buildConfirmPasswordField(),
                      20.verticalSpace,
                      _buildTermsAndConditionWidget(),
                      30.verticalSpace,
                      _buildSignInButton(),
                      8.verticalSpace,
                      _buildSignInTextButton(context),
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

  Widget _buildNameField() {
    return PrimaryTextField(
      label: "Name",
      controller: _name,
      validator: AppValidation.nameValidation,
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

  Widget _buildConfirmPasswordField() {
    return PrimaryTextField(
      label: "Confirm Password",
      controller: _confirmPassword,
      validator: (value) =>
          AppValidation.confirmPasswordValidation(value, _password.text),
      isPassword: true,
    );
  }

  Widget _buildTermsAndConditionWidget() {
    return Row(
      children: [
        SizedBox(
          height: 24.w,
          width: 24.w,
          child: Checkbox(
            value: isTermsAccept,
            onChanged: (value) {
              setState(() {
                isTermsAccept = !isTermsAccept;
              });
            },
          ),
        ),
        8.horizontalSpace,
        Text(
          "I agree given Terms & Conditions",
          style: AppTextStyle.body,
        ),
      ],
    );
  }

  Widget _buildSignInButton() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return PrimaryButton(
          label: "Sign In",
          isActive: isTermsAccept,
          isLoading: state.loading,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<AuthBloc>().add(UserSignUpEvent(
                    name: _name.text,
                    email: _email.text,
                  ));
            }
          },
        );
      },
    );
  }

  Widget _buildSignInTextButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, Routes.signInScreen);
      },
      child: Text.rich(
        TextSpan(
          text: "Already have an account? ",
          children: [
            TextSpan(
              text: "Sign In",
              style: AppTextStyle.body.copyWith(color: AppTheme.defaultPrimary),
            ),
          ],
        ),
        style: AppTextStyle.body,
      ),
    );
  }

  Widget _buildSignUpText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Sign Up",
        textAlign: TextAlign.left,
        style: AppTextStyle.title1,
      ),
    );
  }
}
