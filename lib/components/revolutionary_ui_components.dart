import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Revolutionary UI Components Library for Smart Agriculture
/// Features neumorphic design, advanced animations, and haptic feedback

class NeumorphicContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final Color backgroundColor;
  final bool isPressed;
  final VoidCallback? onTap;
  final double intensity;

  const NeumorphicContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius = 16,
    this.backgroundColor = const Color(0xFFE0E5EC),
    this.isPressed = false,
    this.onTap,
    this.intensity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: InkWell(
        onTap: onTap != null ? () {
          HapticFeedback.lightImpact();
          onTap!();
        } : null,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: isPressed ? _getInsetShadows() : _getOutsetShadows(),
          ),
          child: child,
        ),
      ),
    );
  }

  List<BoxShadow> _getOutsetShadows() {
    return [
      BoxShadow(
        color: Color(0xFFFFFFFF).withOpacity(0.7 * intensity),
        offset: Offset(-6, -6),
        blurRadius: 12,
        spreadRadius: 2,
      ),
      BoxShadow(
        color: Color(0xFFBEC8D1).withOpacity(0.4 * intensity),
        offset: Offset(6, 6),
        blurRadius: 12,
        spreadRadius: 2,
      ),
    ];
  }

  List<BoxShadow> _getInsetShadows() {
    return [
      BoxShadow(
        color: Color(0xFFBEC8D1).withOpacity(0.3 * intensity),
        offset: Offset(-3, -3),
        blurRadius: 6,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: Color(0xFFFFFFFF).withOpacity(0.5 * intensity),
        offset: Offset(3, 3),
        blurRadius: 6,
        spreadRadius: 1,
      ),
    ];
  }
}

class GlassmorphicCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final double opacity;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const GlassmorphicCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.borderRadius = 16,
    this.opacity = 0.15,
    this.backgroundColor = Colors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: InkWell(
        onTap: onTap != null ? () {
          HapticFeedback.lightImpact();
          onTap!();
        } : null,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                backgroundColor.withOpacity(opacity),
                backgroundColor.withOpacity(opacity * 0.5),
              ],
            ),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: backgroundColor.withOpacity(0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: -5,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class Parallax3DCard extends StatefulWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double perspective;
  final double maxRotation;
  final VoidCallback? onTap;

  const Parallax3DCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.perspective = 0.001,
    this.maxRotation = 0.1,
    this.onTap,
  });

  @override
  _Parallax3DCardState createState() => _Parallax3DCardState();
}

