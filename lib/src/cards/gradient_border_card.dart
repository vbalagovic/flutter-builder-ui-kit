// lib/src/cards/gradient_border_card.dart

import 'package:flutter/material.dart';

class GradientBorderCardStyle {
  final List<Color> gradientColors;
  final List<double>? gradientStops;
  final AlignmentGeometry gradientBegin;
  final AlignmentGeometry gradientEnd;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final List<BoxShadow>? shadows;
  final Duration? animationDuration;
  final Curve animationCurve;
  final double? width;
  final double? height;
  final bool animate;
  final double hoverScale;
  final bool useHoverEffect;
  final LinearGradient? backgroundGradient;

  const GradientBorderCardStyle({
    this.gradientColors = const [Colors.blue, Colors.purple],
    this.gradientStops,
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
    this.borderWidth = 2.0,
    this.borderRadius = 12.0,
    this.padding,
    this.backgroundColor,
    this.shadows,
    this.animationDuration,
    this.animationCurve = Curves.easeInOut,
    this.width,
    this.height,
    this.animate = true,
    this.hoverScale = 1.02,
    this.useHoverEffect = true,
    this.backgroundGradient,
  });

  GradientBorderCardStyle copyWith({
    List<Color>? gradientColors,
    List<double>? gradientStops,
    AlignmentGeometry? gradientBegin,
    AlignmentGeometry? gradientEnd,
    double? borderWidth,
    double? borderRadius,
    EdgeInsets? padding,
    Color? backgroundColor,
    List<BoxShadow>? shadows,
    Duration? animationDuration,
    Curve? animationCurve,
    double? width,
    double? height,
    bool? animate,
    double? hoverScale,
    bool? useHoverEffect,
    LinearGradient? backgroundGradient,
  }) {
    return GradientBorderCardStyle(
      gradientColors: gradientColors ?? this.gradientColors,
      gradientStops: gradientStops ?? this.gradientStops,
      gradientBegin: gradientBegin ?? this.gradientBegin,
      gradientEnd: gradientEnd ?? this.gradientEnd,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadows: shadows ?? this.shadows,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      width: width ?? this.width,
      height: height ?? this.height,
      animate: animate ?? this.animate,
      hoverScale: hoverScale ?? this.hoverScale,
      useHoverEffect: useHoverEffect ?? this.useHoverEffect,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
    );
  }
}

class GradientBorderCard extends StatefulWidget {
  final Widget child;
  final GradientBorderCardStyle? style;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;
  final String? tooltip;

  const GradientBorderCard({
    super.key,
    required this.child,
    this.style,
    this.onTap,
    this.onLongPress,
    this.enabled = true,
    this.tooltip,
  });

  @override
  State<GradientBorderCard> createState() => _GradientBorderCardState();
}

class _GradientBorderCardState extends State<GradientBorderCard> {
  bool _isHovered = false;

  GradientBorderCardStyle get _effectiveStyle {
    final theme = Theme.of(context);

    return widget.style ??
        GradientBorderCardStyle(
          gradientColors: [
            theme.colorScheme.primary,
            theme.colorScheme.secondary,
          ],
          backgroundColor: theme.cardColor,
          padding: const EdgeInsets.all(16),
          shadows: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          animationDuration: const Duration(milliseconds: 200),
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

    Widget card = Container(
      decoration: BoxDecoration(
        gradient: style.backgroundGradient,
        color: style.backgroundColor,
        borderRadius:
            BorderRadius.circular(style.borderRadius + style.borderWidth),
        boxShadow: style.shadows,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: style.gradientColors,
            stops: style.gradientStops,
            begin: style.gradientBegin,
            end: style.gradientEnd,
          ),
          borderRadius:
              BorderRadius.circular(style.borderRadius + style.borderWidth),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: style.backgroundColor,
            borderRadius: BorderRadius.circular(style.borderRadius),
          ),
          margin: EdgeInsets.all(style.borderWidth),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(style.borderRadius),
            child: content,
          ),
        ),
      ),
    );

    if (widget.enabled &&
        (widget.onTap != null || widget.onLongPress != null)) {
      card = MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          onLongPress: widget.onLongPress,
          child: card,
        ),
      );
    }

    if (style.animate && style.useHoverEffect) {
      card = AnimatedContainer(
        duration: style.animationDuration ?? const Duration(milliseconds: 200),
        curve: style.animationCurve,
        transform: Matrix4.identity()
          ..scale(_isHovered ? style.hoverScale : 1.0),
        child: card,
      );
    }

    if (widget.tooltip != null) {
      card = Tooltip(
        message: widget.tooltip!,
        child: card,
      );
    }

    return card;
  }
}
