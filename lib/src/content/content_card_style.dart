import 'package:flutter/material.dart';

class ContentCardStyle {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final EdgeInsets? headerPadding;
  final EdgeInsets? contentPadding;
  final EdgeInsets? footerPadding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? shadows;
  final Border? border;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color? headerBackgroundColor;
  final Color? footerBackgroundColor;
  final bool showHeaderDivider;
  final bool showFooterDivider;
  final Color? dividerColor;
  final double? elevation;
  final Gradient? gradient;
  final BoxDecoration? headerDecoration;
  final BoxDecoration? footerDecoration;

  const ContentCardStyle({
    this.padding,
    this.margin,
    this.headerPadding,
    this.contentPadding,
    this.footerPadding,
    this.backgroundColor,
    this.borderRadius,
    this.shadows,
    this.border,
    this.titleStyle,
    this.subtitleStyle,
    this.headerBackgroundColor,
    this.footerBackgroundColor,
    this.showHeaderDivider = true,
    this.showFooterDivider = true,
    this.dividerColor,
    this.elevation,
    this.gradient,
    this.headerDecoration,
    this.footerDecoration,
  });

  ContentCardStyle copyWith({
    EdgeInsets? padding,
    EdgeInsets? margin,
    EdgeInsets? headerPadding,
    EdgeInsets? contentPadding,
    EdgeInsets? footerPadding,
    Color? backgroundColor,
    BorderRadius? borderRadius,
    List<BoxShadow>? shadows,
    Border? border,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    Color? headerBackgroundColor,
    Color? footerBackgroundColor,
    bool? showHeaderDivider,
    bool? showFooterDivider,
    Color? dividerColor,
    double? elevation,
    Gradient? gradient,
    BoxDecoration? headerDecoration,
    BoxDecoration? footerDecoration,
  }) {
    return ContentCardStyle(
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      headerPadding: headerPadding ?? this.headerPadding,
      contentPadding: contentPadding ?? this.contentPadding,
      footerPadding: footerPadding ?? this.footerPadding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      shadows: shadows ?? this.shadows,
      border: border ?? this.border,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      headerBackgroundColor:
          headerBackgroundColor ?? this.headerBackgroundColor,
      footerBackgroundColor:
          footerBackgroundColor ?? this.footerBackgroundColor,
      showHeaderDivider: showHeaderDivider ?? this.showHeaderDivider,
      showFooterDivider: showFooterDivider ?? this.showFooterDivider,
      dividerColor: dividerColor ?? this.dividerColor,
      elevation: elevation ?? this.elevation,
      gradient: gradient ?? this.gradient,
      headerDecoration: headerDecoration ?? this.headerDecoration,
      footerDecoration: footerDecoration ?? this.footerDecoration,
    );
  }
}

class ContentCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? content;
  final List<Widget>? actions;
  final ContentCardStyle? style;
  final VoidCallback? onTap;
  final Widget? header;
  final Widget? footer;

  const ContentCard({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.content,
    this.actions,
    this.style,
    this.onTap,
    this.header,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveStyle = style ?? const ContentCardStyle();

    Widget card = Container(
      margin: effectiveStyle.margin,
      decoration: BoxDecoration(
        color: effectiveStyle.backgroundColor ?? theme.cardColor,
        borderRadius: effectiveStyle.borderRadius ?? BorderRadius.circular(12),
        boxShadow: effectiveStyle.shadows,
        border: effectiveStyle.border,
        gradient: effectiveStyle.gradient,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (header != null || title.isNotEmpty) ...[
            Container(
              decoration: effectiveStyle.headerDecoration ??
                  BoxDecoration(
                    color: effectiveStyle.headerBackgroundColor,
                    borderRadius: effectiveStyle.borderRadius != null
                        ? BorderRadius.vertical(
                            top: effectiveStyle.borderRadius!.topLeft,
                          )
                        : null,
                  ),
              padding: effectiveStyle.headerPadding ?? const EdgeInsets.all(16),
              child: header ??
                  Row(
                    children: [
                      if (leading != null) ...[
                        leading!,
                        const SizedBox(width: 16),
                      ],
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: effectiveStyle.titleStyle ??
                                  theme.textTheme.titleLarge,
                            ),
                            if (subtitle != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                subtitle!,
                                style: effectiveStyle.subtitleStyle ??
                                    theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.textTheme.bodySmall?.color,
                                    ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
            ),
            if (effectiveStyle.showHeaderDivider)
              Divider(
                height: 1,
                color: effectiveStyle.dividerColor ?? theme.dividerColor,
              ),
          ],
          if (content != null)
            Padding(
              padding:
                  effectiveStyle.contentPadding ?? const EdgeInsets.all(16),
              child: content!,
            ),
          if (actions != null || footer != null) ...[
            if (effectiveStyle.showFooterDivider)
              Divider(
                height: 1,
                color: effectiveStyle.dividerColor ?? theme.dividerColor,
              ),
            Container(
              decoration: effectiveStyle.footerDecoration ??
                  BoxDecoration(
                    color: effectiveStyle.footerBackgroundColor,
                    borderRadius: effectiveStyle.borderRadius != null
                        ? BorderRadius.vertical(
                            bottom: effectiveStyle.borderRadius!.bottomLeft,
                          )
                        : null,
                  ),
              padding: effectiveStyle.footerPadding ?? const EdgeInsets.all(16),
              child: footer ??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ...actions!.map((action) => Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: action,
                          )),
                    ],
                  ),
            ),
          ],
        ],
      ),
    );

    if (onTap != null) {
      card = InkWell(
        onTap: onTap,
        borderRadius: effectiveStyle.borderRadius ?? BorderRadius.circular(12),
        child: card,
      );
    }

    return card;
  }
}

class ContentSectionStyle {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final Color? backgroundColor;
  final Color? headerBackgroundColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? shadows;
  final Border? border;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final bool collapsible;
  final Duration animationDuration;
  final Curve animationCurve;
  final Color? dividerColor;
  final bool showDivider;
  final IconData? expandIcon;
  final IconData? collapseIcon;
  final Color? iconColor;

  const ContentSectionStyle({
    this.padding,
    this.contentPadding,
    this.backgroundColor,
    this.headerBackgroundColor,
    this.borderRadius,
    this.shadows,
    this.border,
    this.titleStyle,
    this.subtitleStyle,
    this.collapsible = false,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.dividerColor,
    this.showDivider = true,
    this.expandIcon,
    this.collapseIcon,
    this.iconColor,
  });

  ContentSectionStyle copyWith({
    EdgeInsets? padding,
    EdgeInsets? contentPadding,
    Color? backgroundColor,
    Color? headerBackgroundColor,
    BorderRadius? borderRadius,
    List<BoxShadow>? shadows,
    Border? border,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    bool? collapsible,
    Duration? animationDuration,
    Curve? animationCurve,
    Color? dividerColor,
    bool? showDivider,
    IconData? expandIcon,
    IconData? collapseIcon,
    Color? iconColor,
  }) {
    return ContentSectionStyle(
      padding: padding ?? this.padding,
      contentPadding: contentPadding ?? this.contentPadding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      headerBackgroundColor:
          headerBackgroundColor ?? this.headerBackgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      shadows: shadows ?? this.shadows,
      border: border ?? this.border,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      collapsible: collapsible ?? this.collapsible,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      dividerColor: dividerColor ?? this.dividerColor,
      showDivider: showDivider ?? this.showDivider,
      expandIcon: expandIcon ?? this.expandIcon,
      collapseIcon: collapseIcon ?? this.collapseIcon,
      iconColor: iconColor ?? this.iconColor,
    );
  }
}

class ContentGridStyle {
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsets? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final double? maxCrossAxisExtent;
  final double childAspectRatio;
  final EdgeInsets? itemPadding;
  final Color? itemBackgroundColor;
  final BorderRadius? itemBorderRadius;
  final Border? itemBorder;
  final BoxShadow? itemShadow;
  final Color? backgroundColor;
  final Gradient? itemGradient;
  final bool wrapInCard;
  final Duration? animationDuration;
  final bool animate;

