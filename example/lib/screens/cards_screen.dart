import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_builder_ui_kit/flutter_builder_ui_kit.dart';

class CardsExamplesScreen extends StatelessWidget {
  const CardsExamplesScreen({super.key});

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
                    title: 'Glass Card',
                    description:
                        'Frosted glass effect card with blur and transparency',
                    examples: [
                      _CardExample(
                        title: 'Weather Card',
                        example: Container(
                          width: 350,
                          height: 200,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1534088568595-a066f410bcda?w=800&auto=format&fit=crop&q=60',
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: GlassCard(
                              onTap: () {},
                              style: GlassCardStyle(
                                blur: 10,
                                tintOpacity: 0.15,
                                borderRadius: BorderRadius.circular(16),
                                width: 240,
                                height: 140,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.cloud,
                                          color: Colors.white.withOpacity(0.9),
                                          size: 24,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '24°C',
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.9),
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Partly Cloudy',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'New York City',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        codeSnippet: '''
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: NetworkImage('background.jpg'),
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.circular(16),
  ),
  child: GlassCard(
    onTap: () {},
    style: GlassCardStyle(
      blur: 10,
      opacity: 0.15,
      borderRadius: BorderRadius.circular(16),
      width: 240,
      height: 140,
    ),
    child: // Weather content
  ),
)''',
                      ),
                      _CardExample(
                        title: 'Music Player',
                        example: Container(
                          width: 350,
                          height: 200,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?w=800&auto=format&fit=crop&q=60',
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GlassCard(
                                  onTap: () {},
                                  style: GlassCardStyle(
                                    blur: 8,
                                    tintOpacity: 0.15,
                                    borderRadius: BorderRadius.circular(25),
                                    width: 50,
                                    height: 50,
                                  ),
                                  child: Icon(
                                    Icons.skip_previous,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                GlassCard(
                                  onTap: () {},
                                  style: GlassCardStyle(
                                    blur: 8,
                                    tintOpacity: 0.15,
                                    borderRadius: BorderRadius.circular(35),
                                    width: 70,
                                    height: 70,
                                  ),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white.withOpacity(0.9),
                                    size: 32,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                GlassCard(
                                  onTap: () {},
                                  style: GlassCardStyle(
                                    blur: 8,
                                    tintOpacity: 0.15,
                                    borderRadius: BorderRadius.circular(25),
                                    width: 50,
                                    height: 50,
                                  ),
                                  child: Icon(
                                    Icons.skip_next,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        codeSnippet: '''
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    GlassCard(
      onTap: () {},
      style: GlassCardStyle(
        blur: 8,
        opacity: 0.15,
        borderRadius: BorderRadius.circular(25),
        width: 50,
        height: 50,
      ),
      child: Icon(Icons.skip_previous),
    ),
    SizedBox(width: 16),
    GlassCard(
      onTap: () {},
      style: GlassCardStyle(
        blur: 8,
        opacity: 0.15,
        borderRadius: BorderRadius.circular(35),
        width: 70,
        height: 70,
      ),
      child: Icon(Icons.play_arrow, size: 32),
    ),
    SizedBox(width: 16),
    GlassCard(
      onTap: () {},
      style: GlassCardStyle(
        blur: 8,
        opacity: 0.15,
        borderRadius: BorderRadius.circular(25),
        width: 50,
        height: 50,
      ),
      child: Icon(Icons.skip_next),
    ),
  ],
),''',
                      ),
                      _CardExample(
                        title: 'Profile Card',
                        example: Container(
                          width: 350,
                          height: 200,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?w=800&auto=format&fit=crop&q=60',
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: GlassCard(
                              style: GlassCardStyle(
                                blur: 15,
                                tintOpacity: 0.1,
                                borderRadius: BorderRadius.circular(16),
                                width: 280,
                                height: 160,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.5),
                                          width: 2,
                                        ),
                                        image: const DecorationImage(
                                          image: NetworkImage(
                                            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=800&auto=format&fit=crop&q=60',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Sarah Johnson',
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            'UI/UX Designer',
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Row(
                                            children: [
                                              _buildSocialIcon(Icons.facebook),
                                              const SizedBox(width: 12),
                                              _buildSocialIcon(Icons.facebook),
                                              const SizedBox(width: 12),
                                              _buildSocialIcon(Icons.facebook),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        codeSnippet: '''
GlassCard(
  style: GlassCardStyle(
    blur: 15,
    opacity: 0.1,
    borderRadius: BorderRadius.circular(16),
    width: 280,
    height: 160,
  ),
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        CircleAvatar(...),
        Expanded(
          child: Column(
            children: [
              Text('Sarah Johnson'),
              Text('UI/UX Designer'),
              Row(
                children: [
                  // Social icons
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Animated Flip Card',
                    description:
                        'Interactive card that flips between front and back content',
                    examples: [
                      _CardExample(
                        title: 'Profile Card',
                        example: AnimatedFlipCard(
                          front: Container(
                            width: 300,
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.blue,
                                  child: Icon(Icons.person,
                                      size: 40, color: Colors.white),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'John Doe',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text('Frontend Developer'),
                                const SizedBox(height: 8),
                                Text(
                                  'Tap to view contact info',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          back: Container(
                            width: 300,
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildContactInfo(
                                    Icons.email, 'john@example.com'),
                                const SizedBox(height: 12),
                                _buildContactInfo(
                                    Icons.phone, '+1 234 567 890'),
                                const SizedBox(height: 12),
                                _buildContactInfo(
                                    Icons.location_on, 'New York, USA'),
                              ],
                            ),
                          ),
                        ),
                        codeSnippet: '''
AnimatedFlipCard(
  front: Container(
    width: 300,
    padding: const EdgeInsets.all(24),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, size: 40, color: Colors.white),
        ),
        SizedBox(height: 16),
        Text('John Doe',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('Frontend Developer'),
      ],
    ),
  ),
  back: Container(
    width: 300,
    padding: const EdgeInsets.all(24),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildContactInfo(Icons.email, 'john@example.com'),
        _buildContactInfo(Icons.phone, '+1 234 567 890'),
        _buildContactInfo(Icons.location_on, 'New York, USA'),
      ],
    ),
  ),
),''',
                      ),
                      _CardExample(
                        title: 'Product Card',
                        example: AnimatedFlipCard(
                          front: Container(
                            width: 300,
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.laptop_mac,
                                    size: 64, color: Colors.blue.shade700),
                                const SizedBox(height: 16),
                                const Text(
                                  'MacBook Pro',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  '14" M2 Pro, 16GB RAM',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  '\$1,999',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.blue.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          back: Container(
                            width: 300,
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Key Features:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                _buildFeatureRow(Icons.memory, '12-core CPU'),
                                _buildFeatureRow(
                                    Icons.graphic_eq, '19-core GPU'),
                                _buildFeatureRow(Icons.storage, '512GB SSD'),
                                _buildFeatureRow(Icons.battery_charging_full,
                                    '18hrs battery'),
                              ],
                            ),
                          ),
                        ),
                        codeSnippet: '''
AnimatedFlipCard(
  front: Container(
    width: 300,
    padding: const EdgeInsets.all(24),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.laptop_mac, size: 64),
        SizedBox(height: 16),
        Text('MacBook Pro',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('14" M2 Pro, 16GB RAM'),
        SizedBox(height: 16),
        Text('\$1,999',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
  back: Container(
    width: 300,
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Key Features:'),
        _buildFeatureRow(Icons.memory, '12-core CPU'),
        _buildFeatureRow(Icons.graphic_eq, '19-core GPU'),
        _buildFeatureRow(Icons.storage, '512GB SSD'),
        _buildFeatureRow(Icons.battery_charging_full, '18hrs battery'),
      ],
    ),
  ),
),''',
                      ),
                      _CardExample(
                        title: 'Achievement Card',
                        example: AnimatedFlipCard(
                          style: AnimatedFlipCardStyle(
                            flipDuration: const Duration(milliseconds: 800),
                            flipCurve: Curves.easeInOutBack,
                            width: 300,
                            height: 200,
                            frontColor: Colors.indigo.shade50,
                            backColor: Colors.teal.shade50,
                            borderRadius: BorderRadius.circular(20),
                            shadows: [
                              BoxShadow(
                                color: Colors.indigo.withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          front: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.indigo.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.emoji_events,
                                    size: 48,
                                    color: Colors.indigo.shade700,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Achievement Unlocked!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          back: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Master Developer',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal.shade700,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Completed 100 projects',
                                    style: TextStyle(
                                      color: Colors.teal.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.teal.shade100,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      '+500 XP',
                                      style: TextStyle(
                                        color: Colors.teal.shade700,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        codeSnippet: '''
AnimatedFlipCard(
  style: AnimatedFlipCardStyle(
    flipDuration: const Duration(milliseconds: 800),
    flipCurve: Curves.easeInOutBack,
    width: 300,
    height: 200,
    frontColor: Colors.indigo.shade50,
    backColor: Colors.teal.shade50,
    borderRadius: BorderRadius.circular(20),
    shadows: [
      BoxShadow(
        color: Colors.indigo.withOpacity(0.2),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  front: // Achievement front content,
  back: // Achievement back content,
),''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Gradient Border Card',
                    description:
                        'Card with animated gradient border effect and hover animations',
                    examples: [
                      _CardExample(
                        title: 'Premium Plan',
                        example: GradientBorderCard(
                          style: GradientBorderCardStyle(
                            gradientColors: [
                              Colors.blue.shade400,
                              Colors.purple.shade400,
                              Colors.pink.shade400,
                              Colors.blue.shade400,
                            ],
                            borderWidth: 3,
                            borderRadius: 16,
                            backgroundColor: Colors.white,
                            hoverScale: 1.02,
                          ),
                          onTap: () {},
                          child: Container(
                            width: 300,
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.star,
                                    size: 32,
                                    color: Colors.blue.shade600,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Premium Plan',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '\$19.99/month',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                _buildPlanFeature('Unlimited Access'),
                                _buildPlanFeature('Priority Support'),
                                _buildPlanFeature('Custom Themes'),
                              ],
                            ),
                          ),
                        ),
                        codeSnippet: '''
GradientBorderCard(
  style: GradientBorderCardStyle(
    gradientColors: [
      Colors.blue.shade400,
      Colors.purple.shade400,
      Colors.pink.shade400,
      Colors.blue.shade400,
    ],
    borderWidth: 3,
    borderRadius: 16,
    backgroundColor: Colors.white,
    hoverScale: 1.02,
  ),
  onTap: () {},
  child: Container(
    width: 300,
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        Icon(...),
        Text('Premium Plan'),
        Text('\$19.99/month'),
        _buildPlanFeature('Unlimited Access'),
        _buildPlanFeature('Priority Support'),
        _buildPlanFeature('Custom Themes'),
      ],
    ),
  ),
),''',
                      ),
                      _CardExample(
                        title: 'Achievement Card',
                        example: GradientBorderCard(
                          style: GradientBorderCardStyle(
                            gradientColors: [
                              Colors.amber.shade300,
                              Colors.orange.shade400,
                              Colors.red.shade400,
                              Colors.amber.shade300,
                            ],
                            borderWidth: 2,
                            borderRadius: 20,
                            backgroundColor: Colors.amber.shade50,
                            hoverScale: 1.05,
                            shadows: [
                              BoxShadow(
                                color: Colors.amber.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Container(
                            width: 300,
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.amber.shade200,
                                            Colors.orange.shade300,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.emoji_events,
                                      size: 40,
                                      color: Colors.orange.shade800,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Level 10 Achieved!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '1,000 XP Earned',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.orange.shade800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        codeSnippet: '''
GradientBorderCard(
  style: GradientBorderCardStyle(
    gradientColors: [
      Colors.amber.shade300,
      Colors.orange.shade400,
      Colors.red.shade400,
      Colors.amber.shade300,
    ],
    borderWidth: 2,
    borderRadius: 20,
    backgroundColor: Colors.amber.shade50,
    hoverScale: 1.05,
    shadows: [
      BoxShadow(
        color: Colors.amber.withOpacity(0.3),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  child: // Achievement content...
),''',
                      ),
                      _CardExample(
                        title: 'Featured Content',
                        example: GradientBorderCard(
                          style: GradientBorderCardStyle(
                            gradientColors: const [
                              Color(0xFF4158D0),
                              Color(0xFFC850C0),
                              Color(0xFFFFCC70),
                              Color(0xFF4158D0),
                            ],
                            borderWidth: 4,
                            borderRadius: 24,
                            backgroundGradient: LinearGradient(
                              colors: [
                                Colors.blue.shade50,
                                Colors.purple.shade50,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            hoverScale: 1.03,
                            animationDuration:
                                const Duration(milliseconds: 300),
                          ),
                          onTap: () {},
                          child: Container(
                            width: 300,
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: [
                                Container(
                                  height: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                        'https://images.unsplash.com/photo-1614851099175-e5b30eb6f696?w=800&auto=format&fit=crop&q=60',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Creating Beautiful UI',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Learn the principles of modern UI design',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: Colors.grey.shade600,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '15 min read',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Row(
                                        children: [
                                          Text('Read More'),
                                          SizedBox(width: 4),
                                          Icon(Icons.arrow_forward, size: 16),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        codeSnippet: '''
GradientBorderCard(
  style: GradientBorderCardStyle(
    gradientColors: const [
      Color(0xFF4158D0),
      Color(0xFFC850C0),
      Color(0xFFFFCC70),
      Color(0xFF4158D0),
    ],
    borderWidth: 4,
    borderRadius: 24,
    backgroundGradient: LinearGradient(
      colors: [
        Colors.blue.shade50,
        Colors.purple.shade50,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    hoverScale: 1.03,
    animationDuration: const Duration(milliseconds: 300),
  ),
  onTap: () {},
  child: // Featured content...
),''',
                      ),
                    ],
                  ),

                  _buildSection(
                    context: context,
                    title: 'Status Card',
                    description:
                        'Cards for displaying status messages and notifications',
                    examples: [
                      _CardExample(
                        title: 'Basic Statuses',
                        example: Column(
                          children: [
                            StatusCard(
                              customColor: Colors.green.shade400,
                              type: StatusType.success,
                              title: 'Payment Successful',
                              message: 'Your transaction has been completed.',
                              onClose: () {},
                            ),
                            const SizedBox(height: 16),
                            StatusCard(
                              type: StatusType.error,
                              title: 'Connection Error',
                              message: 'Please check your internet connection.',
                              onClose: () {},
                            ),
                            const SizedBox(height: 16),
                            StatusCard(
                              type: StatusType.info,
                              title: 'New Update Available',
                              message: 'Version 2.0 is ready to install.',
                              onClose: () {},
                            ),
                          ],
                        ),
                        codeSnippet: '''
StatusCard(
  type: StatusType.success,
  title: 'Payment Successful',
  message: 'Your transaction has been completed.',
  onClose: () {},
),

StatusCard(
  type: StatusType.error,
  title: 'Connection Error',
  message: 'Please check your internet connection.',
  onClose: () {},
),

StatusCard(
  type: StatusType.info,
  title: 'New Update Available',
  message: 'Version 2.0 is ready to install.',
  onClose: () {},
),''',
                      ),
                      _CardExample(
                        title: 'Custom Status',
                        example: StatusCard(
                          type: StatusType.custom,
                          customColor: const Color(0xFF6C63FF),
                          customIcon: Icons.cloud_upload,
                          title: 'Uploading Files',
                          message: 'Transferring documents to cloud storage...',
                          progress: 0.7,
                          action: TextButton(
                            onPressed: () {},
                            child: const Text('VIEW'),
                          ),
                          style: StatusCardStyle(
                            borderRadius: 16,
                            elevation: 4,
                            iconSize: 28,
                            padding: const EdgeInsets.all(20),
                            //progressBarHeight: 6,
                            progressBorderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        codeSnippet: '''
StatusCard(
  type: StatusType.custom,
  customColor: const Color(0xFF6C63FF),
  customIcon: Icons.cloud_upload,
  title: 'Uploading Files',
  message: 'Transferring documents to cloud storage...',
  progress: 0.7,
  action: TextButton(
    onPressed: () {},
    child: const Text('VIEW'),
  ),
  style: StatusCardStyle(
    borderRadius: 16,
    elevation: 4,
    iconSize: 28,
    padding: const EdgeInsets.all(20),
    progressBarHeight: 6,
    progressBorderRadius: BorderRadius.circular(3),
  ),
),''',
                      ),
                      _CardExample(
                        title: 'Interactive Status',
                        example: StatusCard(
                          type: StatusType.warning,
                          title: 'Storage Almost Full',
                          message: '90% of storage space used',
                          progress: 0.9,
                          style: StatusCardStyle(
                            backgroundColor: Colors.orange.shade50,
                            borderRadius: 20,
                            titleStyle: TextStyle(
                              color: Colors.orange.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                            messageStyle: TextStyle(
                              color: Colors.orange.shade800,
                            ),
                            //progressBarHeight: 8,
                            progressBorderRadius: BorderRadius.circular(4),
                          ),
                          action: OutlinedButton(
                            onPressed: () {},
                            child: const Text('MANAGE'),
                          ),
                        ),
                        codeSnippet: '''
StatusCard(
  type: StatusType.warning,
  title: 'Storage Almost Full',
  message: '90% of storage space used',
  progress: 0.9,
  style: StatusCardStyle(
    backgroundColor: Colors.orange.shade50,
    borderRadius: 20,
    titleStyle: TextStyle(
      color: Colors.orange.shade900,
      fontWeight: FontWeight.bold,
    ),
    messageStyle: TextStyle(
      color: Colors.orange.shade800,
    ),
    progressBarHeight: 8,
    progressBorderRadius: BorderRadius.circular(4),
  ),
  action: OutlinedButton(
    onPressed: () {},
    child: const Text('MANAGE'),
  ),
),''',
                      ),
                    ],
                  ),

// Helper method for Premium Plan feature
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanFeature(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 20,
            color: Colors.blue.shade600,
          ),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 16,
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade700),
        const SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blue.shade700),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required String description,
    required List<_CardExample> examples,
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

class _CardExample extends StatelessWidget {
  final String title;
  final Widget example;
  final String codeSnippet;

  const _CardExample({
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
