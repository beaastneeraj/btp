import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Shared Animation and Theming Utilities for Uniform Design
class AppAnimations {
  static const Duration standardDuration = Duration(milliseconds: 1500);
  static const Duration cardDuration = Duration(milliseconds: 2000);
  static const Duration floatingDuration = Duration(milliseconds: 3000);
  
  static const Curve primaryCurve = Curves.easeOutCubic;
  static const Curve elasticCurve = Curves.elasticOut;
  static const Curve bouncyCurve = Curves.bounceOut;
}

class AppThemeStyles {
  static TextStyle getHeaderTitle(ColorScheme colorScheme) {
    return GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 26,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getHeaderSubtitle(ColorScheme colorScheme) {
    return GoogleFonts.roboto(
      color: Colors.white.withOpacity(0.9),
      fontSize: 14,
    );
  }

  static TextStyle getAppBarTitle(ColorScheme colorScheme) {
    return GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle getCardTitle(ColorScheme colorScheme) {
    return GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    );
  }

  static TextStyle getCardSubtitle(ColorScheme colorScheme) {
    return GoogleFonts.roboto(
      fontSize: 12,
      color: colorScheme.onSurface.withOpacity(0.7),
    );
  }

  static TextStyle getSectionTitle(ColorScheme colorScheme) {
    return GoogleFonts.roboto(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    );
  }
}

mixin AppAnimationMixin<T extends StatefulWidget> on State<T>, TickerProviderStateMixin<T> {
  late AnimationController headerAnimationController;
  late AnimationController cardAnimationController;
  late AnimationController floatingAnimationController;
  
  late Animation<double> headerSlideAnimation;
  late Animation<double> headerFadeAnimation;
  late Animation<double> cardStaggerAnimation;
  late Animation<double> floatingAnimation;

  void setupStandardAnimations() {
    headerAnimationController = AnimationController(
      duration: AppAnimations.standardDuration,
      vsync: this,
    );
    
    cardAnimationController = AnimationController(
      duration: AppAnimations.cardDuration,
      vsync: this,
    );
    
    floatingAnimationController = AnimationController(
      duration: AppAnimations.floatingDuration,
      vsync: this,
    )..repeat(reverse: true);

    headerSlideAnimation = Tween<double>(
      begin: -50,
      end: 0,
    ).animate(CurvedAnimation(
      parent: headerAnimationController,
      curve: const Interval(0.0, 0.6, curve: AppAnimations.primaryCurve),
    ));

    headerFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: headerAnimationController,
      curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
    ));

    cardStaggerAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: cardAnimationController,
      curve: AppAnimations.primaryCurve,
    ));

    floatingAnimation = Tween<double>(
      begin: 0,
      end: 5,
    ).animate(floatingAnimationController);
  }

  void startStandardAnimations() {
    headerAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      cardAnimationController.forward();
    });
  }

  void disposeStandardAnimations() {
    headerAnimationController.dispose();
    cardAnimationController.dispose();
    floatingAnimationController.dispose();
  }
}

class StandardAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Widget> statusChips;
  final List<Widget>? actions;
  final Animation<double> slideAnimation;
  final Animation<double> fadeAnimation;
  final ColorScheme colorScheme;

  const StandardAppBar({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.statusChips,
    required this.slideAnimation,
    required this.fadeAnimation,
    required this.colorScheme,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 160,
      floating: false,
      pinned: true,
      backgroundColor: colorScheme.primary,
      flexibleSpace: FlexibleSpaceBar(
        title: AnimatedBuilder(
          animation: fadeAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: fadeAnimation.value,
              child: Row(
                children: [
                  Icon(icon, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    title,
                    style: AppThemeStyles.getAppBarTitle(colorScheme),
                  ),
                ],
              ),
            );
          },
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primary,
                colorScheme.primaryContainer,
              ],
            ),
          ),
          child: AnimatedBuilder(
            animation: slideAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, slideAnimation.value),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                icon,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: AppThemeStyles.getHeaderTitle(colorScheme),
                                  ),
                                  Text(
                                    subtitle,
                                    style: AppThemeStyles.getHeaderSubtitle(colorScheme),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          children: statusChips,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      actions: actions,
    );
  }
}

class StandardStatusChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const StandardStatusChip({
    Key? key,
    required this.label,
    required this.icon,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 14),
            SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedCard extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final int delay;

  const AnimatedCard({
    Key? key,
    required this.child,
    required this.animation,
    this.delay = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 500 + (delay * 100)),
      tween: Tween(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: this.child,
          ),
        );
      },
    );
  }
}

class StandardFloatingActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Animation<double> animation;
  final ColorScheme colorScheme;

  const StandardFloatingActionButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.animation,
    required this.colorScheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: FloatingActionButton.extended(
            onPressed: onPressed,
            icon: Icon(icon),
            label: Text(label),
            backgroundColor: colorScheme.primary,
            foregroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
