// lib/src/cards/expandable_card.dart

import 'package:flutter/material.dart';

class ExpandableCardStyle {
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? shadows;
  final Border? border;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final Duration expandDuration;
  final Curve expandCurve;
  final Color? headerColor;
  final TextStyle? titleStyle;
  final double? elevation;
  final Color? dividerColor;
  final IconThemeData? iconTheme;
  final BoxDecoration? headerDecoration;
  final BoxDecoration? contentDecoration;
  final bool showDivider;
  final bool showExpandIcon;
  final EdgeInsets? headerPadding;
  final double? collapsedHeight;

  const ExpandableCardStyle({
    this.backgroundColor,
    this.borderRadius,
    this.shadows,
    this.border,
    this.padding,
    this.contentPadding,
    this.expandDuration = const Duration(milliseconds: 300),
    this.expandCurve = Curves.easeInOut,
    this.headerColor,
    this.titleStyle,
    this.elevation,
    this.dividerColor,
    this.iconTheme,
    this.headerDecoration,
    this.contentDecoration,
    this.showDivider = true,
    this.showExpandIcon = true,
    this.headerPadding,
    this.collapsedHeight,
  });

  ExpandableCardStyle copyWith({
    Color? backgroundColor,
    BorderRadius? borderRadius,
    List<BoxShadow>? shadows,
    Border? border,
    EdgeInsets? padding,
    EdgeInsets? contentPadding,
    Duration? expandDuration,
    Curve? expandCurve,
    Color? headerColor,
    TextStyle? titleStyle,
    double? elevation,
    Color? dividerColor,
    IconThemeData? iconTheme,
    BoxDecoration? headerDecoration,
    BoxDecoration? contentDecoration,
    bool? showDivider,
    bool? showExpandIcon,
    EdgeInsets? headerPadding,
    double? collapsedHeight,
  }) {
    return ExpandableCardStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      shadows: shadows ?? this.shadows,
      border: border ?? this.border,
      padding: padding ?? this.padding,
      contentPadding: contentPadding ?? this.contentPadding,
      expandDuration: expandDuration ?? this.expandDuration,
      expandCurve: expandCurve ?? this.expandCurve,
      headerColor: headerColor ?? this.headerColor,
      titleStyle: titleStyle ?? this.titleStyle,
      elevation: elevation ?? this.elevation,
      dividerColor: dividerColor ?? this.dividerColor,
      iconTheme: iconTheme ?? this.iconTheme,
      headerDecoration: headerDecoration ?? this.headerDecoration,
      contentDecoration: contentDecoration ?? this.contentDecoration,
      showDivider: showDivider ?? this.showDivider,
      showExpandIcon: showExpandIcon ?? this.showExpandIcon,
      headerPadding: headerPadding ?? this.headerPadding,
      collapsedHeight: collapsedHeight ?? this.collapsedHeight,
    );
  }
}

class ExpandableCard extends StatefulWidget {
  final Widget title;
  final Widget content;
  final ExpandableCardStyle? style;
  final bool initiallyExpanded;
  final ValueChanged<bool>? onExpansionChanged;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? footer;
  final bool maintainState;
  final Color? backgroundColor;
  final String? semanticsLabel;

  const ExpandableCard({
    super.key,
    required this.title,
    required this.content,
    this.style,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
    this.leading,
    this.actions,
    this.footer,
    this.maintainState = false,
    this.backgroundColor,
    this.semanticsLabel,
  });

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration:
          widget.style?.expandDuration ?? const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightFactor = _controller.drive(CurveTween(
      curve: widget.style?.expandCurve ?? Curves.easeInOut,
    ));

    _isExpanded = widget.initiallyExpanded;
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      widget.onExpansionChanged?.call(_isExpanded);
    });
  }

  ExpandableCardStyle get _effectiveStyle {
    final theme = Theme.of(context);

    return widget.style ??
        ExpandableCardStyle(
          backgroundColor: theme.cardColor,
          headerColor: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          shadows: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          padding: const EdgeInsets.all(16),
          contentPadding: const EdgeInsets.all(16),
          titleStyle: theme.textTheme.titleMedium,
          dividerColor: theme.dividerColor,
          iconTheme: theme.iconTheme.copyWith(
            color: theme.colorScheme.primary,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final style = _effectiveStyle;
    final theme = Theme.of(context);

    final Widget headerChild = Container(
      decoration: style.headerDecoration,
      padding: style.headerPadding ?? style.padding,
      child: Row(
        children: [
          if (widget.leading != null) ...[
            widget.leading!,
            const SizedBox(width: 16),
          ],
          Expanded(child: widget.title),
          if (widget.actions != null) ...widget.actions!,
          if (style.showExpandIcon)
            RotationTransition(
              turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
              child: IconTheme(
                data: style.iconTheme ?? theme.iconTheme,
                child: const Icon(Icons.expand_more),
              ),
            ),
        ],
      ),
    );

    final Widget expandableContent = ClipRect(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Align(
            heightFactor: _heightFactor.value,
            child: child,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (style.showDivider) Divider(color: style.dividerColor),
            Container(
              padding: style.contentPadding,
              decoration: style.contentDecoration,
              child: widget.content,
            ),
            if (widget.footer != null) widget.footer!,
          ],
        ),
      ),
    );

    return Semantics(
      label: widget.semanticsLabel,
      child: Material(
        color:
            widget.backgroundColor ?? style.backgroundColor ?? theme.cardColor,
        elevation: style.elevation ?? 0,
        borderRadius: style.borderRadius,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            border: style.border,
            boxShadow: style.shadows,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: _handleTap,
                child: headerChild,
              ),
              if (!widget.maintainState && _isExpanded || widget.maintainState)
                expandableContent,
            ],
          ),
        ),
      ),
    );
  }
}