  const ContentGridStyle({
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 16,
    this.crossAxisSpacing = 16,
    this.padding,
    this.shrinkWrap = true,
    this.physics,
    this.maxCrossAxisExtent,
    this.childAspectRatio = 1.0,
    this.itemPadding,
    this.itemBackgroundColor,
    this.itemBorderRadius,
    this.itemBorder,
    this.itemShadow,
    this.backgroundColor,
    this.itemGradient,
    this.wrapInCard = false,
    this.animationDuration,
    this.animate = false,
  });

  ContentGridStyle copyWith({
    int? crossAxisCount,
    double? mainAxisSpacing,
    double? crossAxisSpacing,
    EdgeInsets? padding,
    bool? shrinkWrap,
    ScrollPhysics? physics,
    double? maxCrossAxisExtent,
    double? childAspectRatio,
    EdgeInsets? itemPadding,
    Color? itemBackgroundColor,
    BorderRadius? itemBorderRadius,
    Border? itemBorder,
    BoxShadow? itemShadow,
    Color? backgroundColor,
    Gradient? itemGradient,
    bool? wrapInCard,
    Duration? animationDuration,
    bool? animate,
  }) {
    return ContentGridStyle(
      crossAxisCount: crossAxisCount ?? this.crossAxisCount,
      mainAxisSpacing: mainAxisSpacing ?? this.mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing ?? this.crossAxisSpacing,
      padding: padding ?? this.padding,
      shrinkWrap: shrinkWrap ?? this.shrinkWrap,
      physics: physics ?? this.physics,
      maxCrossAxisExtent: maxCrossAxisExtent ?? this.maxCrossAxisExtent,
      childAspectRatio: childAspectRatio ?? this.childAspectRatio,
      itemPadding: itemPadding ?? this.itemPadding,
      itemBackgroundColor: itemBackgroundColor ?? this.itemBackgroundColor,
      itemBorderRadius: itemBorderRadius ?? this.itemBorderRadius,
      itemBorder: itemBorder ?? this.itemBorder,
      itemShadow: itemShadow ?? this.itemShadow,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      itemGradient: itemGradient ?? this.itemGradient,
      wrapInCard: wrapInCard ?? this.wrapInCard,
      animationDuration: animationDuration ?? this.animationDuration,
      animate: animate ?? this.animate,
    );
  }
}

class ContentGrid extends StatelessWidget {
  final List<Widget> children;
  final ContentGridStyle? style;

  const ContentGrid({
    super.key,
    required this.children,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveStyle = style ?? const ContentGridStyle();

    Widget grid = GridView.builder(
      padding: effectiveStyle.padding,
      shrinkWrap: effectiveStyle.shrinkWrap,
      physics: effectiveStyle.physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: effectiveStyle.crossAxisCount,
        mainAxisSpacing: effectiveStyle.mainAxisSpacing,
        crossAxisSpacing: effectiveStyle.crossAxisSpacing,
        childAspectRatio: effectiveStyle.childAspectRatio,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) {
        Widget child = children[index];

        if (effectiveStyle.animate) {
          child = AnimatedBuilder(
            animation: const AlwaysStoppedAnimation(1.0),
            builder: (context, child) => FadeTransition(
              opacity: CurvedAnimation(
                parent: const AlwaysStoppedAnimation(1.0),
                curve: Interval(
                  index * 0.1,
                  1.0,
                  curve: Curves.easeOut,
                ),
              ),
              child: child,
            ),
            child: child,
          );
        }

        if (effectiveStyle.itemPadding != null ||
            effectiveStyle.itemBackgroundColor != null ||
            effectiveStyle.itemBorderRadius != null ||
            effectiveStyle.itemBorder != null ||
            effectiveStyle.itemShadow != null ||
            effectiveStyle.itemGradient != null) {
          child = Container(
            padding: effectiveStyle.itemPadding,
            decoration: BoxDecoration(
              color: effectiveStyle.itemBackgroundColor,
              borderRadius: effectiveStyle.itemBorderRadius,
              border: effectiveStyle.itemBorder,
              boxShadow: effectiveStyle.itemShadow != null
                  ? [effectiveStyle.itemShadow!]
                  : null,
              gradient: effectiveStyle.itemGradient,
            ),
            child: child,
          );
        }

        return child;
      },
    );

    if (effectiveStyle.wrapInCard) {
      grid = Card(
        margin: EdgeInsets.zero,
        color: effectiveStyle.backgroundColor ?? theme.cardColor,
        child: grid,
      );
    }

    return grid;
  }
}

