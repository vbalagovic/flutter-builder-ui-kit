import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_builder_ui/flutter_builder_ui.dart';

class ButtonExamplesScreen extends StatelessWidget {
  const ButtonExamplesScreen({super.key});

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
                    title: 'Animated Press Button',
                    description:
                        'Button with smooth press animation and customizable effects',
                    examples: [
                      _ButtonExample(
                        title: 'Simple',
                        example: AnimatedPressButton(
                          label: 'Get Started',
                          onPressed: () {},
                          icon: Icons.arrow_forward,
                          color: Colors.blue,
                        ),
                        codeSnippet: '''
AnimatedPressButton(
  label: 'Get Started',
  onPressed: () {},
  icon: Icons.arrow_forward,
  color: Colors.blue,
)''',
                      ),
                      _ButtonExample(
                        title: 'Custom Style',
                        example: AnimatedPressButton(
                          label: 'Download App',
                          onPressed: () {},
                          icon: Icons.download,
                          color: Colors.purple,
                          height: 56,
                          scaleAmount: 0.9,
                          customShadow: BoxShadow(
                            color: Colors.purple.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                          labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        codeSnippet: '''
AnimatedPressButton(
  label: 'Download App',
  onPressed: () {},
  icon: Icons.download,
  color: Colors.purple,
  height: 56,
  scaleAmount: 0.9,
  customShadow: BoxShadow(
    color: Colors.purple.withOpacity(0.3),
    blurRadius: 15,
    offset: const Offset(0, 8),
  ),
  labelStyle: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
)''',
                      ),
                      _ButtonExample(
                        title: 'Premium',
                        example: AnimatedPressButton(
                          label: 'Upgrade',
                          onPressed: () {},
                          icon: Icons.star,
                          suffixIcon: Icons.arrow_forward,
                          color: Colors.amber.shade700,
                          width: 200,
                          height: 60,
                          borderRadius: 30,
                          iconSpacing: 12,
                          scaleAmount: 0.85,
                        ),
                        codeSnippet: '''
AnimatedPressButton(
  label: 'Upgrade',
  onPressed: () {},
  icon: Icons.star,
  suffixIcon: Icons.arrow_forward,
  color: Colors.amber.shade700,
  width: 200,
  height: 60,
  borderRadius: 30,
  iconSpacing: 12,
  scaleAmount: 0.85,
)''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Bouncing Icon Button',
                    description: 'Circular icon button with bouncing animation',
                    examples: [
                      _ButtonExample(
                        title: 'Simple',
                        example: BouncingIconButton(
                          icon: Icons.favorite,
                          onPressed: () {},
                          color: Colors.red,
                          size: 56,
                        ),
                        codeSnippet: '''
BouncingIconButton(
  icon: Icons.favorite,
  onPressed: () {},
  color: Colors.red,
  size: 56,
)''',
                      ),
                      _ButtonExample(
                        title: 'Custom Style',
                        example: BouncingIconButton(
                          icon: Icons.play_arrow_rounded,
                          onPressed: () {},
                          color: Colors.green,
                          size: 64,
                          backgroundOpacity: 0.15,
                          iconSize: 32,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.green.withOpacity(0.3),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        codeSnippet: '''
BouncingIconButton(
  icon: Icons.play_arrow_rounded,
  onPressed: () {},
  color: Colors.green,
  size: 64,
  backgroundOpacity: 0.15,
  iconSize: 32,
  borderRadius: BorderRadius.circular(16),
  border: Border.all(
    color: Colors.green.withOpacity(0.3),
    width: 2,
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.green.withOpacity(0.2),
      blurRadius: 12,
      offset: const Offset(0, 6),
    ),
  ],
)''',
                      ),
                      _ButtonExample(
                        title: 'Premium',
                        example: BouncingIconButton(
                          icon: Icons.rocket_launch_rounded,
                          onPressed: () {},
                          color: Colors.deepPurple,
                          size: 72,
                          scaleAmount: 0.7,
                          animationDuration: const Duration(milliseconds: 300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                              spreadRadius: 2,
                            ),
                          ],
                          tooltip: 'Launch App',
                        ),
                        codeSnippet: '''
BouncingIconButton(
  icon: Icons.rocket_launch_rounded,
  onPressed: () {},
  color: Colors.deepPurple,
  size: 72,
  scaleAmount: 0.7,
  animationDuration: const Duration(milliseconds: 300),
  boxShadow: [
    BoxShadow(
      color: Colors.deepPurple.withOpacity(0.3),
      blurRadius: 15,
      offset: const Offset(0, 8),
      spreadRadius: 2,
    ),
  ],
  tooltip: 'Launch App',
)''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Glass Button',
                    description:
                        'Frosted glass effect button with background blur',
                    examples: [
                      _ButtonExample(
                        title: 'Card Payment',
                        example: _buildGlassBackground(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade400,
                              Colors.purple.shade400,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          pattern: true,
                          aspectRatio: 1.8,
                          child: Center(
                            child: GlassButton(
                              padding: const EdgeInsets.all(5),
                              label: 'Pay with Card',
                              onPressed: () {},
                              icon: Icons.credit_card,
                              width: 200,
                              height: 50,
                              blurAmount: 15,
                              opacity: 0.2,
                              borderOpacity: 0.25,
                              labelStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                              iconColor: Colors.white70,
                            ),
                          ),
                        ),
                        codeSnippet: '''
GlassButton(
  label: 'Pay with Card',
  onPressed: () {},
  icon: Icons.credit_card,
  width: 200,
  height: 50,
  blurAmount: 15,
  opacity: 0.2,
  borderOpacity: 0.25,
  labelStyle: const TextStyle(
    fontSize: 16,
    color: Colors.white70,
  ),
  iconColor: Colors.white70,
)''',
                      ),
                      _ButtonExample(
                        title: 'Music Player',
                        example: _buildGlassBackground(
                          gradient: LinearGradient(
                            colors: [
                              Colors.teal.shade300,
                              Colors.blue.shade400,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          pattern: true,
                          aspectRatio: 1.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GlassButton(
                                onPressed: () {},
                                icon: Icons.skip_previous_rounded,
                                width: 48,
                                height: 48,
                                blurAmount: 15,
                                opacity: 0.15,
                                borderOpacity: 0.25,
                                iconColor: Colors.white70,
                                iconSize: 24,
                              ),
                              const SizedBox(width: 16),
                              GlassButton(
                                onPressed: () {},
                                icon: Icons.play_arrow_rounded,
                                width: 64,
                                height: 64,
                                blurAmount: 15,
                                opacity: 0.15,
                                borderOpacity: 0.25,
                                iconColor: Colors.white70,
                                iconSize: 32,
                                borderWidth: 1.5,
                              ),
                              const SizedBox(width: 16),
                              GlassButton(
                                onPressed: () {},
                                icon: Icons.skip_next_rounded,
                                width: 48,
                                height: 48,
                                blurAmount: 15,
                                opacity: 0.15,
                                borderOpacity: 0.25,
                                iconColor: Colors.white70,
                                iconSize: 24,
                              ),
                            ],
                          ),
                        ),
                        codeSnippet: '''
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    GlassButton(
      onPressed: () {},
      icon: Icons.skip_previous_rounded,
      width: 48,
      height: 48,
      blurAmount: 15,
      opacity: 0.15,
      borderOpacity: 0.25,
      iconColor: Colors.white70,
      iconSize: 24,
    ),
    const SizedBox(width: 16),
    GlassButton(
      onPressed: () {},
      icon: Icons.play_arrow_rounded,
      width: 64,
      height: 64,
      blurAmount: 15,
      opacity: 0.15,
      borderOpacity: 0.25,
      iconColor: Colors.white70,
      iconSize: 32,
      borderWidth: 1.5,
    ),
    const SizedBox(width: 16),
    GlassButton(
      onPressed: () {},
      icon: Icons.skip_next_rounded,
      width: 48,
      height: 48,
      blurAmount: 15,
      opacity: 0.15,
      borderOpacity: 0.25,
      iconColor: Colors.white70,
      iconSize: 24,
    ),
  ],
)''',
                      ),
                      _ButtonExample(
                        title: 'Premium Card',
                        example: _buildGlassBackground(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.shade400,
                              Colors.pink.shade400,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          pattern: true,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.15),
                                ),
                                child: const Icon(
                                  Icons.workspace_premium,
                                  color: Colors.white70,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(height: 16),
                              GlassButton(
                                label: 'Upgrade Now',
                                onPressed: () {},
                                width: 180,
                                height: 48,
                                blurAmount: 15,
                                opacity: 0.15,
                                borderOpacity: 0.25,
                                icon: Icons.star,
                                iconSize: 18,
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: 12),
                              GlassButton(
                                label: 'Learn More',
                                onPressed: () {},
                                width: 180,
                                height: 44,
                                blurAmount: 15,
                                opacity: 0.1,
                                borderOpacity: 0.2,
                                suffixIcon: Icons.arrow_forward,
                                iconSize: 16,
                                labelStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                        codeSnippet: '''
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.15),
      ),
      child: const Icon(
        Icons.workspace_premium,
        color: Colors.white70,
        size: 28,
      ),
    ),
    const SizedBox(height: 16),
    GlassButton(
      label: 'Upgrade Now',
      onPressed: () {},
      width: 180,
      height: 48,
      blurAmount: 15,
      opacity: 0.15,
      borderOpacity: 0.25,
      icon: Icons.star,
      iconSize: 18,
      labelStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white70,
      ),
      iconColor: Colors.white70,
    ),
    const SizedBox(height: 12),
    GlassButton(
      label: 'Learn More',
      onPressed: () {},
      width: 180,
      height: 44,
      blurAmount: 15,
      opacity: 0.1,
      borderOpacity: 0.2,
      suffixIcon: Icons.arrow_forward,
      iconSize: 16,
      labelStyle: const TextStyle(
        fontSize: 15,
        color: Colors.white70,
      ),
      iconColor: Colors.white70,
    ),
  ],
)''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Icon Animated Button',
                    description:
                        'Button with expanding label on hover and press animations',
                    examples: [
                      _ButtonExample(
                        title: 'Simple Menu',
                        example: IconAnimatedButton(
                          icon: Icons.menu,
                          label: 'Menu',
                          onPressed: () {},
                          color: Colors.blue,
                        ),
                        codeSnippet: '''
IconAnimatedButton(
  icon: Icons.menu,
  label: 'Menu',
  onPressed: () {},
  color: Colors.blue,
)''',
                      ),
                      _ButtonExample(
                        title: 'Notifications',
                        example: IconAnimatedButton(
                          icon: Icons.notifications,
                          label: 'Notifications',
                          onPressed: () {},
                          color: Colors.amber.shade700,
                          height: 56,
                          borderRadius: 16,
                          animationDuration: const Duration(milliseconds: 300),
                        ),
                        codeSnippet: '''
IconAnimatedButton(
  icon: Icons.notifications,
  label: 'Notifications',
  onPressed: () {},
  color: Colors.amber.shade700,
  height: 56,
  borderRadius: 16,
  animationDuration: const Duration(milliseconds: 300),
)''',
                      ),
                      _ButtonExample(
                        title: 'Settings',
                        example: SizedBox(
                          width: 200, // Constrain width to prevent overflow
                          child: IconAnimatedButton(
                            icon: Icons.settings,
                            label: 'Settings',
                            onPressed: () {},
                            color: Colors.deepPurple,
                            height: 60,
                            borderRadius: 30,
                            minWidth: 60,
                            expandOnHover: true,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepPurple.withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                            // Add overflow handling for text
                            labelStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        codeSnippet: '''
SizedBox(
  width: 200,
  child: IconAnimatedButton(
    icon: Icons.settings,
    label: 'Settings',
    onPressed: () {},
    color: Colors.deepPurple,
    height: 60,
    borderRadius: 30,
    minWidth: 60,
    expandOnHover: true,
    boxShadow: [
      BoxShadow(
        color: Colors.deepPurple.withOpacity(0.3),
        blurRadius: 12,
        offset: const Offset(0, 6),
      ),
    ],
    labelStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    ),
  ),
)''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Custom Button',
                    description:
                        'Versatile button component for common UI actions',
                    examples: [
                      _ButtonExample(
                        title: 'Primary Buttons',
                        example: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomButton(
                              label: 'Sign In',
                              onPressed: () {},
                              width: 280,
                              height: 48,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor: Colors.white,
                              borderRadius: 8,
                              prefixIcon: Icons.login,
                            ),
                            const SizedBox(height: 12),
                            CustomButton(
                              label: 'Continue',
                              onPressed: () {},
                              width: 280,
                              height: 48,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor: Colors.white,
                              borderRadius: 8,
                              suffixIcon: Icons.arrow_forward,
                            ),
                            const SizedBox(height: 12),
                            CustomButton(
                              label: 'Create Account',
                              onPressed: () {},
                              width: 280,
                              height: 48,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor: Colors.white,
                              borderRadius: 8,
                            ),
                          ],
                        ),
                        codeSnippet: '''
CustomButton(
  label: 'Sign In',
  onPressed: () {},
  width: 280,
  height: 48,
  backgroundColor: Theme.of(context).colorScheme.primary,
  foregroundColor: Colors.white,
  borderRadius: 8,
  prefixIcon: Icons.login,
),

CustomButton(
  label: 'Continue',
  onPressed: () {},
  width: 280,
  height: 48,
  backgroundColor: Theme.of(context).colorScheme.primary,
  foregroundColor: Colors.white,
  borderRadius: 8,
  suffixIcon: Icons.arrow_forward,
),

CustomButton(
  label: 'Create Account',
  onPressed: () {},
  width: 280,
  height: 48,
  backgroundColor: Theme.of(context).colorScheme.primary,
  foregroundColor: Colors.white,
  borderRadius: 8,
),''',
                      ),
                      _ButtonExample(
                        title: 'Secondary Buttons',
                        example: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomButton(
                              label: 'Add to Cart',
                              onPressed: () {},
                              width: 280,
                              height: 48,
                              backgroundColor: Colors.transparent,
                              foregroundColor:
                                  Theme.of(context).colorScheme.primary,
                              borderRadius: 8,
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1.5,
                              ),
                              prefixIcon: Icons.shopping_cart_outlined,
                            ),
                            const SizedBox(height: 12),
                            CustomButton(
                              label: 'Save for Later',
                              onPressed: () {},
                              width: 280,
                              height: 48,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.1),
                              foregroundColor:
                                  Theme.of(context).colorScheme.primary,
                              borderRadius: 8,
                              prefixIcon: Icons.bookmark_border,
                            ),
                            const SizedBox(height: 12),
                            CustomButton(
                              label: 'Cancel',
                              onPressed: () {},
                              width: 280,
                              height: 48,
                              backgroundColor: Colors.transparent,
                              foregroundColor:
                                  Theme.of(context).colorScheme.error,
                              borderRadius: 8,
                              border: Border.all(
                                color: Theme.of(context).colorScheme.error,
                                width: 1.5,
                              ),
                            ),
                          ],
                        ),
                        codeSnippet: '''
CustomButton(
  label: 'Add to Cart',
  onPressed: () {},
  width: 280,
  height: 48,
  backgroundColor: Colors.transparent,
  foregroundColor: Theme.of(context).colorScheme.primary,
  borderRadius: 8,
  border: Border.all(
    color: Theme.of(context).colorScheme.primary,
    width: 1.5,
  ),
  prefixIcon: Icons.shopping_cart_outlined,
),

CustomButton(
  label: 'Save for Later',
  onPressed: () {},
  width: 280,
  height: 48,
  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
  foregroundColor: Theme.of(context).colorScheme.primary,
  borderRadius: 8,
  prefixIcon: Icons.bookmark_border,
),

CustomButton(
  label: 'Cancel',
  onPressed: () {},
  width: 280,
  height: 48,
  backgroundColor: Colors.transparent,
  foregroundColor: Theme.of(context).colorScheme.error,
  borderRadius: 8,
  border: Border.all(
    color: Theme.of(context).colorScheme.error,
    width: 1.5,
  ),
),''',
                      ),
                      _ButtonExample(
                        title: 'Action Buttons',
                        example: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomButton(
                                  label: 'Edit',
                                  onPressed: () {},
                                  width: 135,
                                  height: 40,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1),
                                  foregroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  borderRadius: 8,
                                  prefixIcon: Icons.edit,
                                ),
                                const SizedBox(width: 10),
                                CustomButton(
                                  label: 'Delete',
                                  onPressed: () {},
                                  width: 135,
                                  height: 40,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .error
                                      .withOpacity(0.1),
                                  foregroundColor:
                                      Theme.of(context).colorScheme.error,
                                  borderRadius: 8,
                                  prefixIcon: Icons.delete_outline,
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            CustomButton(
                              label: 'Share with Friends',
                              onPressed: () {},
                              width: 280,
                              height: 40,
                              backgroundColor: Colors.transparent,
                              foregroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              borderRadius: 8,
                              border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.5),
                                width: 1,
                              ),
                              prefixIcon: Icons.share,
                            ),
                            const SizedBox(height: 12),
                            CustomButton(
                              label: 'View Details',
                              onPressed: () {},
                              width: 280,
                              height: 40,
                              backgroundColor: Colors.transparent,
                              foregroundColor:
                                  Theme.of(context).colorScheme.primary,
                              labelStyle: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        codeSnippet: '''
Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    CustomButton(
      label: 'Edit',
      onPressed: () {},
      width: 135,
      height: 40,
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      foregroundColor: Theme.of(context).colorScheme.primary,
      borderRadius: 8,
      prefixIcon: Icons.edit,
    ),
    const SizedBox(width: 10),
    CustomButton(
      label: 'Delete',
      onPressed: () {},
      width: 135,
      height: 40,
      backgroundColor: Theme.of(context).colorScheme.error.withOpacity(0.1),
      foregroundColor: Theme.of(context).colorScheme.error,
      borderRadius: 8,
      prefixIcon: Icons.delete_outline,
    ),
  ],
),

CustomButton(
  label: 'Share with Friends',
  onPressed: () {},
  width: 280,
  height: 40,
  backgroundColor: Colors.transparent,
  foregroundColor: Theme.of(context).colorScheme.secondary,
  borderRadius: 8,
  border: Border.all(
    color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
    width: 1,
  ),
  prefixIcon: Icons.share,
),

CustomButton(
  label: 'View Details',
  onPressed: () {},
  width: 280,
  height: 40,
  backgroundColor: Colors.transparent,
  foregroundColor: Theme.of(context).colorScheme.primary,
  labelStyle: TextStyle(
    decoration: TextDecoration.underline,
    color: Theme.of(context).colorScheme.primary,
  ),
),''',
                      ),
                    ],
                  ),
                  _buildSection(
                    context: context,
                    title: 'Gradient Button',
                    description:
                        'Button with smooth gradient effects and modern styling',
                    examples: [
                      _ButtonExample(
                        title: 'Payment Action',
                        example: GradientButton(
                          label: 'Pay with Card',
                          onPressed: () {},
                          gradientColors: [
                            Colors.blue.shade400,
                            Colors.purple.shade400,
                          ],
                          width: 200,
                          height: 50,
                          borderRadius: 25,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          suffixIcon: Icons.credit_card,
                        ),
                        codeSnippet: '''
GradientButton(
  label: 'Pay with Card',
  onPressed: () {},
  gradientColors: [
    Colors.blue.shade400,
    Colors.purple.shade400,
  ],
  width: 200,
  height: 50,
  borderRadius: 25,
  boxShadow: [
    BoxShadow(
      color: Colors.blue.withOpacity(0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ],
  icon: Icons.credit_card,
)''',
                      ),
                      _ButtonExample(
                        title: 'Media Controls',
                        example: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GradientButton(
                              label: '',
                              onPressed: () {},
                              gradientColors: [
                                Colors.teal.shade300,
                                Colors.blue.shade400,
                              ],
                              width: 48,
                              height: 48,
                              borderRadius: 24,
                              suffixIcon: Icons.skip_previous_rounded,
                              iconSize: 24,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.teal.withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16),
                            GradientButton(
                              label: '',
                              onPressed: () {},
                              gradientColors: [
                                Colors.teal.shade300,
                                Colors.blue.shade400,
                              ],
                              width: 64,
                              height: 64,
                              borderRadius: 32,
                              suffixIcon: Icons.play_arrow_rounded,
                              iconSize: 32,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.teal.withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16),
                            GradientButton(
                              label: '',
                              onPressed: () {},
                              gradientColors: [
                                Colors.teal.shade300,
                                Colors.blue.shade400,
                              ],
                              width: 48,
                              height: 48,
                              borderRadius: 24,
                              suffixIcon: Icons.skip_next_rounded,
                              iconSize: 24,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.teal.withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                          ],
                        ),
                        codeSnippet: '''
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    GradientButton(
      label: '',
      onPressed: () {},
      gradientColors: [
        Colors.teal.shade300,
        Colors.blue.shade400,
      ],
      width: 48,
      height: 48,
      borderRadius: 24,
      icon: Icons.skip_previous_rounded,
      iconSize: 24,
      boxShadow: [
        BoxShadow(
          color: Colors.teal.withOpacity(0.3),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    const SizedBox(width: 16),
    GradientButton(
      label: '',
      onPressed: () {},
      gradientColors: [
        Colors.teal.shade300,
        Colors.blue.shade400,
      ],
      width: 64,
      height: 64,
      borderRadius: 32,
      icon: Icons.play_arrow_rounded,
      iconSize: 32,
      boxShadow: [
        BoxShadow(
          color: Colors.teal.withOpacity(0.3),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    const SizedBox(width: 16),
    GradientButton(
      label: '',
      onPressed: () {},
      gradientColors: [
        Colors.teal.shade300,
        Colors.blue.shade400,
      ],
      width: 48,
      height: 48,
      borderRadius: 24,
      icon: Icons.skip_next_rounded,
      iconSize: 24,
      boxShadow: [
        BoxShadow(
          color: Colors.teal.withOpacity(0.3),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
  ],
)''',
                      ),
                      _ButtonExample(
                        title: 'Premium Features',
                        example: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.orange.shade400,
                                    Colors.pink.shade400,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.withOpacity(0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.workspace_premium,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            const SizedBox(height: 16),
                            GradientButton(
                              label: 'Upgrade Now',
                              onPressed: () {},
                              gradientColors: [
                                Colors.orange.shade400,
                                Colors.pink.shade400,
                              ],
                              width: 180,
                              height: 48,
                              borderRadius: 24,
                              prefixIcon: Icons.star,
                              iconSize: 20,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.orange.withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            GradientButton(
                              label: 'Learn More',
                              onPressed: () {},
                              gradientColors: [
                                Colors.orange.shade400.withOpacity(0.8),
                                Colors.pink.shade400.withOpacity(0.8),
                              ],
                              width: 180,
                              height: 44,
                              borderRadius: 22,
                              suffixIcon: Icons.arrow_forward,
                              iconSize: 18,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.orange.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                          ],
                        ),
                        codeSnippet: '''
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Colors.orange.shade400,
            Colors.pink.shade400,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Icon(
        Icons.workspace_premium,
        color: Colors.white,
        size: 28,
      ),
    ),
    const SizedBox(height: 16),
    GradientButton(
      label: 'Upgrade Now',
      onPressed: () {},
      gradientColors: [
        Colors.orange.shade400,
        Colors.pink.shade400,
      ],
      width: 180,
      height: 48,
      borderRadius: 24,
      icon: Icons.star,
      iconSize: 20,
      boxShadow: [
        BoxShadow(
          color: Colors.orange.withOpacity(0.3),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    const SizedBox(height: 12),
    GradientButton(
      label: 'Learn More',
      onPressed: () {},
      gradientColors: [
        Colors.orange.shade400.withOpacity(0.8),
        Colors.pink.shade400.withOpacity(0.8),
      ],
      width: 180,
      height: 44,
      borderRadius: 22,
      suffixIcon: Icons.arrow_forward,
      iconSize: 18,
      boxShadow: [
        BoxShadow(
          color: Colors.orange.withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
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
    required List<_ButtonExample> examples,
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

  Widget _buildGlassBackground({
    required Widget child,
    required Gradient gradient,
    double aspectRatio = 1,
    bool pattern = false,
  }) {
    return Container(
      width: 350,
      height: 200,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradient.colors.first.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (pattern) ...[
            // Decorative circles
            Positioned(
              top: -20,
              left: -20,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              bottom: -40,
              right: -20,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            // Grid pattern
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: 36,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              },
            ),
          ],
          // Content
          Center(child: child),
        ],
      ),
    );
  }
}

class _ButtonExample extends StatelessWidget {
  final String title;
  final Widget example;
  final String codeSnippet;

  const _ButtonExample({
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
                Center(
                  child: example,
                ),
                const SizedBox(height: 24),
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
                                duration: const Duration(seconds: 2),
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
