import 'package:conduit/util/colors.dart';
import 'package:conduit/util/context_text_theme.extension.dart';
import 'package:conduit/util/ui_constants.dart';
import 'package:conduit/util/validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GenericTextField extends StatefulWidget {
  final TextEditingController? controller;
  final List<ValidationType>? validationTypes;
  final String hintText;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? readOnly;
  final Function? onTap;
  final Icon? prefixIcon;

  const GenericTextField({
    super.key,
    this.controller,
    this.validationTypes,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.onTap,
    this.prefixIcon,
  });

  @override
  State<GenericTextField> createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: widget.keyboardType == TextInputType.emailAddress
          ? const [AutofillHints.email]
          : const [AutofillHints.password],
      cursorColor: AppColors.primary,
      style: context.bodyLarge?.copyWith(
        decoration: TextDecoration.none,
        decorationThickness: 0,
      ),
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscure : false,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.next,
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      readOnly: widget.readOnly!,
      maxLength: widget.keyboardType == TextInputType.phone ? 10 : null,
      validator: (value) => AppValidation().validate(
        value,
        types: widget.validationTypes ?? [],
      ),
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        prefixIconColor: AppColors.primary,
        prefixText: widget.keyboardType == TextInputType.phone ? "+90 " : null,
        prefixStyle: context.bodyLarge?.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey.shade500,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : null,
        counterText: "",
        filled: true,
        fillColor: AppColors.grey,
        suffixIconColor: Colors.grey.shade500,
        hintText: widget.hintText.tr(),
        labelStyle: context.bodyLarge?.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: UIConstants.mediumBorderRadius,
          borderSide: BorderSide.none,
        ),
        errorStyle: context.bodyLarge,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: UIConstants.mediumBorderRadius,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: UIConstants.mediumBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: UIConstants.mediumBorderRadius,
        ),
      ),
    );
  }
}
