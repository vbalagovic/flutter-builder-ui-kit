// lib/src/cards/status_card.dart

import 'package:flutter/material.dart';

enum StatusType {
  success,
  error,
  warning,
  info,
  custom
}

class StatusCardStyle {
  final Map<StatusType, Color> statusColors;
  final Map<StatusType, IconData> statusIcons;
  final double borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final double? width;
  final double? height;
  final List<BoxShadow>? shadows;
  final Border? border;
  final double iconSize;
  final EdgeInsets? iconPadding;
  final bool showIcon;
  final bool showBorder;
  final double borderWidth;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool useAnimation;
  final Color? backgroundColor;
  final double elevation;
  final bool showCloseButton;
  final BorderRadius? progressBorderRadius;

  const StatusCardStyle({
    Map<StatusType, Color>? statusColors,
    Map<StatusType, IconData>? statusIcons,
    this.borderRadius = 12.0,
    this.padding,
    this.contentPadding,
    this.titleStyle,
    this.messageStyle,
    this.width,
    this.height,
    this.shadows,
    this.border,
    this.iconSize = 24.0,
    this.iconPadding,
    this.showIcon = true,
    this.showBorder = true,
    this.borderWidth = 1.0,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.useAnimation = true,
    this.backgroundColor,
    this.elevation = 0,
    this.showCloseButton = true,
    this.progressBorderRadius,
  }) : statusColors = statusColors ??
            const {
              StatusType.success: Colors.green,
              StatusType.error: Colors.red,
              StatusType.warning: Colors.orange,
              StatusType.info: Colors.blue,
            },
        statusIcons = statusIcons ??
            const {
              StatusType.success: Icons.check_circle,
              StatusType.error: Icons.error,
              StatusType.warning: Icons.warning,
              StatusType.info: Icons.info,
            };

  StatusCardStyle copyWith({
    Map<StatusType, Color>? statusColors,
    Map<StatusType, IconData>? statusIcons,
    double? borderRadius,
    EdgeInsets? padding,
    EdgeInsets? contentPadding,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    double? width,
    double? height,
    List<BoxShadow>? shadows,
    Border? border,
    double? iconSize,
    EdgeInsets? iconPadding,
    bool? showIcon,
    bool? showBorder,
    double? borderWidth,
    Duration? animationDuration,
    Curve? animationCurve,
    bool? useAnimation,
    Color? backgroundColor,
    double? elevation,
    bool? showCloseButton,
    BorderRadius? progressBorderRadius,
  }) {
    return StatusCardStyle(
      statusColors: statusColors ?? this.statusColors,
      statusIcons: statusIcons ?? this.statusIcons,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      contentPadding: contentPadding ?? this.contentPadding,
      titleStyle: titleStyle ?? this.titleStyle,
      messageStyle: messageStyle ?? this.messageStyle,
      width: width ?? this.width,
      height: height ?? this.height,
      shadows: shadows ?? this.shadows,
      border: border ?? this.border,
      iconSize: iconSize ?? this.iconSize,
      iconPadding: iconPadding ?? this.iconPadding,
      showIcon: showIcon ?? this.showIcon,
      showBorder: showBorder ?? this.showBorder,
      borderWidth: borderWidth ?? this.borderWidth,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      useAnimation: useAnimation ?? this.useAnimation,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      showCloseButton: showCloseButton ?? this.showCloseButton,
      progressBorderRadius: progressBorderRadius ?? this.progressBorderRadius,
    );
  }
}

class StatusCard extends StatefulWidget {
  final String? title;
  final String message;
  final StatusType type;
  final StatusCardStyle? style;
  final VoidCallback? onClose;
  final Widget? action;
  final Duration? autoHideDuration;
  final Color? customColor;
  final IconData? customIcon;
  final double? progress;
  final Color? backgroundColor;

