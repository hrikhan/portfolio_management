import 'package:flutter/material.dart';

class AnimatedAvatar extends StatefulWidget {
  final double size;
  final List<Color> gradientColors;
  final IconData icon;
  final Duration animationDuration;
  final Duration delay;
  final String? assetImagePath;

  const AnimatedAvatar({
    super.key,
    required this.size,
    required this.gradientColors,
    this.icon = Icons.person,
    this.animationDuration = const Duration(milliseconds: 800),
    this.delay = Duration.zero,
    this.assetImagePath,
  });

  @override
  State<AnimatedAvatar> createState() => _AnimatedAvatarState();
}

class _AnimatedAvatarState extends State<AnimatedAvatar>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _rotationController;
  late AnimationController _pulseController;
  
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    
    // Scale animation controller
    _scaleController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    
    // Rotation animation controller
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    // Pulse animation controller
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Scale animation with bounce effect
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    // Rotation animation
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.easeInOut,
    ));

    // Pulse animation for subtle breathing effect
    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    // Opacity animation
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
    ));

    // Start animations with delay
    Future.delayed(widget.delay, () {
      if (mounted) {
        _scaleController.forward();
        _rotationController.forward();
        
        // Start pulse animation after initial animation completes
        Future.delayed(widget.animationDuration, () {
          if (mounted) {
            _pulseController.repeat(reverse: true);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _scaleAnimation,
        _rotationAnimation,
        _pulseAnimation,
        _opacityAnimation,
      ]),
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value * _pulseAnimation.value,
          child: Transform.rotate(
            angle: _rotationAnimation.value * 0.1, // Subtle rotation
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: widget.gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: widget.gradientColors.first.withOpacity(0.4),
                      blurRadius: 15 * _scaleAnimation.value,
                      offset: Offset(0, 5 * _scaleAnimation.value),
                    ),
                  ],
                ),
                child: widget.assetImagePath != null
                    ? ClipOval(
                        child: Image.asset(
                          widget.assetImagePath!,
                          width: widget.size,
                          height: widget.size,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              widget.icon,
                              size: widget.size * 0.5,
                              color: Colors.white,
                            );
                          },
                        ),
                      )
                    : Icon(
                        widget.icon,
                        size: widget.size * 0.5,
                        color: Colors.white,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AnimatedProfileCard extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration animationDuration;

  const AnimatedProfileCard({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.animationDuration = const Duration(milliseconds: 600),
  });

  @override
  State<AnimatedProfileCard> createState() => _AnimatedProfileCardState();
}

class _AnimatedProfileCardState extends State<AnimatedProfileCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    // Start animation with delay
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _slideAnimation.value),
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
