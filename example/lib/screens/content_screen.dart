import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_builder_ui/flutter_builder_ui.dart';

class ContentWidgetsExampleScreen extends StatefulWidget {
  const ContentWidgetsExampleScreen({super.key});

  @override
  State<ContentWidgetsExampleScreen> createState() =>
      _ContentWidgetsExampleScreenState();
}

class _ContentWidgetsExampleScreenState
    extends State<ContentWidgetsExampleScreen> {
  final _scrollController = ScrollController();

  final _sectionKeys = <String, GlobalKey>{
    'Content Cards': GlobalKey(),
    'Content Sections': GlobalKey(),
    'Content Grid': GlobalKey(),
    'Content Timeline': GlobalKey(),
  };

  void scrollToSection(String section) {
    final context = _sectionKeys[section]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildSection(
      String title, String description, List<Widget> examples) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            key: _sectionKeys[title],
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              children: examples,
            ),
          ),
          const Divider(height: 64),
        ],
      ),
    );
  }

  Widget _buildExample(String title, Widget example, String codeSnippet) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                Center(child: example),
                const SizedBox(height: 24),
              ],
            ),
          ),
          const Divider(height: 1),
          Theme(
            data: ThemeData(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 16),
              title: Row(
                children: [
                  Icon(
                    Icons.code,
                    size: 20,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'View Code',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainer,
                              child: SelectableText(
                                codeSnippet,
                                style: const TextStyle(
                                  fontFamily: 'monospace',
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
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
                              const SnackBar(
                                content: Text('Code copied to clipboard'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          tooltip: 'Copy code',
                          color: Colors.grey.shade700,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Content Widgets'),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    'Content Cards',
                    'Rich content cards with customizable layouts and styles.',
                    [
                      _buildExample(
                        'Analytics Dashboard',
                        ContentCard(
                          title: 'Monthly Performance',
                          subtitle: 'Last 30 days overview',
                          style: ContentCardStyle(
                            backgroundColor: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            headerBackgroundColor: Colors.blue.shade50,
                            shadows: [
                              BoxShadow(
                                color: Colors.blue.shade100.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            titleStyle: TextStyle(
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          leading: Icon(
                            Icons.analytics_rounded,
                            color: Colors.blue.shade700,
                            size: 28,
                          ),
                          content: Column(
                            children: [
                              Row(
                                children: [
                                  _buildStatCard(
                                    'Total Revenue',
                                    '\$24,500',
                                    Icons.attach_money_rounded,
                                    Colors.green,
                                    '+12.5%',
                                  ),
                                  const SizedBox(width: 16),
                                  _buildStatCard(
                                    'Active Users',
                                    '1,234',
                                    Icons.people_rounded,
                                    Colors.blue,
                                    '+5.3%',
                                  ),
                                  const SizedBox(width: 16),
                                  _buildStatCard(
                                    'Conversion Rate',
                                    '3.2%',
                                    Icons.trending_up_rounded,
                                    Colors.orange,
                                    '+0.8%',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Container(
                                height: 200,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Revenue Trend',
                                      style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Expanded(
                                      child: CustomPaint(
                                        size: const Size(double.infinity, 150),
                                        painter: _ChartPainter(
                                          data: [
                                            0.3,
                                            0.5,
                                            0.4,
                                            0.7,
                                            0.6,
                                            0.8,
                                            0.9
                                          ],
                                          color: Colors.blue.shade400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('EXPORT'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('VIEW DETAILS'),
                            ),
                          ],
                        ),
                        '''
ContentCard(
  title: 'Monthly Performance',
  subtitle: 'Last 30 days overview',
  style: ContentCardStyle(
    backgroundColor: Colors.white,
    borderRadius: BorderRadius.circular(16),
    headerBackgroundColor: Colors.blue.shade50,
    shadows: [
      BoxShadow(
        color: Colors.blue.shade100.withOpacity(0.5),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
    titleStyle: TextStyle(
      color: Colors.blue.shade900,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  leading: Icon(
    Icons.analytics_rounded,
    color: Colors.blue.shade700,
    size: 28,
  ),
  content: // Analytics dashboard content...
  actions: [
    TextButton(
      onPressed: () {},
      child: const Text('EXPORT'),
    ),
    ElevatedButton(
      onPressed: () {},
      child: const Text('VIEW DETAILS'),
    ),
  ],
)''',
                      ),
                      // Continue with more examples...
                    ],
                  ),
                  _buildExample(
                    'Team Members',
                    ContentCard(
                      title: 'Development Team',
                      subtitle: 'Active members and roles',
                      style: ContentCardStyle(
                        backgroundColor: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        headerBackgroundColor: Colors.indigo.shade50,
                        shadows: [
                          BoxShadow(
                            color: Colors.indigo.shade100.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        titleStyle: TextStyle(
                          color: Colors.indigo.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        contentPadding: const EdgeInsets.all(24),
                      ),
                      leading: Icon(
                        Icons.groups_rounded,
                        color: Colors.indigo.shade700,
                        size: 28,
                      ),
                      content: Column(
                        children: [
                          _buildTeamMember(
                            'Sarah Johnson',
                            'Lead Developer',
                            'assets/avatar1.jpg',
                            [
                              _buildSkillBadge('Flutter', Colors.blue),
                              _buildSkillBadge('Firebase', Colors.orange),
                              _buildSkillBadge('UI/UX', Colors.purple),
                            ],
                          ),
                          const Divider(height: 32),
                          _buildTeamMember(
                            'Mike Chen',
                            'Backend Engineer',
                            'assets/avatar2.jpg',
                            [
                              _buildSkillBadge('Node.js', Colors.green),
                              _buildSkillBadge('MongoDB', Colors.teal),
                              _buildSkillBadge('AWS', Colors.amber),
                            ],
                          ),
                          const Divider(height: 32),
                          _buildTeamMember(
                            'Emma Davis',
                            'UI Designer',
                            'assets/avatar3.jpg',
                            [
                              _buildSkillBadge('Figma', Colors.pink),
                              _buildSkillBadge(
                                  'Prototyping', Colors.deepPurple),
                              _buildSkillBadge('Motion', Colors.cyan),
                            ],
                          ),
                        ],
                      ),
                      actions: [
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          label: const Text('ADD MEMBER'),
                        ),
                        FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.message_rounded),
                          label: const Text('TEAM CHAT'),
                        ),
                      ],
                    ),
                    '''
ContentCard(
  title: 'Development Team',
  subtitle: 'Active members and roles',
  style: ContentCardStyle(
    backgroundColor: Colors.white,
    borderRadius: BorderRadius.circular(16),
    headerBackgroundColor: Colors.indigo.shade50,
    shadows: [
      BoxShadow(
        color: Colors.indigo.shade100.withOpacity(0.5),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
    titleStyle: TextStyle(
      color: Colors.indigo.shade900,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    contentPadding: const EdgeInsets.all(24),
  ),
  leading: Icon(Icons.groups_rounded),
  content: // Team members list...
  actions: [
    OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.add),
      label: const Text('ADD MEMBER'),
    ),
    FilledButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.message_rounded),
      label: const Text('TEAM CHAT'),
    ),
  ],
)''',
                  ),
                  _buildExample(
                    'Project Overview',
                    ContentCard(
                      style: ContentCardStyle(
                        backgroundColor: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        headerPadding: const EdgeInsets.all(24),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.teal.shade50,
                            Colors.blue.shade50,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        titleStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        shadows: [
                          BoxShadow(
                            color: Colors.teal.shade100.withOpacity(0.5),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      title: 'Mobile App Redesign',
                      subtitle: 'Due in 2 weeks',
                      leading: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.phone_iphone_rounded,
                          color: Colors.teal.shade700,
                          size: 28,
                        ),
                      ),
                      content: Column(
                        children: [
                          _buildProgressSection(
                            'Design Phase',
                            0.8,
                            Colors.purple,
                            'UI mockups and prototypes',
                          ),
                          const SizedBox(height: 20),
                          _buildProgressSection(
                            'Development',
                            0.6,
                            Colors.blue,
                            'Core features implementation',
                          ),
                          const SizedBox(height: 20),
                          _buildProgressSection(
                            'Testing',
                            0.3,
                            Colors.orange,
                            'QA and bug fixes',
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: _buildMetricBox(
                                  'Tasks',
                                  '45/60',
                                  Icons.task_alt_rounded,
                                  Colors.teal,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildMetricBox(
                                  'Time Spent',
                                  '180h',
                                  Icons.timer_rounded,
                                  Colors.blue,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildMetricBox(
                                  'Team Size',
                                  '8',
                                  Icons.people_rounded,
                                  Colors.purple,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      actions: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.topic_rounded),
                          label: const Text('VIEW TASKS'),
                        ),
                        FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.edit_rounded),
                          label: const Text('UPDATE STATUS'),
                        ),
                      ],
                    ),
                    '''
ContentCard(
  style: ContentCardStyle(
    backgroundColor: Colors.white,
    borderRadius: BorderRadius.circular(20),
    headerPadding: const EdgeInsets.all(24),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
    gradient: LinearGradient(
      colors: [
        Colors.teal.shade50,
        Colors.blue.shade50,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    titleStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    shadows: [
      BoxShadow(
        color: Colors.teal.shade100.withOpacity(0.5),
        blurRadius: 15,
        offset: const Offset(0, 5),
      ),
    ],
  ),
  title: 'Mobile App Redesign',
  subtitle: 'Due in 2 weeks',
  content: // Project progress content...
  actions: [
    TextButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.topic_rounded),
      label: const Text('VIEW TASKS'),
    ),
    FilledButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.edit_rounded),
      label: const Text('UPDATE STATUS'),
    ),
  ],
)''',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color, String change) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              change,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom chart painter for the analytics example
class _ChartPainter extends CustomPainter {
  final List<double> data;
  final Color color;

  _ChartPainter({required this.data, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    final width = size.width;
    final height = size.height;
    final segmentWidth = width / (data.length - 1);

    path.moveTo(0, height - (data[0] * height));

    for (int i = 1; i < data.length; i++) {
      path.lineTo(i * segmentWidth, height - (data[i] * height));
    }

    canvas.drawPath(path, paint);

    // Draw gradient fill
    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withOpacity(0.2),
          color.withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, width, height));

    final fillPath = Path.from(path)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(_ChartPainter oldDelegate) =>
      data != oldDelegate.data || color != oldDelegate.color;
}

// Helper methods for the examples
Widget _buildTeamMember(
    String name, String role, String avatar, List<Widget> skills) {
  return Row(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(avatar),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              role,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills,
            ),
          ],
        ),
      ),
      IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {},
      ),
    ],
  );
}

Widget _buildSkillBadge(String text, MaterialColor color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color.shade50,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: color.shade200),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: color.shade700,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget _buildProgressSection(
    String title, double progress, MaterialColor color, String description) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            '${(progress * 100).toInt()}%',
            style: TextStyle(
              color: color.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      const SizedBox(height: 8),
      LinearProgressIndicator(
        value: progress,
        backgroundColor: color.shade50,
        valueColor: AlwaysStoppedAnimation(color.shade400),
        borderRadius: BorderRadius.circular(4),
        minHeight: 8,
      ),
      const SizedBox(height: 4),
      Text(
        description,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14,
        ),
      ),
    ],
  );
}

Widget _buildMetricBox(
    String title, String value, IconData icon, MaterialColor color) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color.shade50,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: color.shade100),
    ),
    child: Column(
      children: [
        Icon(icon, color: color.shade400, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: color.shade900,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: color.shade700,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
