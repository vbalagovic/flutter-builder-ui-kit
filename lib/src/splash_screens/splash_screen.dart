import 'dart:math' as math;

import 'package:flutter/material.dart';

abstract class BaseSplashState<T extends StatefulWidget> extends State<T>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class MinimalSplashScreen extends StatefulWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final VoidCallback? onInit;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool showProgressIndicator;
  final Duration animationDuration;
  final bool animateIcon;

  const MinimalSplashScreen({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.onInit,
    this.backgroundColor,
    this.foregroundColor,
    this.showProgressIndicator = true,
    this.animationDuration = const Duration(milliseconds: 1500),
    this.animateIcon = true,
  });

  @override
  State<MinimalSplashScreen> createState() => _MinimalSplashScreenState();
}

class _MinimalSplashScreenState extends State<MinimalSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeScaleController;
  late AnimationController _iconController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _iconScaleAnimation;
  late Animation<double> _iconRotateAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    widget.onInit?.call();
  }

  void _initializeAnimations() {
    // Fade and scale animations
    _fadeScaleController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeScaleController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeScaleController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    // Icon animations
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _iconScaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.2)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.2, end: 1.0)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 60,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _iconController,
        curve: const Interval(0.0, 1.0),
      ),
    );

    _iconRotateAnimation = Tween<double>(begin: 0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _iconController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Start animations
    _fadeScaleController.forward();
    if (widget.animateIcon) {
      _iconController.repeat();
    }
  }

  @override
  void dispose() {
    _fadeScaleController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = widget.backgroundColor ?? theme.colorScheme.primary;
    final foregroundColor = widget.foregroundColor ?? Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: AnimatedBuilder(
        animation: Listenable.merge([_fadeScaleController, _iconController]),
        builder: (context, child) {
          return Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated Icon
                    Transform.scale(
                      scale: _iconScaleAnimation.value,
                      child: Transform.rotate(
                        angle:
                            widget.animateIcon ? _iconRotateAnimation.value : 0,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: foregroundColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Icon(
                            widget.icon,
                            size: 48,
                            color: backgroundColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Title
                    Text(
                      widget.title,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: foregroundColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    // Subtitle
                    if (widget.subtitle != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        widget.subtitle!,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: foregroundColor.withOpacity(0.8),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                    // Progress Indicator
                    if (widget.showProgressIndicator) ...[
                      const SizedBox(height: 48),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(foregroundColor),
                          strokeWidth: 2,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Particle Animation Splash Screen
class ParticlesSplashScreen extends StatefulWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final VoidCallback? onInit;
  final Color? primaryColor;
  final Color? secondaryColor;
  final int numberOfParticles;

  const ParticlesSplashScreen({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.onInit,
    this.primaryColor,
    this.secondaryColor,
    this.numberOfParticles = 20,
  });

  @override
  State<ParticlesSplashScreen> createState() => _ParticlesSplashScreenState();
}

class _ParticlesSplashScreenState extends State<ParticlesSplashScreen>
    with SingleTickerProviderStateMixin {
  late List<Particle> particles;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _generateParticles();
    widget.onInit?.call();
  }

  void _initializeAnimations() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Main content animations
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _controller.repeat();
  }

  void _generateParticles() {
    particles = List.generate(
      widget.numberOfParticles,
      (index) => Particle.random(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final primaryColor = widget.primaryColor ?? theme.colorScheme.primary;
    final secondaryColor = widget.secondaryColor ?? Colors.white;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          // Animated Particles
          ...particles.map((particle) {
            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final progress = _controller.value * 2 * math.pi;

                final dx = size.width * particle.initialPosition.dx +
                    math.sin(progress * particle.speed + particle.offset) * 30;
                final dy = size.height * particle.initialPosition.dy +
                    math.cos(progress * particle.speed + particle.offset) * 30;

                return Positioned(
                  left: dx,
                  top: dy,
                  child: Transform.rotate(
                    angle: progress * particle.rotationSpeed,
                    child: Opacity(
                      opacity: 0.2,
                      child: Icon(
                        widget.icon,
                        size: particle.size,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                );
              },
            );
          }),

          // Main Content
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: secondaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Icon(
                            widget.icon,
                            size: 48,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          widget.title,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: secondaryColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        if (widget.subtitle != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            widget.subtitle!,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: secondaryColor.withOpacity(0.8),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Particle {
  final Offset initialPosition;
  final double size;
  final double speed;
  final double rotationSpeed;
  final double offset;

  Particle({
    required this.initialPosition,
    required this.size,
    required this.speed,
    required this.rotationSpeed,
    required this.offset,
  });

  factory Particle.random() {
    return Particle(
      initialPosition: Offset(
        math.Random().nextDouble(),
        math.Random().nextDouble(),
      ),
      size: math.Random().nextDouble() * 20 + 10, // 10-30
      speed: math.Random().nextDouble() * 0.5 + 0.5, // 0.5-1.0
      rotationSpeed: math.Random().nextDouble() * 0.5, // 0-0.5
      offset: math.Random().nextDouble() * 2 * math.pi, // 0-2π
    );
  }
}

// Pulse Splash Screen
class PulseSplashScreen extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onInit;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final int numberOfRings;

  const PulseSplashScreen({
    super.key,
    required this.title,
    required this.icon,
    this.onInit,
    this.backgroundColor,
    this.foregroundColor,
    this.numberOfRings = 3,
  });

  @override
  State<PulseSplashScreen> createState() => _PulseSplashScreenState();
}

class _PulseSplashScreenState extends State<PulseSplashScreen>
    with TickerProviderStateMixin {
  late List<AnimationController> pulseControllers;
  late List<Animation<double>> pulseAnimations;

  @override
  void initState() {
    super.initState();
    pulseControllers = List.generate(
      widget.numberOfRings,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1500 + (index * 500)),
      ),
    );

    pulseAnimations = pulseControllers.map((controller) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeOut,
        ),
      );
    }).toList();

    for (var controller in pulseControllers) {
      controller.repeat();
    }

    widget.onInit?.call();
  }

  @override
  void dispose() {
    for (var controller in pulseControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = widget.backgroundColor ?? theme.colorScheme.primary;
    final foregroundColor = widget.foregroundColor ?? Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Pulse rings
            ...List.generate(
              widget.numberOfRings,
              (index) => AnimatedBuilder(
                animation: pulseAnimations[index],
                builder: (context, child) {
                  return Transform.scale(
                    scale: 0.5 + (pulseAnimations[index].value * 0.5),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: foregroundColor.withOpacity(
                            (1 - pulseAnimations[index].value) * 0.5,
                          ),
                          width: 2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Icon and text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 64,
                  color: foregroundColor,
                ),
                const SizedBox(height: 24),
                Text(
                  widget.title,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: foregroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
