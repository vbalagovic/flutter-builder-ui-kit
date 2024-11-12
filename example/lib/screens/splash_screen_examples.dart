import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_builder_ui_kit/flutter_builder_ui_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashScreenExamplesPage extends StatefulWidget {
  const SplashScreenExamplesPage({super.key});

  @override
  State<SplashScreenExamplesPage> createState() =>
      _SplashScreenExamplesPageState();
}

class _SplashScreenExamplesPageState extends State<SplashScreenExamplesPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    context: context,
                    title: 'Splash Screens',
                    description:
                        'Collection of customizable splash screens with different animations',
                    examples: [
                      _SplashExample(
                        title: 'Pulse splas',
                        description: 'Animated puls splash',
                        example: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              height: 500,
                              child: _buildOriginalSplash(),
                            ),
                          ),
                        ),
                        codeSnippet: '''
PulseSplashScreen(
  title: 'Pulse',
  icon: FontAwesomeIcons.heartPulse,
  backgroundColor: Colors.deepPurple,
  foregroundColor: Colors.white,
  numberOfRings: 4,
);''',
                      ),
                      _SplashExample(
                        title: 'Minimal Splash',
                        description:
                            'Clean and simple splash screen with fade and scale animations',
                        example: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: const SizedBox(
                              height: 500,
                              child: MinimalSplashScreen(
                                title: 'My App',
                                icon: FontAwesomeIcons.rocket,
                                backgroundColor: Colors.indigo,
                              ),
                            ),
                          ),
                        ),
                        codeSnippet: '''
MinimalSplashScreen(
  title: 'My App',
  icon: FontAwesomeIcons.rocket,
  backgroundColor: Colors.indigo,
  onInit: () {
    // Initialize your app
  },
)''',
                      ),
                      _SplashExample(
                        title: 'Particles Splash',
                        description:
                            'Dynamic splash screen with floating particle animations',
                        example: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: const SizedBox(
                              height: 500,
                              child: ParticlesSplashScreen(
                                title: 'Galaxy App',
                                subtitle: 'Explore the Universe',
                                icon: FontAwesomeIcons.star,
                                primaryColor: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                        codeSnippet: '''
ParticlesSplashScreen(
  title: 'Galaxy App',
  subtitle: 'Explore the Universe',
  icon: FontAwesomeIcons.star,
  primaryColor: Colors.purple,
  onInit: () {
    // Initialize your app
  },
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
    required List<_SplashExample> examples,
  }) {
    return Column(
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
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: examples.length,
          separatorBuilder: (context, index) => const SizedBox(height: 24),
          itemBuilder: (context, index) => examples[index],
        ),
        const SizedBox(height: 48),
      ],
    );
  }

  Widget _buildOriginalSplash() {
    return const PulseSplashScreen(
      title: 'Pulse',
      icon: FontAwesomeIcons.heartPulse,
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      numberOfRings: 4,
    );
  }
}

class _SplashExample extends StatelessWidget {
  final String title;
  final String description;
  final Widget example;
  final String codeSnippet;

  const _SplashExample({
    required this.title,
    required this.description,
    required this.example,
    required this.codeSnippet,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Preview
          example,
          // Info
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          ),
          // Code
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