  const StatusCard({
    super.key,
    this.title,
    required this.message,
    this.type = StatusType.info,
    this.style,
    this.onClose,
    this.action,
    this.autoHideDuration,
    this.customColor,
    this.customIcon,
    this.progress,
    this.backgroundColor,
  });

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.style?.animationDuration ?? const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.style?.animationCurve ?? Curves.easeInOut,
    );

    if (widget.autoHideDuration != null) {
      Future.delayed(widget.autoHideDuration!, () {
        if (mounted) {
          _hide();
        }
      });
    }

    _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _hide() {
    setState(() => isVisible = false);
    _controller.reverse().then((_) {
      if (widget.onClose != null) {
        widget.onClose!();
      }
    });
  }

  StatusCardStyle get _effectiveStyle {
    final theme = Theme.of(context);

    return widget.style ?? StatusCardStyle(
      backgroundColor: widget.backgroundColor ?? theme.cardColor,
      titleStyle: theme.textTheme.titleMedium,
      messageStyle: theme.textTheme.bodyMedium,
      shadows: [
        BoxShadow(
          color: theme.shadowColor.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  Color get _statusColor {
    if (widget.type == StatusType.custom && widget.customColor != null) {
      return widget.customColor!;
    }
    return _effectiveStyle.statusColors[widget.type]!;
  }

  IconData get _statusIcon {
    if (widget.type == StatusType.custom && widget.customIcon != null) {
      return widget.customIcon!;
    }
    return _effectiveStyle.statusIcons[widget.type]!;
  }

  @override
  Widget build(BuildContext context) {
    final style = _effectiveStyle;

    Widget buildContent() {
      return Container(
        width: style.width,
        height: style.height,
        padding: style.padding ?? const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (style.showIcon) ...[
                  Padding(
                    padding: style.iconPadding ?? const EdgeInsets.only(right: 12),
                    child: Icon(
                      _statusIcon,
                      color: _statusColor,
                      size: style.iconSize,
                    ),
                  ),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.title != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            widget.title!,
                            style: style.titleStyle?.copyWith(
                              color: _statusColor,
                            ) ?? TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _statusColor,
                            ),
                          ),
                        ),
                      Text(
                        widget.message,
                        style: style.messageStyle,
                      ),
                    ],
                  ),
                ),
                if (widget.action != null) ...[
                  const SizedBox(width: 16),
                  widget.action!,
                ],
                if (style.showCloseButton && widget.onClose != null) ...[
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.close, size: 20),
                    onPressed: _hide,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  ),
                ],
              ],
            ),
            if (widget.progress != null) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: style.progressBorderRadius ?? BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: widget.progress,
                  backgroundColor: _statusColor.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(_statusColor),
                ),
              ),
            ],
          ],
        ),
      );
    }

    Widget card = Material(
      color: style.backgroundColor,
      elevation: style.elevation,
      borderRadius: BorderRadius.circular(style.borderRadius),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          border: style.showBorder
              ? Border.all(
                  color: _statusColor.withOpacity(0.3),
                  width: style.borderWidth,
                )
              : null,
          boxShadow: style.shadows,
        ),
        child: buildContent(),
      ),
    );

    if (style.useAnimation) {
      return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Opacity(
            opacity: _animation.value,
            child: Transform.scale(
              scale: 0.95 + (_animation.value * 0.05),
              child: child,
            ),
          );
        },
        child: card,
      );
    }

    return card;
  }
}

// Extension for easier creation of common status cards
extension StatusCardExtensions on BuildContext {
  void showSuccessCard({
    String? title,
    required String message,
    VoidCallback? onClose,
    Widget? action,
    Duration? autoHideDuration,
    StatusCardStyle? style,
  }) {
    _showStatusCard(
      type: StatusType.success,
      title: title,
      message: message,
      onClose: onClose,
      action: action,
      autoHideDuration: autoHideDuration,
      style: style,
    );
  }

  void showErrorCard({
    String? title,
    required String message,
    VoidCallback? onClose,
    Widget? action,
    Duration? autoHideDuration,
    StatusCardStyle? style,
  }) {
    _showStatusCard(
      type: StatusType.error,
      title: title,
      message: message,
      onClose: onClose,
      action: action,
      autoHideDuration: autoHideDuration,
      style: style,
    );
  }

  void showWarningCard({
    String? title,
    required String message,
    VoidCallback? onClose,
    Widget? action,
    Duration? autoHideDuration,
    StatusCardStyle? style,
  }) {
    _showStatusCard(
      type: StatusType.warning,
      title: title,
      message: message,
      onClose: onClose,
      action: action,
      autoHideDuration: autoHideDuration,
      style: style,
    );
  }

  void showInfoCard({
    String? title,
    required String message,
    VoidCallback? onClose,
    Widget? action,
    Duration? autoHideDuration,
    StatusCardStyle? style,
  }) {
    _showStatusCard(
      type: StatusType.info,
      title: title,
      message: message,
      onClose: onClose,
      action: action,
      autoHideDuration: autoHideDuration,
      style: style,
    );
  }

  void _showStatusCard({
    required StatusType type,
    String? title,
    required String message,
    VoidCallback? onClose,
    Widget? action,
    Duration? autoHideDuration,
    StatusCardStyle? style,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: StatusCard(
          type: type,
          title: title,
          message: message,
          onClose: onClose,
          action: action,
          autoHideDuration: autoHideDuration,
          style: style,
        ),
        backgroundColor: Colors.transparent,
        elevation: 1,
        behavior: SnackBarBehavior.floating,
        duration: autoHideDuration ?? const Duration(seconds: 4),
      ),
    );
  }
}