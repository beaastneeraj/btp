import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

/// Advanced Design System inspired by Figma and Material You 3.0
class FigmaDesignSystem {
  // Brand Colors with Material You 3.0 support
  static const Color primarySeed = Color(0xFF2E7D32);
  static const Color secondarySeed = Color(0xFF1976D2);
  
  // Dynamic Color Schemes
  static Future<ColorScheme> getDynamicColorScheme(BuildContext context) async {
    return await DynamicColorBuilder.build(
      context,
      (lightDynamic, darkDynamic) {
        if (lightDynamic != null) {
          return lightDynamic.harmonized();
        }
        return ColorScheme.fromSeed(
          seedColor: primarySeed,
          brightness: Brightness.light,
        );
      },
    ) ?? ColorScheme.fromSeed(seedColor: primarySeed);
  }

  // Figma-style Corner Radius System
  static const double radiusXS = 4.0;
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 20.0;
  static const double radiusXXL = 24.0;
  static const double radiusRound = 999.0;

  // Spacing System (8pt grid)
  static const double spaceXXS = 2.0;
  static const double spaceXS = 4.0;
  static const double spaceS = 8.0;
  static const double spaceM = 16.0;
  static const double spaceL = 24.0;
  static const double spaceXL = 32.0;
  static const double spaceXXL = 48.0;
  static const double spaceXXXL = 64.0;

  // Typography Scale
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.16,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.22,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.25,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.29,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.33,
  );

  // Shadow System
  static const List<BoxShadow> shadowXS = [
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 1,
      offset: Offset(0, 1),
    ),
  ];

  static const List<BoxShadow> shadowS = [
    BoxShadow(
      color: Color(0x0F000000),
      blurRadius: 3,
      offset: Offset(0, 1),
    ),
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 2,
      offset: Offset(0, 1),
    ),
  ];

  static const List<BoxShadow> shadowM = [
    BoxShadow(
      color: Color(0x0F000000),
      blurRadius: 6,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  static const List<BoxShadow> shadowL = [
    BoxShadow(
      color: Color(0x0F000000),
      blurRadius: 10,
      offset: Offset(0, 8),
    ),
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 6,
      offset: Offset(0, 4),
    ),
  ];

  static const List<BoxShadow> shadowXL = [
    BoxShadow(
      color: Color(0x0F000000),
      blurRadius: 25,
      offset: Offset(0, 20),
    ),
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 10,
      offset: Offset(0, 8),
    ),
  ];

  // Glassmorphism effect
  static BoxDecoration glassmorphism({
    double opacity = 0.1,
    double blur = 10.0,
    double border = 1.0,
    Color? borderColor,
    double radius = radiusM,
  }) {
    return BoxDecoration(
      color: Colors.white.withOpacity(opacity),
      borderRadius: SmoothBorderRadius(
        cornerRadius: radius,
        cornerSmoothing: 1.0,
      ),
      border: Border.all(
        color: borderColor ?? Colors.white.withOpacity(0.2),
        width: border,
      ),
      boxShadow: shadowM,
    );
  }

  // Neumorphism effect
  static BoxDecoration neumorphism({
    Color? color,
    double radius = radiusM,
    bool isPressed = false,
  }) {
    final baseColor = color ?? const Color(0xFFE0E5EC);
    return BoxDecoration(
      color: baseColor,
      borderRadius: SmoothBorderRadius(
        cornerRadius: radius,
        cornerSmoothing: 1.0,
      ),
      boxShadow: isPressed
          ? [
              BoxShadow(
                color: baseColor.withOpacity(0.5),
                blurRadius: 5,
                offset: const Offset(2, 2),
                inset: true,
              ),
            ]
          : [
              BoxShadow(
                color: Colors.white.withOpacity(0.7),
                blurRadius: 10,
                offset: const Offset(-5, -5),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(5, 5),
              ),
            ],
    );
  }
}

/// Advanced animated card component
class FigmaCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;
  final bool enableHoverEffect;
  final bool enablePressEffect;
  final Duration animationDuration;

  const FigmaCard({
    super.key,
    required this.child,
    this.onTap,
    this.width = double.infinity,
    this.height = 200,
    this.padding,
    this.backgroundColor,
    this.borderRadius = FigmaDesignSystem.radiusL,
    this.boxShadow,
    this.enableHoverEffect = true,
    this.enablePressEffect = true,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  @override
  State<FigmaCard> createState() => _FigmaCardState();
}

class _FigmaCardState extends State<FigmaCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    
    _elevationAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (widget.enablePressEffect) {
      setState(() => _isPressed = true);
      _controller.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (widget.enablePressEffect) {
      setState(() => _isPressed = false);
      _controller.reverse();
    }
  }

  void _handleTapCancel() {
    if (widget.enablePressEffect) {
      setState(() => _isPressed = false);
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (widget.enableHoverEffect) {
          setState(() => _isHovered = true);
        }
      },
      onExit: (_) {
        if (widget.enableHoverEffect) {
          setState(() => _isHovered = false);
        }
      },
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _isPressed ? _scaleAnimation.value : 1.0,
              child: AnimatedContainer(
                duration: widget.animationDuration,
                width: widget.width,
                height: widget.height,
                padding: widget.padding ?? const EdgeInsets.all(FigmaDesignSystem.spaceM),
                decoration: ShapeDecoration(
                  color: widget.backgroundColor ?? Theme.of(context).colorScheme.surface,
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: widget.borderRadius,
                      cornerSmoothing: 1.0,
                    ),
                  ),
                  shadows: _isHovered 
                      ? FigmaDesignSystem.shadowL.map((shadow) => 
                          shadow.copyWith(
                            blurRadius: shadow.blurRadius * _elevationAnimation.value,
                          )).toList()
                      : widget.boxShadow ?? FigmaDesignSystem.shadowM,
                ),
                child: widget.child,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Advanced button with Figma-style animations
class FigmaButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final IconData? icon;
  final bool loading;
  final bool disabled;

  const FigmaButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.icon,
    this.loading = false,
    this.disabled = false,
  });

  @override
  State<FigmaButton> createState() => _FigmaButtonState();
}