class ContentTimelineStyle {
  final Color? lineColor;
  final double lineWidth;
  final Color? indicatorColor;
  final double indicatorRadius;
  final EdgeInsets? itemPadding;
  final double itemSpacing;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color? itemBackgroundColor;
  final BorderRadius? itemBorderRadius;
  final BoxShadow? itemShadow;
  final bool showConnector;
  final bool alternatePosition;
  final Duration animationDuration;
  final bool animate;
  final Border? itemBorder;
  final EdgeInsets? contentPadding;
  final Widget? customIndicator;
  final Color? backgroundColor;
  final bool showDateLabels;
  final TextStyle? dateStyle;
  final EdgeInsets? indicatorPadding;

  const ContentTimelineStyle({
    this.lineColor,
    this.lineWidth = 2,
    this.indicatorColor,
    this.indicatorRadius = 6,
    this.itemPadding,
    this.itemSpacing = 20,
    this.titleStyle,
    this.subtitleStyle,
    this.itemBackgroundColor,
    this.itemBorderRadius,
    this.itemShadow,
    this.showConnector = true,
    this.alternatePosition = false,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animate = true,
    this.itemBorder,
    this.contentPadding,
    this.customIndicator,
    this.backgroundColor,
    this.showDateLabels = false,
    this.dateStyle,
    this.indicatorPadding,
  });

  ContentTimelineStyle copyWith({
    Color? lineColor,
    double? lineWidth,
    Color? indicatorColor,
    double? indicatorRadius,
    EdgeInsets? itemPadding,
    double? itemSpacing,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    Color? itemBackgroundColor,
    BorderRadius? itemBorderRadius,
    BoxShadow? itemShadow,
    bool? showConnector,
    bool? alternatePosition,
    Duration? animationDuration,
    bool? animate,
    Border? itemBorder,
    EdgeInsets? contentPadding,
    Widget? customIndicator,
    Color? backgroundColor,
    bool? showDateLabels,
    TextStyle? dateStyle,
    EdgeInsets? indicatorPadding,
  }) {
    return ContentTimelineStyle(
      lineColor: lineColor ?? this.lineColor,
      lineWidth: lineWidth ?? this.lineWidth,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      indicatorRadius: indicatorRadius ?? this.indicatorRadius,
      itemPadding: itemPadding ?? this.itemPadding,
      itemSpacing: itemSpacing ?? this.itemSpacing,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      itemBackgroundColor: itemBackgroundColor ?? this.itemBackgroundColor,
      itemBorderRadius: itemBorderRadius ?? this.itemBorderRadius,
      itemShadow: itemShadow ?? this.itemShadow,
      showConnector: showConnector ?? this.showConnector,
      alternatePosition: alternatePosition ?? this.alternatePosition,
      animationDuration: animationDuration ?? this.animationDuration,
      animate: animate ?? this.animate,
      itemBorder: itemBorder ?? this.itemBorder,
      contentPadding: contentPadding ?? this.contentPadding,
      customIndicator: customIndicator ?? this.customIndicator,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      showDateLabels: showDateLabels ?? this.showDateLabels,
      dateStyle: dateStyle ?? this.dateStyle,
      indicatorPadding: indicatorPadding ?? this.indicatorPadding,
    );
  }
}

