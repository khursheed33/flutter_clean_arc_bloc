import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../enums/font_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInputForm extends StatelessWidget {
  const AppInputForm({
    Key? key,
    this.suffixIconHandler,
    this.prefixIconHandler,
    this.isPasswordVisible,
    this.obscured = false,
    this.onChangeHandler,
    this.suffixWidget,
    this.initialValue,
    this.inputAction,
    this.fontWeight,
    this.isDisabled,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.inputLabel,
    this.fillColor,
    this.iconColor,
    this.formatter,
    this.maxLength,
    this.inputType,
    this.fontSize,
    this.iconSize,
    this.hintText,
    this.maxLines,
    this.minLines,
    this.validator,
    this.textAlign,
  }) : super(key: key);
  final int? maxLines;
  final bool obscured;
  final int? minLines;
  final int? maxLength;
  final Color? fillColor;
  final Color? iconColor;
  final String? hintText;
  final double? fontSize;
  final double? iconSize;
  final bool? isDisabled;
  final String? inputLabel;
  final TextAlign? textAlign;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? initialValue;
  final Widget? suffixWidget;
  final FontWeight? fontWeight;
  final bool? isPasswordVisible;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final Function(String)? onChangeHandler;
  final List<TextInputFormatter>? formatter;
  final String? Function(String?)? validator;
  final Function()? suffixIconHandler;
  final Function()? prefixIconHandler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      child: inputLabel == null
          ? _inputField(context)
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: textAlign == null
                  ? CrossAxisAlignment.start
                  : textAlign == TextAlign.right
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 4,
                  ),
                  child: Text(
                    "$inputLabel",
                    textAlign: textAlign,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).disabledColor.withOpacity(0.6),
                    ),
                  ),
                ),
                _inputField(context),
              ],
            ),
    );
  }

  TextFormField _inputField(BuildContext context) {
    return TextFormField(
      cursorWidth: 2.5,
      validator: validator,
      maxLength: maxLength,
      obscureText: obscured,
      controller: controller,
      maxLines: minLines ?? 1,
      minLines: minLines ?? 1,
      keyboardType: inputType,
      initialValue: initialValue,
      inputFormatters: formatter,
      onChanged: onChangeHandler,
      readOnly: isDisabled ?? false,
      textAlign: textAlign ?? TextAlign.left,
      textInputAction: inputAction ?? TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily: FontType.poppins.name,
        fontSize: AppFontSizes.s18,
        color: AppColor.white,
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 6, bottom: 12, top: 12, right: 2),
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon,
              ),
        suffixIcon: suffixWidget ??
            (suffixIcon != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: suffixIconHandler,
                      child: Icon(
                        suffixIcon ?? Icons.visibility,
                        color: iconColor ?? AppColor.white,
                        size: iconSize,
                      ),
                    ),
                  )
                : isPasswordVisible == null
                    ? null
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: suffixIconHandler,
                          child: Icon(
                            isPasswordVisible!
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      )),
        counterText: '',
        hintText: hintText ?? "",
        hintStyle: TextStyle(
          color: AppColor.lightGrey,
          fontFamily: FontType.poppins.name,
          fontWeight: FontWeight.normal,
          fontSize: AppFontSizes.s18,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.transparent,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        ),
        disabledBorder: InputBorder.none,
        filled: true,
        fillColor: fillColor ?? AppColor.navyBlue,
      ),
    );
  }
}
