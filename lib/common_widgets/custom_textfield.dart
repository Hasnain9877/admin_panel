import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../constants/app_colors.dart';
class CustomTextFormField extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final String? validationKey;
  final FocusNode? focusNode;
  final bool? autofocus;
  final String? labelText;
  final FloatingLabelBehavior floatingLabelBehavior;
  final String? hintText;
  final bool? readOnly;
  final bool? enabled;
  final bool isRequired;
  final bool? obscureText;
  final String obscuringCharacter;
  final String requiredLabelCharacter;
  final Color? requiredLabelColor;
  final BoxConstraints? prefixIconConstraints;
  final Widget? prefixWidget;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final double? suffixIconSize;
  final Color? suffixIconColor;
  final void Function(String?)? onChanged;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onTap;
  final void Function(String?)? onSave;
  final void Function(String?)? onFieldSubmit;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final String? requiredErrorMessage;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? cursorColor;
  final Color? errorColor;
  final Color? disabledColor;
  final TextCapitalization? textCapitalization;
  final double? borderRadius;
  final bool showValidator;

  const CustomTextFormField({
    super.key,
    this.title,
    this.validationKey,
    this.controller,
    this.isRequired = false,
    this.requiredLabelColor,
    this.requiredLabelCharacter = '*',
    this.labelText,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.hintText,
    this.prefixIcon,
    this.prefixIconSize,
    this.prefixIconColor,
    this.prefixIconConstraints,
    this.prefixWidget,
    this.suffixIcon,
    this.suffixWidget,
    this.suffixIconSize,
    this.suffixIconColor,
    this.obscureText,
    this.obscuringCharacter = '*',
    this.onChanged,
    this.onSuffixTap,
    this.validator,
    this.requiredErrorMessage,
    this.onSave,
    this.inputFormatters,
    this.textInputAction,
    this.autofillHints,
    this.keyboardType,
    this.onEditingComplete,
    this.onFieldSubmit,
    this.readOnly,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.fillColor,
    this.autofocus,
    this.textCapitalization,
    this.textStyle,
    this.cursorColor,
    this.errorColor,
    this.disabledColor,
    this.onTap,
    this.borderRadius = 20,
    this.enabled,
    this.showValidator = true,
  })  : assert(prefixWidget == null || prefixIcon == null,
          'Cannot provide both a prefixWidget and a prefixIconData'),
        assert(prefixWidget == null || prefixIconColor == null,
          'Cannot provide both a prefixWidget and a prefixIconColor'),
        assert(suffixWidget == null || suffixIcon == null,
          'Cannot provide both a suffixWidget and a suffixIconData'),
        assert(suffixWidget == null || suffixIconColor == null,
          'Cannot provide both a suffixWidget and a suffixIconColor');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [

          if (title != null) const SizedBox(height: 10),
          TextFormField(

            controller: controller,
            cursorColor: cursorColor ?? theme.colorScheme.primary,
            cursorRadius: const Radius.circular(32),
            cursorWidth: 2,
            autofocus: autofocus ?? false,
            focusNode: focusNode,
            onTap: onTap,
            maxLines: maxLines ?? 1,
            maxLength: maxLength,
            buildCounter: (_, {required currentLength, maxLength, required isFocused}) => null,
            textCapitalization: textCapitalization ?? TextCapitalization.sentences,
            onEditingComplete: onEditingComplete,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            autovalidateMode: AutovalidateMode.disabled,
            enableSuggestions: true,
            onSaved: onSave,
            onFieldSubmitted: onFieldSubmit,
            autofillHints: autofillHints,
            keyboardType: keyboardType ?? TextInputType.text,
            onChanged: onChanged,
            obscureText: obscureText ?? false,
            obscuringCharacter: obscuringCharacter,
            enabled: enabled ?? true,
            readOnly: readOnly ?? false,
            style: textStyle ??
                theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor ?? AppColors.tabColor,
              labelText: labelText,
              hintText: hintText,
              labelStyle: theme.inputDecorationTheme.labelStyle,
              hintStyle: theme.inputDecorationTheme.hintStyle,
              floatingLabelBehavior: floatingLabelBehavior,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              prefixIcon: prefixWidget ??
                  (prefixIcon != null
                      ? Icon(prefixIcon,
                          size: prefixIconSize,
                          color: prefixIconColor ?? theme.iconTheme.color)
                      : null),
              suffixIcon: suffixWidget ??
                  (suffixIcon != null
                      ? GestureDetector(
                          onTap: onSuffixTap,
                          child: Icon(suffixIcon,
                              size: suffixIconSize,
                              color: suffixIconColor ?? theme.iconTheme.color),
                        )
                      : null),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 20),
                borderSide: BorderSide(
                  color: theme.inputDecorationTheme.enabledBorder?.borderSide.color ??
                      AppColors.borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 20),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 1.5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 20),
                borderSide: BorderSide(color: theme.colorScheme.error),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 20),
                borderSide: BorderSide(color: theme.colorScheme.error, width: 1.5),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 20),
                borderSide: BorderSide(
                  color: disabledColor ?? AppColors.borderColor,
                ),
              ),
              errorStyle: TextStyle(
                color: errorColor ?? theme.colorScheme.error,
                fontSize: 14,
              ),
            ),
            validator: (value) {
              if (isRequired && showValidator) {
                if (value?.trim().isEmpty ?? true) {

                  return requiredErrorMessage ?? '$title is required, *';

                }
                if (validator != null) return validator!(value?.trim());
              } else if ((value?.trim().isNotEmpty ?? false) && showValidator) {
                if (validator != null) return validator!(value?.trim());
              } else if (!showValidator) {
                return validator?.call(value?.trim());
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