class ContentTimelineItem {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget content;
  final Widget? indicator;
  final DateTime? date;

  const ContentTimelineItem({
    required this.title,
    this.subtitle,
    this.leading,
    required this.content,
    this.indicator,
    this.date,
  });
}

class ContentTimeline extends StatefulWidget {
  final List<ContentTimelineItem> items;
  final ContentTimelineStyle? style;

  const ContentTimeline({
    super.key,
    required this.items,
    this.style,
  });

  @override
  State<ContentTimeline> createState() => _ContentTimelineState();
}

class _ContentTimelineState extends State<ContentTimeline> {
  final List<bool> _visibleItems = [];

  @override
  void initState() {
    super.initState();
    _visibleItems.addAll(List.filled(widget.items.length, false));
    _animateItems();
  }

  void _animateItems() async {
    if (!(widget.style?.animate ?? true)) {
      setState(() {
        _visibleItems.fillRange(0, _visibleItems.length, true);
      });
      return;
    }

    for (int i = 0; i < _visibleItems.length; i++) {
      await Future.delayed(
        widget.style?.animationDuration ?? const Duration(milliseconds: 300),
      );
      if (mounted) {
        setState(() {
          _visibleItems[i] = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = widget.style ?? const ContentTimelineStyle();

    return Container(
      color: style.backgroundColor,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          final isLeft = !style.alternatePosition || index.isEven;

          return AnimatedOpacity(
            opacity: _visibleItems[index] ? 1.0 : 0.0,
            duration: style.animationDuration,
            curve: Curves.easeInOut,
            child: Column(
              children: [
                if (style.showDateLabels && item.date != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      item.date.toString(), // Format as needed
                      style: style.dateStyle ?? theme.textTheme.bodySmall,
                    ),
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isLeft)
                      _buildTimelineItem(context, item, style, theme, true)
                    else
                      const Spacer(),
                    _buildIndicator(style, theme, item),
                    if (!isLeft)
                      _buildTimelineItem(context, item, style, theme, false)
                    else
                      const Spacer(),
                  ],
                ),
                SizedBox(height: style.itemSpacing),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context,
    ContentTimelineItem item,
    ContentTimelineStyle style,
    ThemeData theme,
    bool isLeft,
  ) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          left: isLeft ? 0 : style.itemSpacing,
          right: isLeft ? style.itemSpacing : 0,
        ),
        padding: style.itemPadding ?? const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: style.itemBackgroundColor ?? theme.cardColor,
          borderRadius: style.itemBorderRadius ?? BorderRadius.circular(8),
          boxShadow: style.itemShadow != null ? [style.itemShadow!] : null,
          border: style.itemBorder,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (item.leading != null) ...[
                  item.leading!,
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: style.titleStyle ?? theme.textTheme.titleMedium,
                      ),
                      if (item.subtitle != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          item.subtitle!,
                          style:
                              style.subtitleStyle ?? theme.textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            if (style.contentPadding != null)
              Padding(
                padding: style.contentPadding!,
                child: item.content,
              )
            else
              item.content,
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(
    ContentTimelineStyle style,
    ThemeData theme,
    ContentTimelineItem item,
  ) {
    return Container(
      padding: style.indicatorPadding,
      child: Column(
        children: [
          item.indicator ??
              Container(
                width: style.indicatorRadius * 2,
                height: style.indicatorRadius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: style.indicatorColor ?? theme.primaryColor,
                ),
              ),
          if (style.showConnector)
            Container(
              width: style.lineWidth,
              height: 50,
              color: style.lineColor ?? theme.dividerColor,
            ),
        ],
      ),
    );
  }
}

// Additional helper widgets for ContentTimeline
class TimelineConnector extends StatelessWidget {
  final Color? color;
  final double width;
  final double height;
  final bool isDashed;
  final double dashLength;
  final double dashSpacing;

  const TimelineConnector({
    super.key,
    this.color,
    this.width = 2,
    this.height = 50,
    this.isDashed = false,
    this.dashLength = 5,
    this.dashSpacing = 3,
  });

  @override
  Widget build(BuildContext context) {
    if (!isDashed) {
      return Container(
        width: width,
        height: height,
        color: color ?? Theme.of(context).dividerColor,
      );
    }

    return Column(
      children: List.generate(
        (height / (dashLength + dashSpacing)).ceil() * 2 - 1,
        (index) => index.isEven
            ? Container(
                width: width,
                height: dashLength,
                color: color ?? Theme.of(context).dividerColor,
              )
            : SizedBox(height: dashSpacing),
      ),
    );
  }
}

class TimelineIndicator extends StatelessWidget {
  final double size;
  final Color? color;
  final Widget? child;
  final BoxBorder? border;
  final List<BoxShadow>? shadows;
  final Gradient? gradient;

  const TimelineIndicator({
    super.key,
    this.size = 12,
    this.color,
    this.child,
    this.border,
    this.shadows,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? Theme.of(context).primaryColor,
        border: border,
        boxShadow: shadows,
        gradient: gradient,
      ),
      child: child,
    );
  }
}

// Additional extensions to support timeline features
extension DateTimeExtension on DateTime {
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  String formatDate([String format = 'MMM dd, yyyy']) {
    // Implement date formatting based on your needs
    return toString();
  }
}

// Example usage of all widgets together:
class ExampleTimelineUsage extends StatelessWidget {
  const ExampleTimelineUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentTimeline(
      style: ContentTimelineStyle(
        lineColor: Colors.teal.shade200,
        indicatorColor: Colors.teal,
        itemBackgroundColor: Colors.teal.shade50,
        itemBorderRadius: BorderRadius.circular(12),
        itemShadow: BoxShadow(
          color: Colors.teal.shade100,
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
        titleStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        showDateLabels: true,
        alternatePosition: true,
        animate: true,
      ),
      items: [
        ContentTimelineItem(
          title: 'Project Started',
          subtitle: 'January 1, 2024',
          leading: const Icon(Icons.rocket_launch),
          content: const Text('Project kickoff and initial planning phase.'),
          date: DateTime(2024, 1, 1),
          indicator: TimelineIndicator(
            size: 24,
            color: Colors.teal.shade100,
            child: Icon(
              Icons.rocket_launch,
              size: 12,
              color: Colors.teal.shade700,
            ),
          ),
        ),
        ContentTimelineItem(
          title: 'Phase 1 Complete',
          subtitle: 'February 15, 2024',
          leading: const Icon(Icons.check_circle),
          content: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Successfully completed the first milestone.'),
              SizedBox(height: 8),
              LinearProgressIndicator(value: 1.0),
            ],
          ),
          date: DateTime(2024, 2, 15),
        ),
        ContentTimelineItem(
          title: 'Current Phase',
          subtitle: 'In Progress',
          leading: const Icon(Icons.pending),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Working on phase 2 deliverables.'),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: 0.6,
                backgroundColor: Colors.teal.shade100,
                valueColor: AlwaysStoppedAnimation(Colors.teal.shade400),
              ),
            ],
          ),
          date: DateTime.now(),
        ),
      ],
    );
  }
}

