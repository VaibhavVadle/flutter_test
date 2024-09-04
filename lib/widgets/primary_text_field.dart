import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/bloc/obscure_icon_bloc/obscure_icon_bloc.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    this.label,
    this.subLabel,
    required this.controller,
    this.hintText = '',
    this.textInputAction = TextInputAction.done,
    this.keyboardType,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.focusNode,
    this.onTapSuffix,
    this.errorText,
    this.suffixWidget,
    this.prefixWidget,
    this.isPassword = false,
    this.readOnly = false,
    this.disabled,
    this.isRequired = false,
    this.labelTrailingButton,
    this.onTap,
    this.borderRadius = 6,
    this.height,
    this.textStyle,
    this.hintStyle,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
    this.focusBorderColor = AppTheme.black,
    this.isDense,
    this.fillColor,
    this.borderColor = AppTheme.lightGrey,
    this.autoFocus = false,
  });

  final String? label;
  final String? subLabel;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? errorText;
  final void Function()? onTapSuffix;
  final bool isPassword;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool readOnly;
  final bool? disabled;
  final bool isRequired;
  final Widget? labelTrailingButton;
  final double borderRadius;
  final double? height;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry contentPadding;
  final Color focusBorderColor;
  final bool? isDense;
  final Color? fillColor;
  final Color borderColor;
  final bool autoFocus;

  TextStyle get style => textStyle ?? AppTextStyle.headline;

  InputBorder get border => OutlineInputBorder(
        borderSide: BorderSide(width: 1.w, color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ObscureIconBloc>(
      create: (_) => ObscureIconBloc(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null) ...[
            Text(label ?? "", style: AppTextStyle.body),
            5.verticalSpace,
          ],
          BlocBuilder<ObscureIconBloc, ObscureIconState>(
              builder: (obscureIconContext, obscureIconState) {
            return IgnorePointer(
              ignoring: disabled ?? readOnly,
              child: SizedBox(
                height: height,
                child: TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  textInputAction: textInputAction,
                  keyboardType: keyboardType,
                  autofocus: autoFocus,
                  maxLines:
                      keyboardType == TextInputType.multiline ? null : maxLines,
                  maxLength: maxLength,
                  validator: validator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  buildCounter: (BuildContext context,
                      {required int currentLength,
                      required int? maxLength,
                      required bool isFocused}) {
                    return null; // Display the character count
                  },
                  obscureText: isPassword ? obscureIconState.iconState : false,
                  inputFormatters: inputFormatters,
                  onChanged: onChanged,
                  onTap: onTap,
                  cursorColor: AppTheme.black,
                  readOnly: readOnly,
                  style: style.copyWith(
                      color: readOnly ? AppTheme.hintTextColor : null),
                  decoration: InputDecoration(
                    isDense: isDense,
                    filled: true,
                    fillColor: fillColor ??
                        (readOnly ? AppTheme.grey200 : AppTheme.white),
                    hintText: hintText,
                    errorText: errorText,
                    contentPadding: EdgeInsets.only(
                        right: contentPadding.horizontal / 2,
                        top: contentPadding.vertical / 2,
                        bottom: contentPadding.vertical / 2),
                    hintStyle: hintStyle ??
                        style.copyWith(
                          color: AppTheme.hintTextColor,
                          fontWeight: FontWeight.w400,
                        ),
                    errorMaxLines: 3,
                    errorStyle: AppTextStyle.body
                        .copyWith(color: AppTheme.defaultError),
                    prefixIcon: prefixWidget,
                    prefix: prefixWidget != null
                        ? null
                        : Padding(
                            padding: EdgeInsets.only(
                                left: contentPadding.horizontal / 2),
                          ),
                    suffixIcon: suffixWidget ??
                        (!isPassword
                            ? null
                            : IconButton(
                                splashRadius: 0.1,
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  obscureIconContext
                                      .read<ObscureIconBloc>()
                                      .add(ObscureIconPressed());
                                },
                                icon: SvgPicture.asset(
                                  (obscureIconState.iconState)
                                      ? AppAsset.showPassword
                                      : AppAsset.hidePassword,
                                ),
                              )),
                    border: border,
                    enabledBorder: border,
                    disabledBorder: border,
                    focusedBorder: border.copyWith(
                      borderSide:
                          BorderSide(width: 1.w, color: focusBorderColor),
                    ),
                    errorBorder: border.copyWith(
                      borderSide:
                          BorderSide(width: 1.w, color: AppTheme.defaultError),
                    ),
                    focusedErrorBorder: border.copyWith(
                      borderSide:
                          BorderSide(width: 1.w, color: AppTheme.defaultError),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
