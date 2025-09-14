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
  
  bool _isLogin = true;
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary.withOpacity(0.1),
              colorScheme.secondary.withOpacity(0.05),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Logo and Title
                  _buildHeader(colorScheme),
                  const SizedBox(height: 48),
                  
                  // Authentication Form
                  _buildAuthForm(colorScheme),
                  const SizedBox(height: 24),
                  
                  // Guest Mode Button
                  _buildGuestModeButton(colorScheme),
                  const SizedBox(height: 24),
                  
                  // Switch Login/Signup
                  _buildSwitchAuthMode(colorScheme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Icon(
            Icons.agriculture,
            size: 60,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'भारतीय कृषि',
          style: GoogleFonts.notoSansDevanagari(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'किसानों के लिए डिजिटल समाधान',
          style: GoogleFonts.notoSansDevanagari(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildAuthForm(ColorScheme colorScheme) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            _isLogin ? 'लॉगिन करें' : 'साइन अप करें',
            style: GoogleFonts.notoSansDevanagari(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 32),
          
          // Name field (only for signup)
          if (!_isLogin) ...[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'पूरा नाम',
                hintText: 'अपना पूरा नाम दर्ज करें',
                prefixIcon: Icon(Icons.person, color: colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colorScheme.primary, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
          
          // Phone field (only for signup)
          if (!_isLogin) ...[
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'मोबाइल नंबर',
                hintText: '+91 1234567890',
                prefixIcon: Icon(Icons.phone, color: colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colorScheme.primary, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
          
          // Email field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'ईमेल पता',
              hintText: 'example@gmail.com',
              prefixIcon: Icon(Icons.email, color: colorScheme.primary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colorScheme.primary, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // Password field
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'पासवर्ड',
              hintText: 'कम से कम 6 अक्षर',
              prefixIcon: Icon(Icons.lock, color: colorScheme.primary),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: colorScheme.primary,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: colorScheme.primary, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Login/Signup Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _handleAuth,
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: _isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      _isLogin ? 'लॉगिन करें' : 'साइन अप करें',
                      style: GoogleFonts.notoSansDevanagari(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuestModeButton(ColorScheme colorScheme) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      child: OutlinedButton.icon(
        onPressed: () => _showGuestModeDialog(),
        icon: Icon(Icons.visibility, color: colorScheme.primary),
        label: Text(
          'गेस्ट मोड में प्रवेश करें',
          style: GoogleFonts.notoSansDevanagari(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: colorScheme.primary,
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
          _isLogin ? 'नया यूजर हैं?' : 'पहले से अकाउंट है?',
          style: GoogleFonts.notoSansDevanagari(
            color: Colors.grey.shade600,
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _isLogin = !_isLogin;
            });
          },
          child: Text(
            _isLogin ? 'साइन अप करें' : 'लॉगिन करें',
            style: GoogleFonts.notoSansDevanagari(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  void _handleAuth() async {
    // Basic validation
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnackBar('कृपया सभी फ़ील्ड भरें');
      return;
    }

    if (!_isLogin && _nameController.text.isEmpty) {
      _showSnackBar('कृपया अपना नाम दर्ज करें');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate authentication process
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    _showSnackBar(
      _isLogin ? 'सफलतापूर्वक लॉगिन हुए!' : 'खाता सफलतापूर्वक बनाया गया!',
    );

    // Navigate to dashboard
    _navigateToDashboard(isGuest: false);
  }

  void _showGuestModeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.info, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                'गेस्ट मोड',
                style: GoogleFonts.notoSansDevanagari(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            'गेस्ट मोड में आप ऐप की सभी सुविधाओं को बिना अकाउंट बनाए देख सकते हैं। \n\nक्या आप गेस्ट मोड में जारी रखना चाहते हैं?',
            style: GoogleFonts.notoSansDevanagari(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'रद्द करें',
                style: GoogleFonts.notoSansDevanagari(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _navigateToDashboard(isGuest: true);
              },
              child: Text(
                'जारी रखें',
                style: GoogleFonts.notoSansDevanagari(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _navigateToDashboard({required bool isGuest}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SimpleDashboard(),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.notoSansDevanagari(),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
