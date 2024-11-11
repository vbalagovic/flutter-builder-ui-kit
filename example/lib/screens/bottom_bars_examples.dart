import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_builder_ui_kit/flutter_builder_ui_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBarsExampleScreen extends StatelessWidget {
  const BottomBarsExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    context: context,
                    title: 'Floating Bottom Bar',
                    description:
                        'Bottom navigation bar with elevated center action button',
                    examples: [
                      _BottomBarExample(
                        title: 'Basic Usage',
                        example: _DemoContainer(
                          child: _BottomBarDemo(
                            bar: FloatingBottomBar(
                              currentIndex: 0,
                              onTap: (_) {},
                              leftItems: const [
                                NavItemData(
                                  icon: FontAwesomeIcons.house,
                                  label: 'Home',
                                ),
                                NavItemData(
                                  icon: FontAwesomeIcons.trophy,
                                  label: 'Rewards',
                                ),
                              ],
                              rightItems: const [
                                NavItemData(
                                  icon: FontAwesomeIcons.compass,
                                  label: 'Explore',
                                ),
                                NavItemData(
                                  icon: FontAwesomeIcons.user,
                                  label: 'Profile',
                                ),
                              ],
                              floatingAction: const FloatingActionData(
                                icon: FontAwesomeIcons.plus,
                              ),
                            ),
                          ),
                        ),
                        codeSnippet: '''
FloatingBottomBar(
  currentIndex: currentIndex,
  onTap: (index) => setState(() => currentIndex = index),
  leftItems: const [
    NavItemData(
      icon: FontAwesomeIcons.house,
      label: 'Home',
    ),
    NavItemData(
      icon: FontAwesomeIcons.trophy,
      label: 'Rewards',
    ),
  ],
  rightItems: const [
    NavItemData(
      icon: FontAwesomeIcons.compass,
      label: 'Explore',
    ),
    NavItemData(
      icon: FontAwesomeIcons.user,
      label: 'Profile',
    ),
  ],
  floatingAction: FloatingActionData(
    icon: FontAwesomeIcons.plus,
  ),
)''',
                      ),
                      _BottomBarExample(
                        title: 'Music Player Style',
                        example: _DemoContainer(
                          backgroundGradient: LinearGradient(
                            colors: [
                              Colors.blue.shade900,
                              Colors.purple.shade900,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          child: _BottomBarDemo(
                            contentColor: Colors.white.withOpacity(0.15),
                            bar: FloatingBottomBar(
                              currentIndex: 2,
                              onTap: (_) {},
                              backgroundColor: const Color(0xFF1A1A1A),
                              leftItems: const [
                                NavItemData(
                                  icon: FontAwesomeIcons.music,
                                  label: 'Songs',
                                ),
                                NavItemData(
                                  icon: FontAwesomeIcons.heart,
                                  label: 'Favorites',
                                ),
                              ],
                              rightItems: const [
                                NavItemData(
                                  icon: FontAwesomeIcons.radio,
                                  label: 'Radio',
                                ),
                                NavItemData(
                                  icon: FontAwesomeIcons.gear,
                                  label: 'Settings',
                                ),
                              ],
                              floatingAction: const FloatingActionData(
                                icon: FontAwesomeIcons.play,
                                color: Colors.purple,
                              ),
                              navStyle: const NavItemStyle(
                                iconSize: 20,
                                labelStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        codeSnippet: '''
FloatingBottomBar(
  currentIndex: currentIndex,
  onTap: (index) => setState(() => currentIndex = index),
  backgroundColor: const Color(0xFF1A1A1A),
  leftItems: const [
    NavItemData(
      icon: FontAwesomeIcons.music,
      label: 'Songs',
    ),
    NavItemData(
      icon: FontAwesomeIcons.heart,
      label: 'Favorites',
    ),
  ],
  rightItems: const [
    NavItemData(
      icon: FontAwesomeIcons.radio,
      label: 'Radio',
    ),
    NavItemData(
      icon: FontAwesomeIcons.gear,
      label: 'Settings',
    ),
  ],
  floatingAction: FloatingActionData(
    icon: FontAwesomeIcons.play,
    color: Colors.purple,
  ),
  navStyle: const NavItemStyle(
    iconSize: 20,
    labelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  ),
)''',
                      ),
                      _BottomBarExample(
                        title: 'E-commerce Style',
                        example: _DemoContainer(
                          child: _BottomBarDemo(
                            bar: FloatingBottomBar(
                              currentIndex: 0,
                              onTap: (_) {},
                              height: 90,
                              borderRadius: 28,
                              leftItems: const [
                                NavItemData(
                                  icon: FontAwesomeIcons.house,
                                  label: 'Store',
                                ),
                                NavItemData(
                                  icon: FontAwesomeIcons.heart,
                                  label: 'Wishlist',
                                ),
                              ],
                              rightItems: const [
                                NavItemData(
                                  icon: FontAwesomeIcons.bell,
                                  label: 'Alerts',
                                ),
                                NavItemData(
                                  icon: FontAwesomeIcons.user,
                                  label: 'Account',
                                ),
                              ],
                              floatingAction: const FloatingActionData(
                                icon: FontAwesomeIcons.cartShopping,
                                color: Colors.green,
                              ),
                              navStyle: const NavItemStyle(
                                iconSize: 20,
                                minWidth: 65,
                                maxWidth: 90,
                                padding: EdgeInsets.symmetric(horizontal: 6),
                              ),
                            ),
                          ),
                        ),
                        codeSnippet: '''
FloatingBottomBar(
  currentIndex: currentIndex,
  onTap: (index) => setState(() => currentIndex = index),
  height: 90,
  borderRadius: 28,
  leftItems: const [
    NavItemData(
      icon: FontAwesomeIcons.house,
      label: 'Store',
    ),
    NavItemData(
      icon: FontAwesomeIcons.heart,
      label: 'Wishlist',
    ),
  ],
  rightItems: const [
    NavItemData(
      icon: FontAwesomeIcons.bell,
      label: 'Alerts',
    ),
    NavItemData(
      icon: FontAwesomeIcons.user,
      label: 'Account',
    ),
  ],
  floatingAction: FloatingActionData(
    icon: FontAwesomeIcons.cartShopping,
    color: Colors.green,
  ),
  navStyle: const NavItemStyle(
    iconSize: 20,
    minWidth: 65,
    maxWidth: 90,
    padding: EdgeInsets.symmetric(horizontal: 6),
  ),
)''',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required String description,
    required List<_BottomBarExample> examples,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: examples,
          ),
          const SizedBox(height: 48),
          const Divider(),
        ],
      ),
    );
  }
}

class _BottomBarExample extends StatelessWidget {
  final String title;
  final Widget example;
  final String codeSnippet;

  const _BottomBarExample({
    required this.title,
    required this.example,
    required this.codeSnippet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 24),
                example,
              ],
            ),
          ),
          const Divider(height: 1),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Row(
                children: [
                  Icon(
                    Icons.code,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'View Code',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceContainerHighest
                        .withOpacity(0.5),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SelectableText(
                          codeSnippet,
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 13,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.copy, size: 18),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: codeSnippet));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Code copied to clipboard'),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            );
                          },
                          tooltip: 'Copy code',
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoContainer extends StatelessWidget {
  final Widget child;
  final Gradient? backgroundGradient;

  const _DemoContainer({
    required this.child,
    this.backgroundGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        gradient: backgroundGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: child,
      ),
    );
  }
}

class _BottomBarDemo extends StatelessWidget {
  final Widget bar;
  final Color? contentColor;

  const _BottomBarDemo({
    required this.bar,
    this.contentColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveContentColor = contentColor ??
        Theme.of(context).colorScheme.onSurface.withOpacity(0.1);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 90),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.mobile,
                  size: 32,
                  color: effectiveContentColor,
                ),
                const SizedBox(height: 12),
                Text(
                  'Demo Content',
                  style: TextStyle(
                    color: effectiveContentColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: bar,
        ),
      ],
    );
  }
}
