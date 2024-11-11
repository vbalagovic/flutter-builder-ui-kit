// lib/src/inputs/text_input.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputStyle {
  final InputDecoration? decoration;
  final TextStyle? textStyle;
  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final Color? fillColor;
  final Color? focusColor;
  final Color? errorColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final Duration? animationDuration;
  final BorderSide? border;
  final BorderSide? focusedBorder;
  final BorderSide? errorBorder;
  final BoxShadow? shadow;
  final Color? cursorColor;
  final double? cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final bool? showCursor;

  const TextInputStyle({
    this.decoration,
    this.textStyle,
    this.contentPadding,
    this.borderRadius,
    this.fillColor,
    this.focusColor,
    this.errorColor,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.animationDuration,
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.shadow,
    this.cursorColor,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.showCursor,
  });

  TextInputStyle copyWith({
    InputDecoration? decoration,
    TextStyle? textStyle,
    EdgeInsets? contentPadding,
    double? borderRadius,
    Color? fillColor,
    Color? focusColor,
    Color? errorColor,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? errorStyle,
    Duration? animationDuration,
    BorderSide? border,
    BorderSide? focusedBorder,
    BorderSide? errorBorder,
    BoxShadow? shadow,
    Color? cursorColor,
    double? cursorWidth,
    double? cursorHeight,
    Radius? cursorRadius,
    bool? showCursor,
  }) {
    return TextInputStyle(
      decoration: decoration ?? this.decoration,
      textStyle: textStyle ?? this.textStyle,
      contentPadding: contentPadding ?? this.contentPadding,
      borderRadius: borderRadius ?? this.borderRadius,
      fillColor: fillColor ?? this.fillColor,
      focusColor: focusColor ?? this.focusColor,
      errorColor: errorColor ?? this.errorColor,
      labelStyle: labelStyle ?? this.labelStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      animationDuration: animationDuration ?? this.animationDuration,
      border: border ?? this.border,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      errorBorder: errorBorder ?? this.errorBorder,
      shadow: shadow ?? this.shadow,
      cursorColor: cursorColor ?? this.cursorColor,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      cursorRadius: cursorRadius ?? this.cursorRadius,
      showCursor: showCursor ?? this.showCursor,
    );
  }
}

class StyledTextInput extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final bool required;
  final bool enabled;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputStyle? style;
  final int? maxLines;
  final int? minLines;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final bool obscureText;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? errorText;
  final bool autofocus;
  final String? helperText;
  final GestureTapCallback? onTap;
  final bool readOnly;

  const StyledTextInput({
    super.key,
    this.label,
    this.hint,
    this.initialValue,
    this.required = false,
    this.enabled = true,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.style,
    this.maxLines = 1,
    this.minLines,
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.onEditingComplete,
    this.onSubmitted,
    this.obscureText = false,
    this.prefix,
    this.suffix,
    this.suffixIcon,
    this.errorText,
    this.autofocus = false,
    this.helperText,
    this.onTap,
    this.readOnly = false,
  });

  TextInputStyle get _defaultStyle => const TextInputStyle(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        borderRadius: 8,
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveStyle = style ?? _defaultStyle;

    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        effectiveStyle.borderRadius ?? _defaultStyle.borderRadius!,
      ),
      borderSide: effectiveStyle.border ??
          BorderSide(color: theme.colorScheme.outline.withOpacity(0.3)),
    );

    final defaultFocusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        effectiveStyle.borderRadius ?? _defaultStyle.borderRadius!,
      ),
      borderSide: effectiveStyle.focusedBorder ??
          BorderSide(
            color: theme.colorScheme.primary,
            width: 2,
          ),
    );

    return Container(
      decoration: effectiveStyle.shadow == null
          ? null
          : BoxDecoration(
              boxShadow: [effectiveStyle.shadow!],
            ),
      child: TextFormField(
        controller: controller,
        initialValue: controller == null ? initialValue : null,
        focusNode: focusNode,
        decoration: effectiveStyle.decoration?.copyWith(
              labelText: label,
              hintText: hint,
              errorText: errorText,
              helperText: helperText,
              prefix: prefix,
              suffix: suffix,
              suffixIcon: suffixIcon,
            ) ??
            InputDecoration(
              labelText: label,
              hintText: hint,
              errorText: errorText,
              helperText: helperText,
              prefix: prefix,
              suffix: suffix,
              suffixIcon: suffixIcon,
              contentPadding:
                  effectiveStyle.contentPadding ?? _defaultStyle.contentPadding,
              border: defaultBorder,
              enabledBorder: defaultBorder,
              focusedBorder: defaultFocusedBorder,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  effectiveStyle.borderRadius ?? _defaultStyle.borderRadius!,
                ),
                borderSide: effectiveStyle.errorBorder ??
                    BorderSide(color: theme.colorScheme.error),
              ),
              fillColor: effectiveStyle.fillColor,
              filled: effectiveStyle.fillColor != null,
              labelStyle: effectiveStyle.labelStyle,
              hintStyle: effectiveStyle.hintStyle,
              errorStyle: effectiveStyle.errorStyle,
            ),
        style: effectiveStyle.textStyle,
        enabled: enabled,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        textInputAction: textInputAction,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        minLines: minLines,
        obscureText: obscureText,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onSubmitted,
        validator: validator ?? (required ? _requiredValidator : null),
        autofocus: autofocus,
        cursorColor: effectiveStyle.cursorColor,
        cursorWidth: effectiveStyle.cursorWidth ?? 2.0,
        cursorHeight: effectiveStyle.cursorHeight,
        cursorRadius: effectiveStyle.cursorRadius,
        showCursor: effectiveStyle.showCursor,
      ),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '$label is required';
    }
    return null;
  }
}
