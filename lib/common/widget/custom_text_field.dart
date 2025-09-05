import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.hintStyle,
    this.keyboardType,
    required this.controller,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.width,
    this.labelText,
    this.enabled,
  });

  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final bool? enabled;
  final double? width;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? AppConst.kWidth * 0.9,
      decoration: BoxDecoration(
        color: AppConst.kLight,
        borderRadius: BorderRadius.circular(AppConst.kRadius),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        controller: controller,
        cursorHeight: 25,
        onChanged: onChanged,
        style: appStyle(18, FontWeight.w600, AppConst.kBKDark),
        decoration: InputDecoration(
          hintStyle: hintStyle,
          hintText: hintText,
          labelText: labelText,
          suffixIconColor: AppConst.kBKDark,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          enabled: enabled ?? true,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConst.kRadius),
            borderSide: BorderSide(width: .5, color: AppConst.kRed),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppConst.kBKDark, width: .5),
            borderRadius: BorderRadius.circular(AppConst.kRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppConst.kBlueLight, width: 0.5),
            borderRadius: BorderRadius.circular(AppConst.kRadius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppConst.kRed, width: 0.5),
            borderRadius: BorderRadius.circular(AppConst.kRadius),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConst.kRadius),
            borderSide: BorderSide(width: .5, color: AppConst.kBKDark),
          ),
          contentPadding: EdgeInsets.fromLTRB(
            AppConst.kPadding,
            10,
            AppConst.kPadding,
            10,
          ),
        ),
      ),
    );
  }
}