// Additional helper components for timeline content
class TimelineBadge extends StatelessWidget {
  final String text;
  final Color? color;
  final IconData? icon;

  const TimelineBadge({
    super.key,
    required this.text,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color?.withOpacity(0.1) ??
            Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 12,
              color: color ?? Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              color: color ?? Theme.of(context).primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class ContentSection extends StatefulWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget content;
  final ContentSectionStyle? style;
  final VoidCallback? onExpand;
  final bool initiallyExpanded;

  const ContentSection({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    required this.content,
    this.style,
    this.onExpand,
    this.initiallyExpanded = false,
  });

  @override
  State<ContentSection> createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration:
          widget.style?.animationDuration ?? const Duration(milliseconds: 200),
      vsync: this,
    );
    _iconTurns = _controller.drive(
      Tween<double>(begin: 0.0, end: 0.5).chain(
        CurveTween(curve: widget.style?.animationCurve ?? Curves.easeInOut),
      ),
    );
    _heightFactor = _controller.drive(
      CurveTween(curve: widget.style?.animationCurve ?? Curves.easeInOut),
    );
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
      widget.onExpand?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = widget.style ?? const ContentSectionStyle();

    return Container(
      decoration: BoxDecoration(
        color: style.backgroundColor ?? theme.cardColor,
        borderRadius: style.borderRadius,
        boxShadow: style.shadows,
        border: style.border,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: style.collapsible ? _handleTap : null,
            borderRadius: style.borderRadius,
            child: Padding(
              padding: style.padding ?? const EdgeInsets.all(16),
              child: Row(
                children: [
                  if (widget.leading != null) ...[
                    widget.leading!,
                    const SizedBox(width: 16),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style:
                              style.titleStyle ?? theme.textTheme.titleMedium,
                        ),
                        if (widget.subtitle != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            widget.subtitle!,
                            style: style.subtitleStyle ??
                                theme.textTheme.bodySmall,
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (style.collapsible)
                    RotationTransition(
                      turns: _iconTurns,
                      child: Icon(
                        _isExpanded
                            ? style.collapseIcon ?? Icons.expand_less
                            : style.expandIcon ?? Icons.expand_more,
                        color: style.iconColor,
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (style.showDivider && (_isExpanded || !style.collapsible))
            Divider(
              height: 1,
              color: style.dividerColor ?? theme.dividerColor,
            ),
          if (style.collapsible)
            ClipRect(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => SizeTransition(
                  sizeFactor: _heightFactor,
                  child: child,
                ),
                child: Padding(
                  padding: style.contentPadding ?? const EdgeInsets.all(16),
                  child: widget.content,
                ),
              ),
            )
          else
            Padding(
              padding: style.contentPadding ?? const EdgeInsets.all(16),
              child: widget.content,
            ),
        ],
      ),
    );
  }
}

class ContentSectionStyles {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final Color? backgroundColor;
  final Color? headerBackgroundColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? shadows;
  final Border? border;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final bool collapsible;
  final Duration animationDuration;
  final Curve animationCurve;
  final Color? dividerColor;
  final bool showDivider;
  final IconData? expandIcon;
  final IconData? collapseIcon;
  final Color? iconColor;

  const ContentSectionStyles({
    this.padding,
    this.contentPadding,
    this.backgroundColor,
    this.headerBackgroundColor,
    this.borderRadius,
    this.shadows,
    this.border,
    this.titleStyle,
    this.subtitleStyle,
    this.collapsible = false,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.dividerColor,
    this.showDivider = true,
    this.expandIcon,
    this.collapseIcon,
    this.iconColor,
  });

  ContentSectionStyle copyWith({
    EdgeInsets? padding,
    EdgeInsets? contentPadding,
    Color? backgroundColor,
    Color? headerBackgroundColor,
    BorderRadius? borderRadius,
    List<BoxShadow>? shadows,
    Border? border,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    bool? collapsible,
    Duration? animationDuration,
    Curve? animationCurve,
    Color? dividerColor,
    bool? showDivider,
    IconData? expandIcon,
    IconData? collapseIcon,
    Color? iconColor,
  }) {
    return ContentSectionStyle(
      padding: padding ?? this.padding,
      contentPadding: contentPadding ?? this.contentPadding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      headerBackgroundColor:
          headerBackgroundColor ?? this.headerBackgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      shadows: shadows ?? this.shadows,
      border: border ?? this.border,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      collapsible: collapsible ?? this.collapsible,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      dividerColor: dividerColor ?? this.dividerColor,
      showDivider: showDivider ?? this.showDivider,
      expandIcon: expandIcon ?? this.expandIcon,
      collapseIcon: collapseIcon ?? this.collapseIcon,
      iconColor: iconColor ?? this.iconColor,
    );
  }
}
