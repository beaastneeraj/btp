import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'simple_dashboard.dart';

class AuthenticationScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  bool _isLogin = true;
  bool _isLoading = false;
  bool _obscurePassword = true;
  
  late AnimationController _slideController;
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    
    _slideController.forward();
    _fadeController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _slideController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary.withAlpha(50),
              colorScheme.secondary.withAlpha(30),
              colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Section
                  _buildLogo(colorScheme),
                  SizedBox(height: 48),
                  
                  // Auth Form Card
                  _buildAuthCard(theme, colorScheme),
                  SizedBox(height: 24),
                  
                  // Guest Mode Button
                  _buildGuestModeButton(colorScheme),
                  SizedBox(height: 16),
                  
                  // Switch Auth Mode
                  _buildSwitchAuthMode(colorScheme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(ColorScheme colorScheme) {
    return AnimatedBuilder(
      animation: _slideController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - _slideController.value)),
          child: Opacity(
            opacity: _fadeController.value,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withAlpha(100),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.agriculture,
                    size: 50,
                    color: colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'भारतीय किसान ऐप',
                  style: GoogleFonts.hind(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Indian Farmer App',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAuthCard(ThemeData theme, ColorScheme colorScheme) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        constraints: BoxConstraints(maxWidth: 400),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _isLogin ? 'लॉगिन करें' : 'साइन अप करें',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              
              // Name field (only for signup)
              if (!_isLogin) ...[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'पूरा नाम',
                    hintText: 'अपना पूरा नाम दर्ज करें',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (!_isLogin && (value == null || value.isEmpty)) {
                      return 'कृपया अपना नाम दर्ज करें';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
              ],
              
              // Email field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'ईमेल',
                  hintText: 'farmer@example.com',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'कृपया ईमेल दर्ज करें';
                  }
                  if (!value.contains('@')) {
                    return 'कृपया वैध ईमेल दर्ज करें';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              
              // Phone field (only for signup)
              if (!_isLogin) ...[
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'मोबाइल नंबर',
                    hintText: '+91 9876543210',
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) {
                    if (!_isLogin && (value == null || value.isEmpty)) {
                      return 'कृपया मोबाइल नंबर दर्ज करें';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
              ],
              
              // Password field
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'पासवर्ड',
                  hintText: 'अपना पासवर्ड दर्ज करें',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'कृपया पासवर्ड दर्ज करें';
                  }
                  if (value.length < 6) {
                    return 'पासवर्ड कम से कम 6 अक्षर का होना चाहिए';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              
              // Auth Button
              FilledButton(
                onPressed: _isLoading ? null : _handleAuth,
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isLoading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            colorScheme.onPrimary,
                          ),
                        ),
                      )
                    : Text(
                        _isLogin ? 'लॉगिन करें' : 'साइन अप करें',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              
              if (_isLogin) ...[
                SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    // Handle forgot password
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('पासवर्ड रीसेट सुविधा जल्द ही आएगी'),
                        backgroundColor: colorScheme.secondary,
                      ),
                    );
                  },
                  child: Text('पासवर्ड भूल गए?'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGuestModeButton(ColorScheme colorScheme) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      child: OutlinedButton.icon(
        onPressed: _handleGuestMode,
        icon: Icon(Icons.person_outline),
        label: Text(
          'गेस्ट मोड में जारी रखें',
          style: TextStyle(fontSize: 16),
        ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),
    );
  }

  Widget _buildSwitchAuthMode(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _isLogin ? 'नया उपयोगकर्ता हैं?' : 'पहले से अकाउंट है?',
          style: TextStyle(color: colorScheme.onSurfaceVariant),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _isLogin = !_isLogin;
            });
          },
          child: Text(
            _isLogin ? 'साइन अप करें' : 'लॉगिन करें',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void _handleAuth() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    await Future.delayed(Duration(seconds: 2));

    if (!mounted) return;

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isLogin ? 'सफलतापूर्वक लॉगिन हो गए!' : 'अकाउंट सफलतापूर्वक बनाया गया!',
        ),
        backgroundColor: Colors.green,
      ),
    );

    setState(() {
      _isLoading = false;
    });

    // Navigate to dashboard
    _navigateToDashboard(isGuest: false);
  }

  void _handleGuestMode() {
    // Show guest mode info
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('गेस्ट मोड'),
        content: Text(
          'गेस्ट मोड में आप ऐप की सभी सुविधाओं का उपयोग कर सकते हैं। '
          'हालांकि, आपका डेटा सेव नहीं होगा। बेहतर अनुभव के लिए अकाउंट बनाएं।',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('रद्द करें'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              _navigateToDashboard(isGuest: true);
            },
            child: Text('जारी रखें'),
          ),
        ],
      ),
    );
  }

  void _navigateToDashboard({required bool isGuest}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SimpleDashboard(),
      ),
    );
}
