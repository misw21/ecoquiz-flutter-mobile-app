import 'package:flutter/material.dart';

import '../../../core/extenssions/sizes_utils_extensions.dart';
import '../../../core/utills/app_colors.dart';
import '../../../core/utills/app_corners.dart';


class AppTextInputField extends StatelessWidget {
  AppTextInputField({
    super.key,
    this.contentPadding,
    this.labelText,
    this.focusNode,
    this.autofocus = false,
    this.hintText,
    this.language,
    this.controller,
    this.enabled = true,
    this.obscureText = false,
    this.validator,
    this.textAlign,
    this.backgroundColor,
    this.prefix,
    this.maxLines,
    this.onFieldSubmitted,
    this.minLines,
    this.style,
    this.onChanged,
    this.decoration,
    this.suffix,
    this.suffixIcon,
    this.readOnly = false,
    this.expands = false,
    this.keyboardType = TextInputType.text,
    this.borderColor = Colors.white,
  });

  final Color borderColor;
  final Color? backgroundColor;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final bool expands;
  int? language;
  final int? maxLines;
  final int? minLines;
  InputDecoration? decoration;
  final bool obscureText;
  final TextStyle? style;
  final TextAlign? textAlign;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsets? contentPadding;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return buildAppFormField(context);
  }

  Widget buildAppFormField(BuildContext context) {
    return AppFormField(
      autofocus: autofocus,
      readOnly: readOnly,
      expands: expands,
      style: style,
      onChanged: onChanged,
      backgroundColor: backgroundColor,
      obscureText: obscureText,
      enabled: enabled,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      decoration: decoration,
      hintText: hintText,
      suffix: suffix,
      textAlign: textAlign,
      suffixIcon: suffixIcon,
      prefix: prefix,
      controller: controller,
      borderColor: borderColor,
      focusNode: focusNode,
      contentPadding: contentPadding,
      label: labelText,
    );
  }
}

class AppFormField extends StatelessWidget {
  AppFormField({
    super.key,
    this.autofocus = false,
    this.readOnly = false,
    this.expands = false,
    this.style,
    this.obscureText = false,
    this.enabled = true,
    this.validator,
    this.onChanged,
    this.backgroundColor,
    this.onFieldSubmitted,
    this.maxLines,
    this.minLines,
    this.keyboardType,
    this.decoration,
    this.hintText,
    this.label,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.controller,
    this.focusNode,
    this.textAlign,
    this.contentPadding,
    this.borderColor,
    this.textAlignVertical,
  });
  final bool autofocus;
  final bool readOnly;
  final bool expands;
  final TextStyle? style;
  final bool obscureText;
  final bool enabled;
  final EdgeInsets? contentPadding;
  final TextAlignVertical? textAlignVertical;

  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final Color? borderColor;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final String? hintText;
  final String? label;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final TextAlign? textAlign;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  final OutlineInputBorder inputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.grey),
    borderRadius: AppCorners.lgBorder,
  );

  final OutlineInputBorder inputErrorBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.red),
    borderRadius: AppCorners.lgBorder,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
      autofocus: autofocus,
      readOnly: readOnly,
      expands: expands,
      textAlign: textAlign ?? TextAlign.start,
      style: style ??
        Theme.of(context).primaryTextTheme.bodySmall!.copyWith(color: AppColors.darkerGrey),
      obscureText: obscureText,
      enabled: enabled,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      decoration: decoration ??
          InputDecoration(
            contentPadding:
                contentPadding ?? 10.phs,
            hintText: hintText,
            border: inputBorder,
            enabledBorder: inputBorder,
            focusedBorder: inputBorder,
            focusedErrorBorder: inputErrorBorder,
            errorBorder: inputErrorBorder,
            labelText: label,
            labelStyle: Theme.of(context)
                .primaryTextTheme
                .titleMedium!
                .copyWith(color: AppColors.darkerGrey),
            hintStyle: Theme.of(context)
                .primaryTextTheme
                .bodyMedium!
                .copyWith(color: AppColors.lowDarkGrey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffix: suffix,
            errorMaxLines: 2,
            suffixIcon: suffixIcon,
            prefixIcon: prefix,
            alignLabelWithHint: true,
            fillColor: backgroundColor ?? AppColors.white.withValues(alpha: 0.31),
            filled: true,
          ),
      controller: controller,
      focusNode: focusNode,
    );
  }
}