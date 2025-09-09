import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/khatabook_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Khatabook',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: const FarmKhatabookApp(),
    );
  }
}

class FarmKhatabookApp extends StatelessWidget {
  const FarmKhatabookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: Colors.green.shade600,
            foregroundColor: Colors.white,
            title: const Text(
              'Farm Management System',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Header Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green.shade600, Colors.green.shade400],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_balance_wallet,
                              color: Colors.white,
                              size: 48,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Farm Khatabook',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Digital Ledger & Analytics for Smart Farming',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const KhatabookScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.launch),
                            label: const Text(
                              'Open Farm Khatabook',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.green.shade600,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Features Grid
                  Text(
                    'Key Features',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _buildFeatureCard(
                        'Income & Expense Tracking',
                        'Record all farm income and expenses with detailed categorization',
                        Icons.trending_up,
                        Colors.green,
                      ),
                      _buildFeatureCard(
                        'Crop-wise Analysis',
                        'Track profitability and performance for each crop separately',
                        Icons.agriculture,
                        Colors.blue,
                      ),
                      _buildFeatureCard(
                        'Smart Analytics',
                        'AI-powered insights and recommendations for better farming',
                        Icons.psychology,
                        Colors.purple,
                      ),
                      _buildFeatureCard(
                        'Financial Reports',
                        'Generate detailed financial reports and forecasts',
                        Icons.assessment,
                        Colors.orange,
                      ),
                      _buildFeatureCard(
                        'Budget Planning',
                        'Plan and track your farming budget effectively',
                        Icons.account_balance,
                        Colors.teal,
                      ),
                      _buildFeatureCard(
                        'Expert Tips',
                        'Get personalized farming tips based on your data',
                        Icons.lightbulb,
                        Colors.amber,
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Benefits Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.stars, color: Colors.blue.shade600, size: 32),
                            const SizedBox(width: 12),
                            Text(
                              'Why Use Farm Khatabook?',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade800,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _buildBenefitItem('📈 Increase farm profitability by up to 25%'),
                        _buildBenefitItem('💰 Reduce unnecessary expenses through smart tracking'),
                        _buildBenefitItem('🎯 Make data-driven decisions for better yields'),
                        _buildBenefitItem('📊 Easy tax preparation with organized records'),
                        _buildBenefitItem('🔮 Plan future crops based on historical data'),
                        _buildBenefitItem('📱 Access your data anywhere, anytime'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, String description, IconData icon, Color color) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.blue.shade700,
        ),
      ),
    );
  }
}
