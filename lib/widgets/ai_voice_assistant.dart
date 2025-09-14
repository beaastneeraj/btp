import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:lottie/lottie.dart';
import '../design_system/figma_components.dart';

/// Modern AI Voice Assistant with advanced animations and ML integration
class AIVoiceAssistant extends ConsumerStatefulWidget {
  const AIVoiceAssistant({super.key});

  @override
  ConsumerState<AIVoiceAssistant> createState() => _AIVoiceAssistantState();
}

class _AIVoiceAssistantState extends ConsumerState<AIVoiceAssistant>
    with TickerProviderStateMixin {
  late SpeechToText _speechToText;
  late FlutterTts _flutterTts;
  late AnimationController _pulseController;
  late AnimationController _waveController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _waveAnimation;

  bool _speechEnabled = false;
  bool _isListening = false;
  bool _isSpeaking = false;
  String _lastWords = '';
  String _currentResponse = '';
  List<AIMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _initSpeech();
    _initTts();
    _initAnimations();
  }

  void _initAnimations() {
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _waveController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.3,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _waveAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _waveController,
      curve: Curves.easeInOut,
    ));
  }

  Future<void> _initSpeech() async {
    _speechToText = SpeechToText();
    _speechEnabled = await _speechToText.initialize(
      onStatus: _onSpeechStatus,
      onError: _onSpeechError,
    );
    setState(() {});
  }

  Future<void> _initTts() async {
    _flutterTts = FlutterTts();
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(0.5);
    
    _flutterTts.setStartHandler(() {
      setState(() => _isSpeaking = true);
    });
    
    _flutterTts.setCompletionHandler(() {
      setState(() => _isSpeaking = false);
    });
  }

  void _onSpeechStatus(String status) {
    if (status == 'done' || status == 'notListening') {
      setState(() => _isListening = false);
      _pulseController.stop();
      if (_lastWords.isNotEmpty) {
        _processVoiceCommand(_lastWords);
      }
    }
  }

  void _onSpeechError(dynamic error) {
    setState(() => _isListening = false);
    _pulseController.stop();
  }

  Future<void> _startListening() async {
    if (!_speechEnabled) return;
    
    setState(() {
      _isListening = true;
      _lastWords = '';
    });
    
    _pulseController.repeat(reverse: true);
    
    await _speechToText.listen(
      onResult: (result) {
        setState(() => _lastWords = result.recognizedWords);
      },
      listenFor: const Duration(seconds: 30),
      pauseFor: const Duration(seconds: 3),
    );
  }

  Future<void> _stopListening() async {
    await _speechToText.stop();
    setState(() => _isListening = false);
    _pulseController.stop();
  }

  Future<void> _processVoiceCommand(String command) async {
    final message = AIMessage(
      text: command,
      isUser: true,
      timestamp: DateTime.now(),
    );
    
    setState(() {
      _messages.add(message);
      _currentResponse = '';
    });

    // Simulate AI processing with various responses
    await Future.delayed(const Duration(milliseconds: 800));
    
    String response = _generateAIResponse(command.toLowerCase());
    
    final aiMessage = AIMessage(
      text: response,
      isUser: false,
      timestamp: DateTime.now(),
    );
    
    setState(() {
      _messages.add(aiMessage);
      _currentResponse = response;
    });

    // Speak the response
    await _speak(response);
  }

  String _generateAIResponse(String command) {
    if (command.contains('weather')) {
      return "The current weather is 24°C with 65% humidity. Perfect conditions for your crops! UV index is 6.2, so your plants are getting good sunlight.";
    } else if (command.contains('crop') || command.contains('plant')) {
      return "Your crops are looking excellent! Section A tomatoes have a 95% health score. I recommend maintaining the current irrigation schedule.";
    } else if (command.contains('water') || command.contains('irrigation')) {
      return "Based on soil moisture data, your tomato section needs watering in 2 hours. I'll send you a reminder and can automate the irrigation if you'd like.";
    } else if (command.contains('disease') || command.contains('problem')) {
      return "I've analyzed your crop images and detected no major diseases. There's a minor fungal risk in the wheat section - I recommend applying organic fungicide.";
    } else if (command.contains('harvest')) {
      return "Your tomatoes will be ready for harvest in 7-10 days based on growth analysis. I'll track the progress and notify you at optimal harvest time.";
    } else if (command.contains('fertilizer')) {
      return "Your soil analysis shows good nitrogen levels. I recommend applying phosphorus-rich organic fertilizer to Section B next week for optimal yield.";
    } else {
      return "I'm here to help with your farm! You can ask me about weather, crop health, irrigation schedules, diseases, or harvest timing. What would you like to know?";
    }
  }

  Future<void> _speak(String text) async {
    if (_isSpeaking) {
      await _flutterTts.stop();
    }
    await _flutterTts.speak(text);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _waveController.dispose();
    _speechToText.cancel();
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: FigmaDesignSystem.glassmorphism(
        opacity: 0.95,
        blur: 20,
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(FigmaDesignSystem.spaceL),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(FigmaDesignSystem.spaceS),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(FigmaDesignSystem.radiusS),
                  ),
                  child: Icon(
                    LucideIcons.brain,
                    color: colorScheme.onPrimary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: FigmaDesignSystem.spaceM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AI Farm Assistant',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _isSpeaking 
                            ? 'Speaking...'
                            : _isListening 
                                ? 'Listening...'
                                : 'Ready to help',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                if (_isSpeaking)
                  Container(
                    width: 40,
                    height: 40,
                    child: Lottie.asset(
                      'assets/animations/speaking.json',
                      fit: BoxFit.cover,
                    ),
                  ).animate()
                    .fadeIn(duration: 300.ms)
                    .scale(),
              ],
            ),
          ),

          // Messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: FigmaDesignSystem.spaceL),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(message, index);
              },
            ),
          ),

          // Voice visualization
          Container(
            height: 120,
            padding: const EdgeInsets.all(FigmaDesignSystem.spaceL),
            child: Center(
              child: _isListening
                  ? _buildVoiceWaveform()
                  : _buildVoiceButton(),
            ),
          ),

          // Quick suggestions
          if (!_isListening && !_isSpeaking)
            Container(
              height: 60,
              padding: const EdgeInsets.only(
                left: FigmaDesignSystem.spaceL,
                right: FigmaDesignSystem.spaceL,
                bottom: FigmaDesignSystem.spaceL,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildSuggestionChip('Check weather'),
                  _buildSuggestionChip('Crop health'),
                  _buildSuggestionChip('Irrigation status'),
                  _buildSuggestionChip('Harvest time'),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(AIMessage message, int index) {
    final isUser = message.isUser;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: FigmaDesignSystem.spaceM),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            Container(
              padding: const EdgeInsets.all(FigmaDesignSystem.spaceXS),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(FigmaDesignSystem.radiusS),
              ),
              child: Icon(
                LucideIcons.bot,
                color: colorScheme.onPrimary,
                size: 16,
              ),
            ),
            const SizedBox(width: FigmaDesignSystem.spaceS),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(FigmaDesignSystem.spaceM),
              decoration: ShapeDecoration(
                color: isUser 
                    ? colorScheme.primary 
                    : colorScheme.surfaceVariant,
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: FigmaDesignSystem.radiusM,
                    cornerSmoothing: 1.0,
                  ),
                ),
              ),
              child: Text(
                message.text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isUser 
                      ? colorScheme.onPrimary 
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ).animate()
              .fadeIn(duration: 300.ms, delay: (index * 100).ms)
              .slideY(begin: 0.3),
          ),
          if (isUser) ...[
            const SizedBox(width: FigmaDesignSystem.spaceS),
            Container(
              padding: const EdgeInsets.all(FigmaDesignSystem.spaceXS),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(FigmaDesignSystem.radiusS),
              ),
              child: Icon(
                LucideIcons.user,
                color: colorScheme.onPrimary,
                size: 16,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildVoiceButton() {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: _speechEnabled ? _startListening : null,
      child: AnimatedBuilder(
        animation: _pulseAnimation,
        builder: (context, child) {
          return Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primary,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Icon(
              LucideIcons.mic,
              color: colorScheme.onPrimary,
              size: 32,
            ),
          );
        },
      ),
    ).animate()
      .scale(duration: 300.ms)
      .then()
      .shimmer(duration: 2000.ms, delay: 1000.ms);
  }

  Widget _buildVoiceWaveform() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return AnimatedBuilder(
          animation: _waveController,
          builder: (context, child) {
            return Container(
              width: 4,
              height: 20 + (30 * (_waveAnimation.value + (index * 0.2)) % 1),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            );
          },
        );
      }),
    ).animate(onPlay: (controller) {
      controller.repeat();
      _waveController.repeat();
    })
      .fadeIn(duration: 300.ms);
  }

  Widget _buildSuggestionChip(String text) {
    return Container(
      margin: const EdgeInsets.only(right: FigmaDesignSystem.spaceS),
      child: FigmaButton(
        text: text,
        variant: ButtonVariant.outlined,
        size: ButtonSize.small,
        onPressed: () => _processVoiceCommand(text),
      ),
    );
  }
}

class AIMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  AIMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}

/// Floating AI Assistant Button
class FloatingAIAssistant extends StatefulWidget {
  const FloatingAIAssistant({super.key});

  @override
  State<FloatingAIAssistant> createState() => _FloatingAIAssistantState();
}

class _FloatingAIAssistantState extends State<FloatingAIAssistant>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
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

  void _toggleAssistant() {
    setState(() => _isExpanded = !_isExpanded);
    if (_isExpanded) {
      _showAIAssistant();
    }
  }

  void _showAIAssistant() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AIVoiceAssistant(),
    ).then((_) {
      setState(() => _isExpanded = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: FloatingActionButton(
            onPressed: _toggleAssistant,
            backgroundColor: colorScheme.secondary,
            foregroundColor: colorScheme.onSecondary,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                _isExpanded ? LucideIcons.x : LucideIcons.brain,
                key: ValueKey(_isExpanded),
              ),
            ),
          ),
        );
      },
    ).animate()
      .scale(delay: 1000.ms, duration: 300.ms)
      .then()
      .shimmer(duration: 2000.ms, delay: 2000.ms);
  }
}
