// Curved Bottom Bar with Highlight
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurvedBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CurvedBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 80,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, FontAwesomeIcons.house, 'Home', theme),
          _buildNavItem(1, FontAwesomeIcons.compass, 'Explore', theme),
          _buildNavItem(2, FontAwesomeIcons.heart, 'Favorites', theme),
          _buildNavItem(3, FontAwesomeIcons.user, 'Profile', theme),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      int index, IconData icon, String label, ThemeData theme) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary.withOpacity(0.1) : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface.withOpacity(0.6),
              size: 22,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurface.withOpacity(0.6),
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Pill-style Bottom Bar
class PillBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const PillBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 80,
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(0, FontAwesomeIcons.house, theme),
            _buildNavItem(1, FontAwesomeIcons.message, theme),
            _buildNavItem(2, FontAwesomeIcons.bell, theme),
            _buildNavItem(3, FontAwesomeIcons.user, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, ThemeData theme) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        width: 60,
        height: double.infinity,
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? theme.colorScheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            color: isSelected
                ? Colors.white
                : theme.colorScheme.onSurface.withOpacity(0.6),
            size: 20,
          ),
        ),
      ),
    );
  }
}

// Animated Icon Bottom Bar
class AnimatedIconBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AnimatedIconBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAnimatedItem(0, FontAwesomeIcons.house, 'Home', theme),
          _buildAnimatedItem(1, FontAwesomeIcons.magnifyingGlass, 'Search', theme),
          _buildAnimatedItem(2, FontAwesomeIcons.bookmark, 'Saved', theme),
          _buildAnimatedItem(3, FontAwesomeIcons.user, 'Profile', theme),
        ],
      ),
    );
  }

  Widget _buildAnimatedItem(
      int index, IconData icon, String label, ThemeData theme) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 16 : 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Colors.white
                  : theme.colorScheme.onSurface.withOpacity(0.6),
              size: 20,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: SizedBox(
                width: isSelected ? 8 : 0,
              ),
            ),
            if (isSelected)
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class NavItemStyle {
  final double? iconSize;
  final TextStyle? labelStyle;
  final double minWidth;
  final double maxWidth;
  final EdgeInsetsGeometry padding;

  const NavItemStyle({
    this.iconSize = 20,
    this.labelStyle,
    this.minWidth = 50,
    this.maxWidth = 90,
    this.padding = EdgeInsets.zero,
  });
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final NavItemStyle? style;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveStyle = style ?? const NavItemStyle();

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        constraints: BoxConstraints(
          minWidth: effectiveStyle.minWidth,
          maxWidth: effectiveStyle.maxWidth,
        ),
        padding: effectiveStyle.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: effectiveStyle.iconSize,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface.withOpacity(0.6),
            ),
            if (isSelected) ...[
              const SizedBox(height: 4),
              Text(
                label,
                style: effectiveStyle.labelStyle?.copyWith(
                      color: theme.colorScheme.primary,
                    ) ??
                    TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Update FloatingBottomBar to include NavItemStyle
class FloatingBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<NavItemData> leftItems;
  final List<NavItemData> rightItems;
  final FloatingActionData floatingAction;
  final Color? backgroundColor;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final NavItemStyle? navStyle;

  const FloatingBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.leftItems,
    required this.rightItems,
    required this.floatingAction,
    this.backgroundColor,
    this.height = 90,
    this.borderRadius = 24,
    this.padding = const EdgeInsets.fromLTRB(24, 0, 24, 24),
    this.navStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;

    return Container(
      height: height,
      padding: padding,
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // The bottom bar
          Container(
            height: 64,
            decoration: BoxDecoration(
              color: backgroundColor ??
                  (isLight ? Colors.white : const Color(0xFF1E1E1E)),
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // Left side items
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: leftItems.map((item) {
                        final index = leftItems.indexOf(item);
                        return Flexible(
                          child: _NavItem(
                            icon: item.icon,
                            label: item.label,
                            isSelected: currentIndex == index,
                            onTap: () => onTap(index),
                            style: navStyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                // Space for center button
                const SizedBox(width: 60),
                // Right side items
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: rightItems.map((item) {
                        final index =
                            leftItems.length + 1 + rightItems.indexOf(item);
                        return Flexible(
                          child: _NavItem(
                            icon: item.icon,
                            label: item.label,
                            isSelected: currentIndex == index,
                            onTap: () => onTap(index),
                            style: navStyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Floating action button
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: () => onTap(leftItems.length),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      floatingAction.color ?? theme.colorScheme.primary,
                      Color.lerp(
                        floatingAction.color ?? theme.colorScheme.primary,
                        Colors.white,
                        0.2,
                      )!,
                    ],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: (floatingAction.color ?? theme.colorScheme.primary)
                          .withOpacity(0.3),
                      blurRadius: 12,
                      spreadRadius: 0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: currentIndex == leftItems.length
                          ? Colors.white.withOpacity(0.5)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    floatingAction.icon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavItemData {
  final IconData icon;
  final String label;

  const NavItemData({
    required this.icon,
    required this.label,
  });
}

class FloatingActionData {
  final IconData icon;
  final Color? color;

  const FloatingActionData({
    required this.icon,
    this.color,
  });
}