class _Parallax3DCardState extends State<Parallax3DCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _rotationX = 0;
  double _rotationY = 0;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onEnter(),
      onExit: (_) => _onExit(),
      onHover: (event) => _onHover(event),
      child: GestureDetector(
        onPanUpdate: (details) => _onPanUpdate(details),
        onPanEnd: (_) => _resetRotation(),
        onTap: widget.onTap != null ? () {
          HapticFeedback.mediumImpact();
          widget.onTap!();
        } : null,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, widget.perspective)
                ..rotateX(_rotationX)
                ..rotateY(_rotationY),
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: _isHovering ? 30 : 15,
                      spreadRadius: _isHovering ? -5 : -10,
                      offset: Offset(0, _isHovering ? 15 : 10),
                    ),
                  ],
                ),
                child: widget.child,
              ),
            );
          },
        ),
      ),
    );
  }

  void _onEnter() {
    setState(() {
      _isHovering = true;
    });
    _controller.forward();
  }

  void _onExit() {
    setState(() {
      _isHovering = false;
    });
    _controller.reverse();
    _resetRotation();
  }

  void _onHover(PointerHoverEvent event) {
    final size = context.size;
    if (size != null) {
      final centerX = size.width / 2;
      final centerY = size.height / 2;
      
      final deltaX = (event.localPosition.dx - centerX) / centerX;
      final deltaY = (event.localPosition.dy - centerY) / centerY;
      
      setState(() {
        _rotationY = deltaX * widget.maxRotation;
        _rotationX = -deltaY * widget.maxRotation;
      });
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final deltaX = details.delta.dx;
    final deltaY = details.delta.dy;
    
    setState(() {
      _rotationY += deltaX * 0.01;
      _rotationX -= deltaY * 0.01;
    });
  }

  void _resetRotation() {
    setState(() {
      _rotationX = 0;
      _rotationY = 0;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedCounterCard extends StatefulWidget {
  final String title;
  final double value;
  final String unit;
  final IconData icon;
  final Color color;
  final Duration animationDuration;
  final VoidCallback? onTap;

  const AnimatedCounterCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.color,
    this.animationDuration = const Duration(milliseconds: 2000),
    this.onTap,
  });

  @override
  _AnimatedCounterCardState createState() => _AnimatedCounterCardState();
}

class _AnimatedCounterCardState extends State<AnimatedCounterCard>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _countAnimation;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    
    _countAnimation = Tween<double>(
      begin: 0,
      end: widget.value,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _pulseController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _pulseAnimation.value,
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        widget.color.withOpacity(0.3),
                        widget.color.withOpacity(0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    widget.icon,
                    color: widget.color,
                    size: 32,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16),
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          AnimatedBuilder(
            animation: _countAnimation,
            builder: (context, child) {
              return RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: _countAnimation.value.toStringAsFixed(1),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' ${widget.unit}',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }
}

class LiquidProgressIndicator extends StatefulWidget {
  final double value;
  final Color backgroundColor;
  final Color valueColor;
  final double height;
  final double borderRadius;
  final String? label;

  const LiquidProgressIndicator({
    super.key,
    required this.value,
    this.backgroundColor = const Color(0xFF2A2A2A),
    this.valueColor = Colors.blue,
    this.height = 8,
    this.borderRadius = 4,
    this.label,
  });

  @override
  _LiquidProgressIndicatorState createState() => _LiquidProgressIndicatorState();
}

class _LiquidProgressIndicatorState extends State<LiquidProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController _waveController;
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    
    _waveController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _progressController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _progressAnimation = Tween<double>(
      begin: 0,
      end: widget.value.clamp(0.0, 1.0),
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeOutCubic,
    ));

    _progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
        ],
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: AnimatedBuilder(
            animation: _progressAnimation,
            builder: (context, child) {
              return CustomPaint(
                painter: LiquidPainter(
                  progress: _progressAnimation.value,
                  waveAnimation: _waveController.value,
                  color: widget.valueColor,
                  borderRadius: widget.borderRadius,
                ),
                size: Size(double.infinity, widget.height),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _waveController.dispose();
    _progressController.dispose();
    super.dispose();
  }
}

class LiquidPainter extends CustomPainter {
  final double progress;
  final double waveAnimation;
  final Color color;
  final double borderRadius;

  LiquidPainter({
    required this.progress,
    required this.waveAnimation,
    required this.color,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    final waveHeight = size.height * 0.1;
    final progressWidth = size.width * progress;

    // Create wave path
    for (double x = 0; x <= progressWidth; x++) {
      final waveY = math.sin((x / size.width * 4 * math.pi) + (waveAnimation * 2 * math.pi)) * waveHeight;
      final y = size.height * 0.5 + waveY;

      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.lineTo(progressWidth, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Clip to rounded rectangle
    final clipPath = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(borderRadius),
      ));

    canvas.clipPath(clipPath);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PulsingButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color color;
  final double size;
  final Duration pulseDuration;

  const PulsingButton({
    super.key,
    required this.child,
    this.onPressed,
    this.color = Colors.blue,
    this.size = 60,
    this.pulseDuration = const Duration(seconds: 2),
  });

  @override
  _PulsingButtonState createState() => _PulsingButtonState();
}

class _PulsingButtonState extends State<PulsingButton>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _scaleController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _pulseController = AnimationController(
      duration: widget.pulseDuration,
      vsync: this,
    )..repeat();

    _scaleController = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.3,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _scaleController.forward(),
      onTapUp: (_) => _scaleController.reverse(),
      onTapCancel: () => _scaleController.reverse(),
      onTap: widget.onPressed != null ? () {
        HapticFeedback.mediumImpact();
        widget.onPressed!();
      } : null,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Pulse effect
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Container(
                      width: widget.size * _pulseAnimation.value,
                      height: widget.size * _pulseAnimation.value,
                      decoration: BoxDecoration(
                        color: widget.color.withOpacity(
                          (1 - _pulseController.value) * 0.3,
                        ),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
                // Main button
                Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        widget.color.withOpacity(0.8),
                        widget.color,
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: widget.color.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: -5,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(child: widget.child),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _scaleController.dispose();
    super.dispose();
  }
}

class BreathingCard extends StatefulWidget {
  final Widget child;
  final Duration breathingDuration;
  final double minScale;
  final double maxScale;

  const BreathingCard({
    super.key,
    required this.child,
    this.breathingDuration = const Duration(seconds: 4),
    this.minScale = 0.98,
    this.maxScale = 1.02,
  });

  @override
  _BreathingCardState createState() => _BreathingCardState();
}

class _BreathingCardState extends State<BreathingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.breathingDuration,
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: widget.minScale,
      end: widget.maxScale,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class GradientBorderContainer extends StatelessWidget {
  final Widget child;
  final List<Color> gradientColors;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const GradientBorderContainer({
    super.key,
    required this.child,
    required this.gradientColors,
    this.borderWidth = 2,
    this.borderRadius = 16,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () {
        HapticFeedback.lightImpact();
        onTap!();
      } : null,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColors),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Container(
          margin: EdgeInsets.all(borderWidth),
          padding: padding,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(borderRadius - borderWidth),
          ),
          child: child,
        ),
      ),
    );
  }
}

class ParticleField extends StatefulWidget {
  final int particleCount;
  final Color particleColor;
  final double maxParticleSize;
  final double minParticleSize;
  final Duration animationDuration;

  const ParticleField({
    super.key,
    this.particleCount = 50,
    this.particleColor = Colors.white,
    this.maxParticleSize = 4,
    this.minParticleSize = 1,
    this.animationDuration = const Duration(seconds: 10),
  });

  @override
  _ParticleFieldState createState() => _ParticleFieldState();
}

class _ParticleFieldState extends State<ParticleField>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> _particles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    )..repeat();

    _particles = List.generate(widget.particleCount, (index) {
      return Particle(
        x: math.Random().nextDouble(),
        y: math.Random().nextDouble(),
        size: widget.minParticleSize + 
              math.Random().nextDouble() * (widget.maxParticleSize - widget.minParticleSize),
        velocity: Offset(
          (math.Random().nextDouble() - 0.5) * 0.1,
          (math.Random().nextDouble() - 0.5) * 0.1,
        ),
        opacity: 0.3 + math.Random().nextDouble() * 0.7,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: ParticlePainter(
            particles: _particles,
            animationValue: _controller.value,
            color: widget.particleColor,
          ),
          size: Size.infinite,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Particle {
  double x;
  double y;
  final double size;
  final Offset velocity;
  final double opacity;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.velocity,
    required this.opacity,
  });
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animationValue;
  final Color color;

  ParticlePainter({
    required this.particles,
    required this.animationValue,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    for (final particle in particles) {
      // Update particle position
      particle.x += particle.velocity.dx;
      particle.y += particle.velocity.dy;

      // Wrap around edges
      if (particle.x < 0) particle.x = 1;
      if (particle.x > 1) particle.x = 0;
      if (particle.y < 0) particle.y = 1;
      if (particle.y > 1) particle.y = 0;

      // Draw particle
      paint.color = color.withOpacity(particle.opacity);
      canvas.drawCircle(
        Offset(
          particle.x * size.width,
          particle.y * size.height,
        ),
        particle.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class WaveformVisualizer extends StatefulWidget {
  final List<double> data;
  final Color waveColor;
  final double height;
  final Duration animationDuration;

  const WaveformVisualizer({
    super.key,
    required this.data,
    this.waveColor = Colors.blue,
    this.height = 100,
    this.animationDuration = const Duration(milliseconds: 500),
  });

  @override
  _WaveformVisualizerState createState() => _WaveformVisualizerState();
}

class _WaveformVisualizerState extends State<WaveformVisualizer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: WaveformPainter(
            data: widget.data,
            color: widget.waveColor,
            animationValue: _controller.value,
          ),
          size: Size(double.infinity, widget.height),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class WaveformPainter extends CustomPainter {
  final List<double> data;
  final Color color;
  final double animationValue;

  WaveformPainter({
    required this.data,
    required this.color,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final stepWidth = size.width / (data.length - 1);
    final visibleData = (data.length * animationValue).floor();

    for (int i = 0; i < visibleData; i++) {
      final x = i * stepWidth;
      final y = size.height * (1 - data[i]);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);

    // Draw glow effect
    paint
      ..strokeWidth = 6
      ..color = color.withOpacity(0.3)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// Utility class for creating revolutionary animations
class RevolutionaryAnimations {
  static Animation<double> createElasticAnimation(
    AnimationController controller, {
    double amplitude = 1.0,
    double period = 0.4,
  }) {
    return Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: ElasticInCurve(period),
      ),
    );
  }

  static Animation<Offset> createSlideAnimation(
    AnimationController controller, {
    Offset begin = const Offset(0, 1),
    Offset end = Offset.zero,
    Curve curve = Curves.easeOutCubic,
  }) {
    return Tween<Offset>(begin: begin, end: end).animate(
      CurvedAnimation(parent: controller, curve: curve),
    );
  }

  static Animation<double> createBounceAnimation(
    AnimationController controller, {
    double begin = 0,
    double end = 1,
  }) {
    return Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.bounceOut,
      ),
    );
  }

  static Animation<Matrix4> create3DRotationAnimation(
    AnimationController controller, {
    double rotationX = 0,
    double rotationY = 0,
    double rotationZ = 0,
  }) {
    return Matrix4Tween(
      begin: Matrix4.identity(),
      end: Matrix4.identity()
        ..rotateX(rotationX)
        ..rotateY(rotationY)
        ..rotateZ(rotationZ),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));
  }
}

/// Theme extensions for revolutionary UI
extension RevolutionaryColors on ColorScheme {
  Color get neumorphicLight => const Color(0xFFFFFFFF);
  Color get neumorphicDark => const Color(0xFFBEC8D1);
  Color get glassmorphicOverlay => Colors.white.withOpacity(0.15);
  Color get neonAccent => const Color(0xFF00E5FF);
  Color get holographicPrimary => const Color(0xFF8A2BE2);
  Color get holographicSecondary => const Color(0xFF00CED1);
}
