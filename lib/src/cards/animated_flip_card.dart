// lib/src/cards/animated_flip_card.dart

import 'dart:math' show pi;
import 'package:flutter/material.dart';

enum FlipDirection {
  horizontal,
  vertical,
}

class AnimatedFlipCardStyle {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? shadows;
  final Color? frontColor;
  final Color? backColor;
  final Border? border;
  final Duration flipDuration;
  final Curve flipCurve;
  final EdgeInsets? padding;
  final BoxDecoration? frontDecoration;
  final BoxDecoration? backDecoration;
  final FlipDirection direction;
  final bool fill;

  const AnimatedFlipCardStyle({
    this.width,
    this.height,
    this.borderRadius,
    this.shadows,
    this.frontColor,
    this.backColor,
    this.border,
    this.flipDuration = const Duration(milliseconds: 400),
    this.flipCurve = Curves.easeInOut,
    this.padding,
    this.frontDecoration,
    this.backDecoration,
    this.direction = FlipDirection.horizontal,
    this.fill = false,
  });

  AnimatedFlipCardStyle copyWith({
    double? width,
    double? height,
    BorderRadius? borderRadius,
    List<BoxShadow>? shadows,
    Color? frontColor,
    Color? backColor,
    Border? border,
    Duration? flipDuration,
    Curve? flipCurve,
    EdgeInsets? padding,
    BoxDecoration? frontDecoration,
    BoxDecoration? backDecoration,
    FlipDirection? direction,
    bool? fill,
  }) {
    return AnimatedFlipCardStyle(
      width: width ?? this.width,
      height: height ?? this.height,
      borderRadius: borderRadius ?? this.borderRadius,
      shadows: shadows ?? this.shadows,
      frontColor: frontColor ?? this.frontColor,
      backColor: backColor ?? this.backColor,
      border: border ?? this.border,
      flipDuration: flipDuration ?? this.flipDuration,
      flipCurve: flipCurve ?? this.flipCurve,
      padding: padding ?? this.padding,
      frontDecoration: frontDecoration ?? this.frontDecoration,
      backDecoration: backDecoration ?? this.backDecoration,
      direction: direction ?? this.direction,
      fill: fill ?? this.fill,
    );
  }
}

class AnimatedFlipCard extends StatefulWidget {
  final Widget front;
  final Widget back;
  final AnimatedFlipCardStyle? style;
  final VoidCallback? onFlip;
  final bool flipOnTap;
  final bool isFlipped;

  const AnimatedFlipCard({
    super.key,
    required this.front,
    required this.back,
    this.style,
    this.onFlip,
    this.flipOnTap = true,
    this.isFlipped = false,
  });

  @override
  State<AnimatedFlipCard> createState() => _AnimatedFlipCardState();
}

class _AnimatedFlipCardState extends State<AnimatedFlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late bool _isFrontVisible;

  @override
  void initState() {
    super.initState();
    _isFrontVisible = !widget.isFlipped;
    _controller = AnimationController(
      vsync: this,
      duration: widget.style?.flipDuration ?? const Duration(milliseconds: 400),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.style?.flipCurve ?? Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          _isFrontVisible = !_isFrontVisible;
        }
      });

    if (widget.isFlipped) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(AnimatedFlipCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFlipped != oldWidget.isFlipped) {
      if (widget.isFlipped) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleCard() {
    if (widget.flipOnTap) {
      if (_controller.isAnimating) return;
      widget.onFlip?.call();
      if (_isFrontVisible) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  AnimatedFlipCardStyle get _effectiveStyle {
    final theme = Theme.of(context);

    return widget.style ??
        AnimatedFlipCardStyle(
          frontColor: theme.cardColor,
          backColor: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
          shadows: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          padding: const EdgeInsets.all(16),
        );
  }

  @override
  Widget build(BuildContext context) {
    final style = _effectiveStyle;

    Widget buildCard(Widget child, bool isFront) {
      return Container(
        width: style.width,
        height: style.height,
        padding: style.padding,
        decoration: (isFront ? style.frontDecoration : style.backDecoration) ??
            BoxDecoration(
              color: isFront ? style.frontColor : style.backColor,
              borderRadius: style.borderRadius,
              border: style.border,
              boxShadow: style.shadows,
            ),
        child: child,
      );
    }

    final angle = style.direction == FlipDirection.horizontal
        ? _animation.value * pi
        : _animation.value * pi;

    return GestureDetector(
      onTap: _toggleCard,
      child: style.fill
          ? SizedBox.expand(
              child: _buildFlipAnimation(angle, buildCard),
            )
          : _buildFlipAnimation(angle, buildCard),
    );
  }

  Widget _buildFlipAnimation(
      double angle, Widget Function(Widget child, bool isFront) buildCard) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(
            widget.style?.direction == FlipDirection.horizontal ? angle : 0)
        ..rotateX(
            widget.style?.direction == FlipDirection.vertical ? angle : 0),
      alignment: Alignment.center,
      child: angle < (pi / 2)
          ? buildCard(widget.front, true)
          : Transform(
              transform: Matrix4.identity()
                ..rotateY(widget.style?.direction == FlipDirection.horizontal
                    ? pi
                    : 0)
                ..rotateX(
                    widget.style?.direction == FlipDirection.vertical ? pi : 0),
              alignment: Alignment.center,
              child: buildCard(widget.back, false),
            ),
    );
  }
}
