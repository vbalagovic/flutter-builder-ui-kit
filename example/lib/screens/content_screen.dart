import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_builder_ui_kit/flutter_builder_ui_kit.dart';

class ContentCardsExampleScreen extends StatefulWidget {
  const ContentCardsExampleScreen({super.key});

  @override
  State<ContentCardsExampleScreen> createState() =>
      _ContentCardsExampleScreenState();
}

class _ContentCardsExampleScreenState extends State<ContentCardsExampleScreen> {
  final _scrollController = ScrollController();
  Set<String> savedRecipes = {};
  Set<String> favoriteProducts = {};
  String? currentlyPlayingPodcast;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Content Cards'),
      ),
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
                    title: 'E-commerce',
                    description: 'Product cards with carousel and variants',
                    examples: [
                      _CardExample(
                        title: 'Basic Product Card',
                        example: ProductCard(
                          name: 'Wireless Noise-Canceling Headphones',
                          price: '\$299.99',
                          originalPrice: '\$349.99',
                          images: const [
                            'https://picsum.photos/seed/headphones1/400',
                            'https://picsum.photos/seed/headphones2/400',
                          ],
                          rating: 4.5,
                          reviews: 128,
                          colors: const [
                            Colors.black,
                            Colors.white,
                            Colors.blue
                          ],
                          isNew: true,
                          isFavorite: favoriteProducts.contains('headphones'),
                          onFavorite: () => setState(() {
                            favoriteProducts.contains('headphones')
                                ? favoriteProducts.remove('headphones')
                                : favoriteProducts.add('headphones');
                          }),
                        ),
                        codeSnippet: '''
ProductCard(
  name: 'Wireless Noise-Canceling Headphones',
  price: '\$299.99',
  originalPrice: '\$349.99',
  images: ['image1_url', 'image2_url'],
  rating: 4.5,
  reviews: 128,
  colors: [Colors.black, Colors.white, Colors.blue],
  isNew: true,
  onAddToCart: () {
    // Handle add to cart
  },
),''',
                      ),
                      _CardExample(
                        title: 'On Sale Product',
                        example: ProductCard(
                          name: 'Smart Watch Series 5',
                          price: '\$199.99',
                          images: const [
                            'https://picsum.photos/seed/watch1/400',
                            'https://picsum.photos/seed/watch2/400',
                          ],
                          rating: 4.8,
                          reviews: 256,
                          colors: const [
                            Colors.grey,
                            Colors.pink,
                            Colors.green
                          ],
                          isFavorite: favoriteProducts.contains('watch'),
                          onFavorite: () => setState(() {
                            favoriteProducts.contains('watch')
                                ? favoriteProducts.remove('watch')
                                : favoriteProducts.add('watch');
                          }),
                        ),
                        codeSnippet: '''
ProductCard(
  name: 'Smart Watch Series 5',
  price: '\$199.99',
  images: ['image1_url', 'image2_url'],
  rating: 4.8,
  reviews: 256,
  colors: [Colors.grey, Colors.pink, Colors.green],
  onFavorite: () {
    // Handle favorite
  },
),''',
                      ),
                      _CardExample(
                        title: 'Featured Product',
                        example: ProductCard(
                          name: 'Portable Bluetooth Speaker',
                          price: '\$79.99',
                          originalPrice: '\$99.99',
                          images: const [
                            'https://picsum.photos/seed/speaker1/400',
                            'https://picsum.photos/seed/speaker2/400',
                          ],
                          rating: 4.2,
                          reviews: 89,
                          colors: const [
                            Colors.orange,
                            Colors.teal,
                            Colors.purple
                          ],
                          isFavorite: favoriteProducts.contains('speaker'),
                          onFavorite: () => setState(() {
                            favoriteProducts.contains('speaker')
                                ? favoriteProducts.remove('speaker')
                                : favoriteProducts.add('speaker');
                          }),
                        ),
                        codeSnippet: '''
ProductCard(
  name: 'Portable Bluetooth Speaker',
  price: '\$79.99',
  originalPrice: '\$99.99',
  images: ['image1_url', 'image2_url'],
  rating: 4.2,
  reviews: 89,
  colors: [Colors.orange, Colors.teal, Colors.purple],
  onAddToCart: () {
    // Handle add to cart
  },
),''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Podcasts',
                    description: 'Episode cards with playback controls',
                    examples: [
                      _CardExample(
                        title: 'Episode Card',
                        example: PodcastCard(
                          title: 'The Future of AI in Healthcare',
                          show: 'Tech Today',
                          duration: '45 min',
                          thumbnailUrl:
                              'https://picsum.photos/seed/podcast1/400',
                          hostName: 'Dr. Sarah Johnson',
                          hostAvatarUrl: 'https://i.pravatar.cc/150?u=sarah',
                          isPlaying: currentlyPlayingPodcast == 'ai-health',
                          onPlay: () => setState(() {
                            currentlyPlayingPodcast =
                                currentlyPlayingPodcast == 'ai-health'
                                    ? null
                                    : 'ai-health';
                          }),
                        ),
                        codeSnippet: '''
PodcastCard(
  title: 'The Future of AI in Healthcare',
  show: 'Tech Today',
  duration: '45 min',
  thumbnailUrl: 'thumbnail_url',
  hostName: 'Dr. Sarah Johnson',
  hostAvatarUrl: 'avatar_url',
  isPlaying: false,
  onPlay: () {
    // Handle play/pause
  },
),''',
                      ),
                      _CardExample(
                        title: 'Playing Episode',
                        example: PodcastCard(
                          title: 'Mindfulness in the Digital Age',
                          show: 'Wellness Weekly',
                          duration: '32 min',
                          thumbnailUrl:
                              'https://picsum.photos/seed/podcast2/400',
                          hostName: 'Mark Davis',
                          hostAvatarUrl: 'https://i.pravatar.cc/150?u=mark',
                          isPlaying: currentlyPlayingPodcast == 'mindfulness',
                          isDownloaded: true,
                          onPlay: () => setState(() {
                            currentlyPlayingPodcast =
                                currentlyPlayingPodcast == 'mindfulness'
                                    ? null
                                    : 'mindfulness';
                          }),
                        ),
                        codeSnippet: '''
PodcastCard(
  title: 'Mindfulness in the Digital Age',
  show: 'Wellness Weekly',
  duration: '32 min',
  thumbnailUrl: 'thumbnail_url',
  hostName: 'Mark Davis',
  hostAvatarUrl: 'avatar_url',
  isPlaying: true,
  isDownloaded: true,
  onPlay: () {
    // Handle play/pause
  },
),''',
                      ),
                      _CardExample(
                        title: 'Downloadable Episode',
                        example: PodcastCard(
                          title: 'Startup Success Stories',
                          show: 'Entrepreneur Hour',
                          duration: '55 min',
                          thumbnailUrl:
                              'https://picsum.photos/seed/podcast3/400',
                          hostName: 'Lisa Chen',
                          hostAvatarUrl: 'https://i.pravatar.cc/150?u=lisa',
                          isPlaying: currentlyPlayingPodcast == 'startup',
                          onPlay: () => setState(() {
                            currentlyPlayingPodcast =
                                currentlyPlayingPodcast == 'startup'
                                    ? null
                                    : 'startup';
                          }),
                        ),
                        codeSnippet: '''
PodcastCard(
  title: 'Startup Success Stories',
  show: 'Entrepreneur Hour',
  duration: '55 min',
  thumbnailUrl: 'thumbnail_url',
  hostName: 'Lisa Chen',
  hostAvatarUrl: 'avatar_url',
  onPlay: () {
    // Handle play/pause
  },
  onDownload: () {
    // Handle download
  },
),''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Recipes',
                    description:
                        'Cooking instructions with detailed information',
                    examples: [
                      _CardExample(
                        title: 'Basic Recipe Card',
                        example: RecipeCard(
                          title: 'Homemade Margherita Pizza',
                          imageUrl: 'https://picsum.photos/seed/pizza/400',
                          author: 'Chef Mario',
                          authorAvatarUrl: 'https://i.pravatar.cc/150?u=mario',
                          prepTime: '20 min',
                          cookTime: '15 min',
                          difficulty: 'Medium',
                          servings: 4,
                          tags: const ['Italian', 'Vegetarian', 'Dinner'],
                          rating: 4.8,
                          reviews: 342,
                          isSaved: savedRecipes.contains('pizza'),
                          onSave: () => setState(() {
                            savedRecipes.contains('pizza')
                                ? savedRecipes.remove('pizza')
                                : savedRecipes.add('pizza');
                          }),
                        ),
                        codeSnippet: '''
RecipeCard(
  title: 'Homemade Margherita Pizza',
  imageUrl: 'image_url',
  author: 'Chef Mario',
  authorAvatarUrl: 'avatar_url',
  prepTime: '20 min',
  cookTime: '15 min',
  difficulty: 'Medium',
  servings: 4,
  tags: ['Italian', 'Vegetarian', 'Dinner'],
  rating: 4.8,
  reviews: 342,
  onSave: () {
    // Handle save recipe
  },
),''',
                      ),
                      // Add remaining recipe examples...
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
    required List<_CardExample> examples,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48),
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
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: examples
                    .map((example) => SizedBox(
                          width: (constraints.maxWidth - 48) / 3,
                          child: example,
                        ))
                    .toList(),
              );
            },
          ),
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
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          example,
          ExpansionTile(
            title: Row(
              children: [
                Icon(
                  Icons.code,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                const Text('View Code'),
              ],
            ),
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
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
        ],
      ),
    );
  }
}
