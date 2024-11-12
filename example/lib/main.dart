// main.dart

import 'package:example/screens/auth_screens_example.dart';
import 'package:example/screens/bottom_bars_examples.dart';
import 'package:example/screens/button_examples_screen.dart';
import 'package:example/screens/cards_screen.dart';
import 'package:example/screens/content_screen.dart';
import 'package:example/screens/dashboard_widgets_screen.dart';
import 'package:example/screens/inputs_screen.dart';
import 'package:example/screens/intro_screen.dart';
import 'package:example/screens/list_tiles_screen.dart';
import 'package:example/screens/overlay_examples_screen.dart';
import 'package:example/screens/splash_screen_examples.dart';
import 'package:example/theme/theme_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const UIShowcaseApp());
}

class UIShowcaseApp extends StatelessWidget {
  const UIShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      child: Builder(
        builder: (context) {
          final themeProvider = ThemeProvider.of(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Builder UI',
            theme: _buildLightTheme(),
            darkTheme: _buildDarkTheme(),
            themeMode: themeProvider.themeMode,
            home: const ShowcaseHome(),
          );
        },
      ),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      ),
      useMaterial3: true,
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );
  }
}

class ShowcaseHome extends StatefulWidget {
  const ShowcaseHome({super.key});

  @override
  State<ShowcaseHome> createState() => _ShowcaseHomeState();
}

class _ShowcaseHomeState extends State<ShowcaseHome> {
  int _selectedIndex = 0;

  final List<NavigationItem> _items = [
    NavigationItem(
        title: 'Intro', icon: Icons.home, screen: const IntroScreen()),
    NavigationItem(
        title: 'Buttons',
        icon: Icons.smart_button,
        screen: const ButtonExamplesScreen()),
    NavigationItem(
        title: 'Inputs',
        icon: Icons.text_fields,
        screen: const InputExamplesScreen()),
    NavigationItem(
        title: 'Cards', icon: Icons.style, screen: const CardsExamplesScreen()),
    NavigationItem(
        title: 'Lists',
        icon: Icons.list_alt,
        screen: const ListsExamplesScreen()),
    NavigationItem(
        title: 'Content',
        icon: Icons.content_copy,
        screen: const ContentCardsExampleScreen()),
    NavigationItem(
        title: 'Overlays',
        icon: Icons.layers,
        screen: const OverlayExamplesScreen()),
    NavigationItem(
        title: 'Bottom Bars',
        icon: Icons.bar_chart,
        screen: const BottomBarsExampleScreen()),
    NavigationItem(
        title: 'Dashboard Widgets',
        icon: Icons.dashboard_customize,
        screen: const DashboardWidgetsScreen()),
    NavigationItem(
        title: 'Splash Screens',
        icon: Icons.swap_vertical_circle_sharp,
        screen: const SplashScreenExamplesPage()),
    NavigationItem(
        title: 'Auth Screens',
        icon: Icons.verified_user,
        screen: const AuthScreensExampleScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const breakpoint = 1200.0;
    final isWideScreen = screenWidth >= breakpoint;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Row(
        children: [
          if (isWideScreen)
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                border: Border(
                  right: BorderSide(color: colorScheme.outlineVariant),
                ),
              ),
              child: _buildNavigationList(),
            )
          else
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              destinations: _items.map((item) {
                return NavigationRailDestination(
                  icon: Icon(item.icon),
                  label: Text(item.title),
                );
              }).toList(),
            ),
          Expanded(
            child: Column(
              children: [
                _buildAppBar(isWideScreen, colorScheme),
                Expanded(child: _items[_selectedIndex].screen),
              ],
            ),
          ),
        ],
      ),
      drawer: !isWideScreen ? Drawer(child: _buildNavigationList()) : null,
    );
  }

  Widget _buildAppBar(bool isWideScreen, ColorScheme colorScheme) {
    final themeProvider = ThemeProvider.of(context);

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(bottom: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: Row(
        children: [
          if (!isWideScreen)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          const SizedBox(width: 16),
          Text(
            _items[_selectedIndex].title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          IconButton(
            icon: Icon(_getThemeIcon(themeProvider.themeMode)),
            tooltip: _getThemeTooltip(themeProvider.themeMode),
            onPressed: themeProvider.toggleTheme,
          ),
        ],
      ),
    );
  }

  IconData _getThemeIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
      default:
        return Icons.brightness_auto;
    }
  }

  String _getThemeTooltip(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Switch to dark mode';
      case ThemeMode.dark:
        return 'Switch to light mode';
      default:
        return 'Switch theme';
    }
  }

  Widget _buildNavigationList() {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return ListTile(
          leading: Icon(item.icon),
          title: Text(item.title),
          selected: index == _selectedIndex,
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
            if (MediaQuery.of(context).size.width < 1200) {
              Navigator.pop(context);
            }
          },
        );
      },
    );
  }
}

class NavigationItem {
  final String title;
  final IconData icon;
  final Widget screen;

  NavigationItem({
    required this.title,
    required this.icon,
    required this.screen,
  });
}
