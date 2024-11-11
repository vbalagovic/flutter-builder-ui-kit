import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_builder_ui/flutter_builder_ui.dart';

class ListsExamplesScreen extends StatelessWidget {
  const ListsExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    context: context,
                    title: 'Animated List Tile',
                    description:
                        'Interactive list tiles with smooth press animations',
                    examples: [
                      _ListExample(
                        title: 'Basic Tiles',
                        example: Column(
                          children: [
                            AnimatedListTile(
                              leading: Icons.inbox,
                              title: 'Inbox',
                              subtitle: '3 new messages',
                              onTap: () {},
                            ),
                            AnimatedListTile(
                              leading: Icons.star,
                              title: 'Starred',
                              subtitle: '12 items',
                              onTap: () {},
                              color: Colors.amber,
                            ),
                            AnimatedListTile(
                              leading: Icons.send,
                              title: 'Sent',
                              subtitle: 'Last sent 2h ago',
                              onTap: () {},
                              color: Colors.green,
                            ),
                          ],
                        ),
                        codeSnippet: '''
AnimatedListTile(
  leading: Icons.inbox,
  title: 'Inbox',
  subtitle: '3 new messages',
  onTap: () {},
),
AnimatedListTile(
  leading: Icons.star,
  title: 'Starred',
  subtitle: '12 items',
  onTap: () {},
  color: Colors.amber,
),
AnimatedListTile(
  leading: Icons.send,
  title: 'Sent',
  subtitle: 'Last sent 2h ago',
  onTap: () {},
  color: Colors.green,
),''',
                      ),
                      _ListExample(
                        title: 'With Badges',
                        example: Column(
                          children: [
                            AnimatedListTile(
                              leading: Icons.notifications,
                              title: 'Notifications',
                              subtitle: 'Manage your alerts',
                              trailing: const ListItemBadge(
                                text: 'NEW',
                                color: Colors.red,
                              ),
                              onTap: () {},
                            ),
                            AnimatedListTile(
                              leading: Icons.verified_user,
                              title: 'Premium Account',
                              subtitle: 'Your subscription is active',
                              trailing: const ListItemBadge(
                                text: 'PRO',
                                color: Colors.purple,
                                outlined: true,
                              ),
                              onTap: () {},
                              color: Colors.purple,
                            ),
                          ],
                        ),
                        codeSnippet: '''
AnimatedListTile(
  leading: Icons.notifications,
  title: 'Notifications',
  subtitle: 'Manage your alerts',
  trailing: const ListItemBadge(
    text: 'NEW',
    color: Colors.red,
  ),
  onTap: () {},
),
AnimatedListTile(
  leading: Icons.verified_user,
  title: 'Premium Account',
  subtitle: 'Your subscription is active',
  trailing: const ListItemBadge(
    text: 'PRO',
    color: Colors.purple,
    outlined: true,
  ),
  onTap: () {},
  color: Colors.purple,
),''',
                      ),
                      _ListExample(
                        title: 'Custom Trailing',
                        example: Column(
                          children: [
                            AnimatedListTile(
                              leading: Icons.wb_sunny,
                              title: 'Dark Mode',
                              subtitle: 'Toggle app theme',
                              trailing: Switch(
                                value: false,
                                onChanged: (_) {},
                              ),
                              onTap: () {},
                            ),
                            AnimatedListTile(
                              leading: Icons.volume_up,
                              title: 'Volume',
                              subtitle: 'Adjust system volume',
                              trailing: SizedBox(
                                width: 100,
                                child: Slider(
                                  value: 0.7,
                                  onChanged: (_) {},
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                        codeSnippet: '''
AnimatedListTile(
  leading: Icons.wb_sunny,
  title: 'Dark Mode',
  subtitle: 'Toggle app theme',
  trailing: Switch(
    value: false,
    onChanged: (_) {},
  ),
  onTap: () {},
),
AnimatedListTile(
  leading: Icons.volume_up,
  title: 'Volume',
  subtitle: 'Adjust system volume',
  trailing: SizedBox(
    width: 100,
    child: Slider(
      value: 0.7,
      onChanged: (_) {},
    ),
  ),
  onTap: () {},
),''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Swipeable List Tile',
                    description: 'List tiles with swipe actions',
                    examples: [
                      _ListExample(
                        title: 'Swipe Actions',
                        example: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Column(
                            children: [
                              SwipeActionListTile(
                                borderRadius: BorderRadius.circular(12),
                                actionWidth: 68,
                                actions: [
                                  SwipeAction(
                                    icon: Icons.delete,
                                    backgroundColor: Colors.red.shade400,
                                    onTap: () {},
                                  ),
                                  SwipeAction(
                                    icon: Icons.archive,
                                    backgroundColor: Colors.blue.shade400,
                                    onTap: () {},
                                  ),
                                ],
                                child: AnimatedListTile(
                                  leading: Icons.mail_outline,
                                  title: 'Important Email',
                                  subtitle: 'Swipe left for actions',
                                  onTap: () {},
                                ),
                              ),
                              const SizedBox(height: 16),
                              SwipeActionListTile(
                                borderRadius: BorderRadius.circular(12),
                                actionWidth: 68,
                                actions: [
                                  SwipeAction(
                                    icon: Icons.check,
                                    backgroundColor: Colors.green.shade400,
                                    onTap: () {},
                                  ),
                                  SwipeAction(
                                    icon: Icons.close,
                                    backgroundColor: Colors.red.shade400,
                                    onTap: () {},
                                  ),
                                ],
                                child: AnimatedListTile(
                                  leading: Icons.notifications_none,
                                  title: 'New Request',
                                  subtitle: 'Approve or reject',
                                  trailing: const ListItemBadge(
                                    text: 'NEW',
                                    color: Colors.green,
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        codeSnippet: '''
SwipeActionListTile(
  borderRadius: BorderRadius.circular(12),
  actionWidth: 68,
  actions: [
    SwipeAction(
      icon: Icons.delete,
      backgroundColor: Colors.red.shade400,
      onTap: () {},
    ),
    SwipeAction(
      icon: Icons.archive,
      backgroundColor: Colors.blue.shade400,
      onTap: () {},
    ),
  ],
  child: AnimatedListTile(
    leading: Icons.mail_outline,
    title: 'Important Email',
    subtitle: 'Swipe left for actions',
    onTap: () {},
  ),
),''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Grouped List Section',
                    description: 'Organized list sections with headers',
                    examples: [
                      _ListExample(
                        title: 'Settings Menu',
                        example: Column(
                          children: [
                            GroupedListSection(
                              title: 'Account',
                              children: [
                                AnimatedListTile(
                                  leading: Icons.person,
                                  title: 'Profile',
                                  subtitle: 'Manage your information',
                                  onTap: () {},
                                ),
                                AnimatedListTile(
                                  leading: Icons.security,
                                  title: 'Security',
                                  subtitle: 'Password and authentication',
                                  onTap: () {},
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            GroupedListSection(
                              title: 'Preferences',
                              children: [
                                AnimatedListTile(
                                  leading: Icons.notifications,
                                  title: 'Notifications',
                                  trailing: Switch(
                                    value: true,
                                    onChanged: (_) {},
                                  ),
                                  onTap: () {},
                                ),
                                AnimatedListTile(
                                  leading: Icons.language,
                                  title: 'Language',
                                  subtitle: 'English (US)',
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                        codeSnippet: '''
GroupedListSection(
  title: 'Account',
  children: [
    AnimatedListTile(
      leading: Icons.person,
      title: 'Profile',
      subtitle: 'Manage your information',
      onTap: () {},
    ),
    AnimatedListTile(
      leading: Icons.security,
      title: 'Security',
      subtitle: 'Password and authentication',
      onTap: () {},
    ),
  ],
),
GroupedListSection(
  title: 'Preferences',
  children: [
    AnimatedListTile(
      leading: Icons.notifications,
      title: 'Notifications',
      trailing: Switch(
        value: true,
        onChanged: (_) {},
      ),
      onTap: () {},
    ),
    AnimatedListTile(
      leading: Icons.language,
      title: 'Language',
      subtitle: 'English (US)',
      onTap: () {},
    ),
  ],
),''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Expandable List Tile',
                    description:
                        'Collapsible list sections with smooth animations',
                    examples: [
                      _ListExample(
                        title: 'FAQ Section',
                        example: Column(
                          children: [
                            ExpandableListTile(
                              title: 'What is Flutter?',
                              subtitle: 'Learn about the framework',
                              leading: Icons.info,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    'Flutter is Google\'s UI toolkit for building beautiful, natively compiled applications for mobile, web, desktop, and embedded devices from a single codebase.',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            ExpandableListTile(
                              title: 'Getting Started',
                              subtitle: 'Setup instructions',
                              leading: Icons.play_circle,
                              initiallyExpanded: true,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      AnimatedListTile(
                                        leading: Icons.download,
                                        title: 'Install Flutter SDK',
                                        onTap: () {},
                                      ),
                                      AnimatedListTile(
                                        leading: Icons.code,
                                        title: 'Setup Editor',
                                        onTap: () {},
                                      ),
                                      AnimatedListTile(
                                        leading: Icons.phone_android,
                                        title: 'Create First App',
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        codeSnippet: '''
ExpandableListTile(
  title: 'What is Flutter?',
  subtitle: 'Learn about the framework',
  leading: Icons.info,
  children: [
    Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Flutter is Google's UI toolkit...',
      ),
    ),
  ],
),
ExpandableListTile(
  title: 'Getting Started',
  subtitle: 'Setup instructions',
  leading: Icons.play_circle,
  initiallyExpanded: true,
  children: [
    AnimatedListTile(
      leading: Icons.download,
      title: 'Install Flutter SDK',
      onTap: () {},
    ),
    // More list items...
  ],
),''',
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
    required List<_ListExample> examples,
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

  // Add the Reorderable List section
  Widget _buildReorderableSection(BuildContext context) {
    return _buildSection(
      context: context,
      title: 'Reorderable List',
      description: 'Draggable list items with reorder capability',
      examples: [
        _ListExample(
          title: 'Task List',
          example: Column(
            children: [
              ReorderableListItem(
                isFirst: true,
                onReorder: () {},
                child: AnimatedListTile(
                  leading: Icons.check_circle_outline,
                  title: 'Update Documentation',
                  subtitle: 'High Priority',
                  trailing: const ListItemBadge(
                    text: '1',
                    color: Colors.blue,
                  ),
                  onTap: () {},
                ),
              ),
              ReorderableListItem(
                onReorder: () {},
                child: AnimatedListTile(
                  leading: Icons.check_circle_outline,
                  title: 'Fix Bug #123',
                  subtitle: 'Medium Priority',
                  trailing: const ListItemBadge(
                    text: '2',
                    color: Colors.blue,
                  ),
                  onTap: () {},
                ),
              ),
              ReorderableListItem(
                isLast: true,
                onReorder: () {},
                child: AnimatedListTile(
                  leading: Icons.check_circle_outline,
                  title: 'Review Pull Requests',
                  subtitle: 'Low Priority',
                  trailing: const ListItemBadge(
                    text: '3',
                    color: Colors.blue,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
          codeSnippet: '''
ReorderableListItem(
  isFirst: true,
  onReorder: () {},
  child: AnimatedListTile(
    leading: Icons.check_circle_outline,
    title: 'Update Documentation',
    subtitle: 'High Priority',
    trailing: const ListItemBadge(
      text: '1',
      color: Colors.blue,
    ),
    onTap: () {},
  ),
),
// More reorderable items...''',
        ),
        _ListExample(
          title: 'Playlist',
          example: Column(
            children: [
              ReorderableListItem(
                isFirst: true,
                onReorder: () {},
                child: AnimatedListTile(
                  leading: Icons.music_note,
                  title: 'Bohemian Rhapsody',
                  subtitle: 'Queen',
                  trailing: const Text('6:07'),
                  onTap: () {},
                ),
              ),
              ReorderableListItem(
                onReorder: () {},
                child: AnimatedListTile(
                  leading: Icons.music_note,
                  title: 'Stairway to Heaven',
                  subtitle: 'Led Zeppelin',
                  trailing: const Text('8:02'),
                  onTap: () {},
                ),
              ),
              ReorderableListItem(
                isLast: true,
                onReorder: () {},
                child: AnimatedListTile(
                  leading: Icons.music_note,
                  title: 'Hotel California',
                  subtitle: 'Eagles',
                  trailing: const Text('6:30'),
                  onTap: () {},
                ),
              ),
            ],
          ),
          codeSnippet: '''
ReorderableListItem(
  isFirst: true,
  onReorder: () {},
  child: AnimatedListTile(
    leading: Icons.music_note,
    title: 'Bohemian Rhapsody',
    subtitle: 'Queen',
    trailing: const Text('6:07'),
    onTap: () {},
  ),
),
// More playlist items...''',
        ),
      ],
    );
  }
}

class _ListExample extends StatelessWidget {
  final String title;
  final Widget example;
  final String codeSnippet;

  const _ListExample({
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
