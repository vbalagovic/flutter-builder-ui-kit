import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_builder_ui/flutter_builder_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardWidgetsScreen extends StatefulWidget {
  const DashboardWidgetsScreen({super.key});

  @override
  State<DashboardWidgetsScreen> createState() => _DashboardWidgetsScreenState();
}

class _DashboardWidgetsScreenState extends State<DashboardWidgetsScreen> {
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
                    title: 'Profile Headers',
                    description: 'App bar with profile information and actions',
                    examples: [
                      _WidgetExample(
                        title: 'Basic Header',
                        example: SizedBox(
                          height: 100,
                          child: Material(
                            child: ProfileHeader(
                              initials: 'JD',
                              name: 'John Doe',
                              subtitle: 'Welcome back',
                              onNotificationTap: () {},
                            ),
                          ),
                        ),
                        codeSnippet: '''
ProfileHeader(
  initials: 'JD',
  name: 'John Doe',
  subtitle: 'Welcome back',
  onNotificationTap: () {},
)''',
                      ),
                      _WidgetExample(
                        title: 'Custom Actions',
                        example: SizedBox(
                          height: 100,
                          child: Material(
                            child: ProfileHeader(
                              initials: 'JD',
                              name: 'John Doe',
                              subtitle: 'Welcome back',
                              actions: [
                                IconButton(
                                  icon: const Icon(FontAwesomeIcons.gear),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(FontAwesomeIcons.bell),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        codeSnippet: '''
ProfileHeader(
  initials: 'JD',
  name: 'John Doe',
  subtitle: 'Welcome back',
  actions: [
    IconButton(
      icon: const Icon(FontAwesomeIcons.gear),
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(FontAwesomeIcons.bell),
      onPressed: () {},
    ),
  ],
)''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Progress Cards',
                    description:
                        'Display level progress and rewards information',
                    examples: [
                      const _WidgetExample(
                        title: 'Basic Progress',
                        example: ProgressCard(
                          progress: 0.7,
                          level: 'Level 7',
                          points: '720/1000',
                          nextReward: 'Premium Unlock',
                        ),
                        codeSnippet: '''
ProgressCard(
  progress: 0.7,
  level: 'Level 7',
  points: '720/1000',
  nextReward: 'Premium Unlock',
)''',
                      ),
                      const _WidgetExample(
                        title: 'Custom Progress',
                        example: ProgressCard(
                          progress: 0.3,
                          level: 'Rookie',
                          points: '300 XP',
                          nextReward: 'Silver Badge',
                        ),
                        codeSnippet: '''
ProgressCard(
  progress: 0.3,
  level: 'Rookie',
  points: '300 XP',
  nextReward: 'Silver Badge',
)''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Goal Cards',
                    description: 'Track progress towards specific goals',
                    examples: [
                      const _WidgetExample(
                        title: 'Single Goal',
                        example: GoalCard(
                          icon: FontAwesomeIcons.personWalking,
                          title: 'Steps',
                          current: '7,234',
                          goal: '10,000',
                          progress: 0.72,
                        ),
                        codeSnippet: '''
GoalCard(
  icon: FontAwesomeIcons.personWalking,
  title: 'Steps',
  current: '7,234',
  goal: '10,000',
  progress: 0.72,
)''',
                      ),
                      const _WidgetExample(
                        title: 'Goals List',
                        example: GoalsList(
                          goals: [
                            GoalCard(
                              icon: FontAwesomeIcons.personWalking,
                              title: 'Steps',
                              current: '7,234',
                              goal: '10,000',
                              progress: 0.72,
                            ),
                            GoalCard(
                              icon: FontAwesomeIcons.fire,
                              title: 'Calories',
                              current: '1,450',
                              goal: '2,000',
                              progress: 0.73,
                            ),
                            GoalCard(
                              icon: FontAwesomeIcons.heartPulse,
                              title: 'Activity',
                              current: '35',
                              goal: '45',
                              progress: 0.78,
                              unit: 'min',
                            ),
                          ],
                        ),
                        codeSnippet: '''
GoalsList(
  goals: [
    GoalCard(
      icon: FontAwesomeIcons.personWalking,
      title: 'Steps',
      current: '7,234',
      goal: '10,000',
      progress: 0.72,
    ),
    GoalCard(
      icon: FontAwesomeIcons.fire,
      title: 'Calories',
      current: '1,450',
      goal: '2,000',
      progress: 0.73,
    ),
    GoalCard(
      icon: FontAwesomeIcons.heartPulse,
      title: 'Activity',
      current: '35',
      goal: '45',
      progress: 0.78,
      unit: 'min',
    ),
  ],
)''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Achievement Items',
                    description: 'Display user achievements with points',
                    examples: [
                      const _WidgetExample(
                        title: 'Basic Achievement',
                        example: AchievementItem(
                          icon: FontAwesomeIcons.medal,
                          color: Colors.amber,
                          title: 'Early Bird',
                          description: 'Complete 5 tasks before 9 AM',
                          points: '+50',
                        ),
                        codeSnippet: '''
AchievementItem(
  icon: FontAwesomeIcons.medal,
  color: Colors.amber,
  title: 'Early Bird',
  description: 'Complete 5 tasks before 9 AM',
  points: '+50',
)''',
                      ),
                      const _WidgetExample(
                        title: 'Multiple Achievements',
                        example: Column(
                          children: [
                            AchievementItem(
                              icon: FontAwesomeIcons.medal,
                              color: Colors.amber,
                              title: 'Early Bird',
                              description: 'Complete 5 tasks before 9 AM',
                              points: '+50',
                            ),
                            SizedBox(height: 12),
                            AchievementItem(
                              icon: FontAwesomeIcons.trophy,
                              color: Colors.purple,
                              title: 'Streak Master',
                              description: '7-day activity streak',
                              points: '+100',
                            ),
                          ],
                        ),
                        codeSnippet: '''
Column(
  children: [
    AchievementItem(
      icon: FontAwesomeIcons.medal,
      color: Colors.amber,
      title: 'Early Bird',
      description: 'Complete 5 tasks before 9 AM',
      points: '+50',
    ),
    const SizedBox(height: 12),
    AchievementItem(
      icon: FontAwesomeIcons.trophy,
      color: Colors.purple,
      title: 'Streak Master',
      description: '7-day activity streak',
      points: '+100',
    ),
  ],
)''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Reward Cards',
                    description: 'Display available rewards with redeem action',
                    examples: [
                      _WidgetExample(
                        title: 'Single Reward',
                        example: RewardCard(
                          icon: FontAwesomeIcons.crown,
                          title: 'Premium Access',
                          description: 'Unlock all premium features',
                          points: '1000',
                          backgroundColor: Colors.amber,
                          onRedeem: () {},
                        ),
                        codeSnippet: '''
RewardCard(
  icon: FontAwesomeIcons.crown,
  title: 'Premium Access',
  description: 'Unlock all premium features',
  points: '1000',
  backgroundColor: Colors.amber,
  onRedeem: () {},
)''',
                      ),
                      _WidgetExample(
                        title: 'Rewards List',
                        example: RewardsList(
                          rewards: [
                            RewardCard(
                              icon: FontAwesomeIcons.crown,
                              title: 'Premium Access',
                              description: 'Unlock all premium features',
                              points: '1000',
                              backgroundColor: Colors.amber,
                              onRedeem: () {},
                            ),
                            RewardCard(
                              icon: FontAwesomeIcons.palette,
                              title: 'Custom Themes',
                              description: 'Personalize your experience',
                              points: '500',
                              backgroundColor: Colors.purple,
                              onRedeem: () {},
                            ),
                          ],
                        ),
                        codeSnippet: '''
RewardsList(
  rewards: [
    RewardCard(
      icon: FontAwesomeIcons.crown,
      title: 'Premium Access',
      description: 'Unlock all premium features',
      points: '1000',
      backgroundColor: Colors.amber,
      onRedeem: () {},
    ),
    RewardCard(
      icon: FontAwesomeIcons.palette,
      title: 'Custom Themes',
      description: 'Personalize your experience',
      points: '500',
      backgroundColor: Colors.purple,
      onRedeem: () {},
    ),
  ],
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
    required List<_WidgetExample> examples,
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

class _WidgetExample extends StatelessWidget {
  final String title;
  final Widget example;
  final String codeSnippet;

  const _WidgetExample({
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
                                width: 200,
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