class _FigmaButtonState extends State<FigmaButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.96,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    // Button styling based on variant
    Color backgroundColor;
    Color foregroundColor;
    double elevation;
    
    switch (widget.variant) {
      case ButtonVariant.primary:
        backgroundColor = colorScheme.primary;
        foregroundColor = colorScheme.onPrimary;
        elevation = 2.0;
        break;
      case ButtonVariant.secondary:
        backgroundColor = colorScheme.secondary;
        foregroundColor = colorScheme.onSecondary;
        elevation = 1.0;
        break;
      case ButtonVariant.outlined:
        backgroundColor = Colors.transparent;
        foregroundColor = colorScheme.primary;
        elevation = 0.0;
        break;
      case ButtonVariant.ghost:
        backgroundColor = Colors.transparent;
        foregroundColor = colorScheme.onSurface;
        elevation = 0.0;
        break;
    }

    // Button sizing
    EdgeInsets padding;
    double fontSize;
    double height;
    
    switch (widget.size) {
      case ButtonSize.small:
        padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
        fontSize = 14;
        height = 36;
        break;
      case ButtonSize.medium:
        padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
        fontSize = 16;
        height = 48;
        break;
      case ButtonSize.large:
        padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
        fontSize = 18;
        height = 56;
        break;
    }

    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        _controller.forward();
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        _controller.reverse();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
        _controller.reverse();
      },
      onTap: widget.disabled || widget.loading ? null : widget.onPressed,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _isPressed ? _scaleAnimation.value : 1.0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: height,
              padding: padding,
              decoration: ShapeDecoration(
                color: widget.disabled 
                    ? colorScheme.outline.withOpacity(0.12)
                    : backgroundColor,
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: FigmaDesignSystem.radiusM,
                    cornerSmoothing: 1.0,
                  ),
                  side: widget.variant == ButtonVariant.outlined
                      ? BorderSide(color: colorScheme.outline)
                      : BorderSide.none,
                ),
                shadows: elevation > 0 ? FigmaDesignSystem.shadowS : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.loading)
                    SizedBox(
                      width: fontSize,
                      height: fontSize,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
                      ),
                    )
                  else if (widget.icon != null) ...[
                    Icon(
                      widget.icon,
                      size: fontSize,
                      color: widget.disabled 
                          ? colorScheme.onSurface.withOpacity(0.38)
                          : foregroundColor,
                    ),
                    const SizedBox(width: FigmaDesignSystem.spaceXS),
                  ],
                  Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                      color: widget.disabled 
                          ? colorScheme.onSurface.withOpacity(0.38)
                          : foregroundColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

enum ButtonVariant { primary, secondary, outlined, ghost }
enum ButtonSize { small, medium, large }

/// Advanced input field with Figma-style design
class FigmaTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? value;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final String? errorText;
  final bool disabled;

  const FigmaTextField({
    super.key,
    this.label,
    this.hint,
    this.value,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.errorText,
    this.disabled = false,
  });

  @override
  State<FigmaTextField> createState() => _FigmaTextFieldState();
}

class _FigmaTextFieldState extends State<FigmaTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _borderColorAnimation;
  late TextEditingController _textController;
  
  bool _isFocused = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _textController = TextEditingController(text: widget.value);
    _hasError = widget.errorText != null;
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: theme.textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.87),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: FigmaDesignSystem.spaceXS),
        ],
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              decoration: ShapeDecoration(
                color: widget.disabled 
                    ? colorScheme.outline.withOpacity(0.04)
                    : colorScheme.surface,
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: FigmaDesignSystem.radiusM,
                    cornerSmoothing: 1.0,
                  ),
                  side: BorderSide(
                    color: _hasError
                        ? colorScheme.error
                        : _isFocused
                            ? colorScheme.primary
                            : colorScheme.outline.withOpacity(0.38),
                    width: _isFocused ? 2.0 : 1.0,
                  ),
                ),
                shadows: _isFocused ? FigmaDesignSystem.shadowS : null,
              ),
              child: TextFormField(
                controller: _textController,
                onChanged: widget.onChanged,
                keyboardType: widget.keyboardType,
                obscureText: widget.obscureText,
                enabled: !widget.disabled,
                onFocusChange: (focused) {
                  setState(() => _isFocused = focused);
                  if (focused) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                },
                decoration: InputDecoration(
                  hintText: widget.hint,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(FigmaDesignSystem.spaceM),
                  prefixIcon: widget.prefixIcon != null
                      ? Icon(widget.prefixIcon)
                      : null,
                  suffixIcon: widget.suffixIcon != null
                      ? IconButton(
                          icon: Icon(widget.suffixIcon),
                          onPressed: widget.onSuffixIconTap,
                        )
                      : null,
                ),
              ),
            );
          },
        ),
        if (widget.errorText != null) ...[
          const SizedBox(height: FigmaDesignSystem.spaceXS),
          Text(
            widget.errorText!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.error,
            ),
          ).animate().fadeIn(duration: 200.ms).slideY(begin: -0.2),
        ],
      ],
    );
  }
}
