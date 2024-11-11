import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width > 600 ? 300 : 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Flutter logo and title
              const FlutterLogo(size: 100),
              const SizedBox(height: 24),
              Text(
                'Welcome to the Flutter Builder UI Showcase!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Introductory description
              const Text(
                'This UI Kit demonstrates all the components and styles available in Flutter Builder, '
                'a tool that accelerates your Flutter development with pre-configured project templates, widgets, themes, and animations.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),

              // Feature highlights section
              _buildFeatureHighlights(context),

              const SizedBox(height: 24),

              // CTA button with links
              _buildLinksSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to showcase key features
  Widget _buildFeatureHighlights(BuildContext context) {
    return Column(
      children: [
        _buildFeatureTile(
          icon: Icons.widgets_outlined,
          title: 'Ready-Made Widgets',
          description:
              'Includes buttons, cards, inputs, lists, and more to fast-track UI development.',
        ),
        _buildFeatureTile(
          icon: Icons.settings,
          title: 'Pre-configured Integrations',
          description:
              'Comes with Firebase, AdMob, Firebase Auth, Push Notifications, and other essentials.',
        ),
        _buildFeatureTile(
          icon: Icons.palette_outlined,
          title: 'Theming and Customization',
          description:
              'Easily customizable themes to match any brand or app style requirements.',
        ),
      ],
    );
  }

  // Single feature tile
  Widget _buildFeatureTile(
      {required IconData icon,
      required String title,
      required String description}) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(description),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    );
  }

  // Links to documentation and website
  Widget _buildLinksSection() {
    return Column(
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.link),
          label: const Text('Explore Flutter Builder'),
          onPressed: () async {
            const url = 'https://flutter-builder.app/';
            if (await canLaunchUrl(Uri.parse(url))) {
              await canLaunchUrl(Uri.parse(url));
            }
          },
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          icon: const Icon(Icons.book),
          label: const Text('View Documentation'),
          onPressed: () async {
            const url = 'https://flutter-builder-ui-kit.web.app/';
            if (await canLaunchUrl(Uri.parse(url))) {
              await canLaunchUrl(Uri.parse(url));
            }
          },
        ),
      ],
    );
  }
}
