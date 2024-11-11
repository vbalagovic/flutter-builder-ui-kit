// lib/src/cards/glass_card.dart

import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCardStyle {
  final double blur;
  final Color? tintColor;
  final double tintOpacity;
  final BorderRadius? borderRadius;
  final Border? border;
  final EdgeInsets? padding;
  final List<BoxShadow>? shadows;
  final Gradient? gradient;
  final double? width;
  final double? height;
  final bool clipContent;
  final Color? borderColor;
  final double borderWidth;
  final Clip clipBehavior;
  final Duration? animationDuration;
  final bool useMouseCursor;
  final BoxShape shape;

  const GlassCardStyle({
    this.blur = 10.0,
    this.tintColor,
    this.tintOpacity = 0.2,
    this.borderRadius,
    this.border,
    this.padding,
    this.shadows,
    this.gradient,
    this.width,
    this.height,
    this.clipContent = true,
    this.borderColor,
    this.borderWidth = 1.0,
    this.clipBehavior = Clip.antiAlias,
    this.animationDuration,
    this.useMouseCursor = true,
    this.shape = BoxShape.rectangle,
  });

  GlassCardStyle copyWith({
    double? blur,
    Color? tintColor,
    double? tintOpacity,
    BorderRadius? borderRadius,
    Border? border,
    EdgeInsets? padding,
    List<BoxShadow>? shadows,
    Gradient? gradient,
    double? width,
    double? height,
    bool? clipContent,
    Color? borderColor,
    double? borderWidth,
    Clip? clipBehavior,
    Duration? animationDuration,
    bool? useMouseCursor,
    BoxShape? shape,
  }) {
    return GlassCardStyle(
      blur: blur ?? this.blur,
      tintColor: tintColor ?? this.tintColor,
      tintOpacity: tintOpacity ?? this.tintOpacity,
      borderRadius: borderRadius ?? this.borderRadius,
      border: border ?? this.border,
      padding: padding ?? this.padding,
      shadows: shadows ?? this.shadows,
      gradient: gradient ?? this.gradient,
      width: width ?? this.width,
      height: height ?? this.height,
      clipContent: clipContent ?? this.clipContent,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      animationDuration: animationDuration ?? this.animationDuration,
      useMouseCursor: useMouseCursor ?? this.useMouseCursor,
      shape: shape ?? this.shape,
    );
  }
}

class GlassCard extends StatefulWidget {
  final Widget child;
  final GlassCardStyle? style;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final bool enabled;
  final String? tooltip;
  final Color? hoverColor;
  final Color? splashColor;

  const GlassCard({
    super.key,
    required this.child,
    this.style,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.enabled = true,
    this.tooltip,
    this.hoverColor,
    this.splashColor,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isHovered = false;

  GlassCardStyle get _effectiveStyle {
    final theme = Theme.of(context);

    return widget.style ??
        GlassCardStyle(
          tintColor: theme.colorScheme.surface,
          borderColor: theme.colorScheme.surface.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          padding: const EdgeInsets.all(16),
          shadows: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        );
  }

  @override
  Widget build(BuildContext context) {
    final style = _effectiveStyle;

    Widget content = Container(
      width: style.width,
      height: style.height,
      padding: style.padding,
      child: widget.child,
    );

    Widget glassEffect = ClipRRect(
      borderRadius: style.shape == BoxShape.circle
          ? BorderRadius.zero
          : style.borderRadius ?? BorderRadius.zero,
      clipBehavior: style.clipBehavior,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: style.blur,
          sigmaY: style.blur,
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: style.shape,
            color: (style.tintColor ?? Colors.white)
                .withOpacity(style.tintOpacity),
            gradient: style.gradient,
            border: style.border ??
                (style.borderColor != null
                    ? Border.all(
                        color: style.borderColor!,
                        width: style.borderWidth,
                      )
                    : null),
            borderRadius:
                style.shape == BoxShape.circle ? null : style.borderRadius,
          ),
          child: content,
        ),
      ),
    );

    if (widget.onTap != null && widget.enabled) {
      glassEffect = MouseRegion(
        cursor:
            style.useMouseCursor ? SystemMouseCursors.click : MouseCursor.defer,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: widget.onTap,
            onLongPress: widget.onLongPress,
            onDoubleTap: widget.onDoubleTap,
            borderRadius: style.borderRadius,
            hoverColor: widget.hoverColor?.withOpacity(0.1),
            splashColor: widget.splashColor?.withOpacity(0.1),
            child: glassEffect,
          ),
        ),
      );
    }

    if (style.shadows != null) {
      glassEffect = Container(
        decoration: BoxDecoration(
          boxShadow: style.shadows,
        ),
        child: glassEffect,
      );
    }

    if (widget.tooltip != null) {
      glassEffect = Tooltip(
        message: widget.tooltip!,
        child: glassEffect,
      );
    }

    if (style.animationDuration != null) {
      glassEffect = AnimatedContainer(
        duration: style.animationDuration!,
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        child: glassEffect,
      );
    }

    return glassEffect;
  }
}
