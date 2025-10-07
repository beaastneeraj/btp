import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/indian_agriculture_models.dart';
import '../data/indian_crop_database.dart';
import '../data/farm_inputs_database.dart';
import '../data/government_schemes_database.dart';
import '../services/farm_expense_service.dart';
import '../widgets/figma_components.dart';

class ModernFarmDashboard extends ConsumerStatefulWidget {
  final FarmProfile farm;

  const ModernFarmDashboard({
    super.key,
    required this.farm,
  });

  @override
  ConsumerState<ModernFarmDashboard> createState() => _ModernFarmDashboardState();
}

class _ModernFarmDashboardState extends ConsumerState<ModernFarmDashboard>
    with TickerProviderStateMixin {
  late AnimationController _cardAnimationController;
  late AnimationController _chartAnimationController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _cardAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _chartAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );
    
    _cardAnimationController.forward();
    _chartAnimationController.forward();
  }

  @override
  void dispose() {
    _cardAnimationController.dispose();
    _chartAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // Modern App Bar
          SliverAppBar.large(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'नमस्ते, ${widget.farm.ownerName}',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${widget.farm.farmName} • ${widget.farm.location}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onPrimary.withAlpha(200),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () => _showNotifications(context),
                icon: Badge(
                  smallSize: 8,
                  child: Icon(Icons.notifications_outlined),
                ),
              ),
              IconButton(
                onPressed: () => _showProfile(context),
                icon: CircleAvatar(
                  radius: 16,
                  backgroundColor: colorScheme.onPrimary,
                  child: Icon(
                    Icons.person,
                    color: colorScheme.primary,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primary,
                      colorScheme.primary.withAlpha(200),
                      colorScheme.secondary,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Tab Navigation
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarDelegate(
              child: Container(
                color: colorScheme.surface,
                child: TabBar(
                  controller: TabController(
                    length: 5,
                    vsync: this,
                    initialIndex: _selectedTabIndex,
                  ),
                  onTap: (index) => setState(() => _selectedTabIndex = index),
                  labelColor: colorScheme.primary,
                  unselectedLabelColor: colorScheme.onSurfaceVariant,
                  indicatorColor: colorScheme.primary,
                  tabs: [
                    Tab(text: 'खेत', icon: Icon(Icons.agriculture, size: 20)),
                    Tab(text: 'वित्त', icon: Icon(Icons.account_balance_wallet, size: 20)),
                    Tab(text: 'उपकरण', icon: Icon(Icons.precision_manufacturing, size: 20)),
                    Tab(text: 'योजनाएं', icon: Icon(Icons.policy, size: 20)),
                    Tab(text: 'समाचार', icon: Icon(Icons.newspaper, size: 20)),
                  ],
                ),
              ),
            ),
          ),

          // Content based on selected tab
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: _buildTabContent(),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildFarmOverview();
      case 1:
        return _buildFinancialOverview();
      case 2:
        return _buildEquipmentOverview();
      case 3:
        return _buildSchemesOverview();
      case 4:
        return _buildNewsOverview();
      default:
        return _buildFarmOverview();
    }
  }

  Widget _buildFarmOverview() {
    return SliverList(
      delegate: SliverChildListDelegate([
        // Farm Statistics Cards
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'कुल भूमि',
                '${widget.farm.totalLandArea.toStringAsFixed(1)} हेक्टेयर',
                Icons.landscape,
                Colors.green,
                0,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                'फसल क्षेत्र',
                '${widget.farm.cropFields.length} खेत',
                Icons.grass,
                Colors.amber,
                1,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'पशुधन',
                '${widget.farm.livestock.length} जानवर',
                Icons.pets,
                Colors.brown,
                2,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                'उपकरण',
                '${widget.farm.instruments.length} यंत्र',
                Icons.build,
                Colors.blue,
                3,
              ),
            ),
          ],
        ),
        SizedBox(height: 24),

        // Current Crops Section
        _buildSectionHeader('वर्तमान फसलें', Icons.eco),
        SizedBox(height: 12),
        ...widget.farm.cropFields.map((field) => _buildCropCard(field)).toList(),
        SizedBox(height: 24),

        // Weather and Advisory
        _buildWeatherCard(),
        SizedBox(height: 24),

        // Quick Actions
        _buildQuickActions(),
      ]),
    );
  }

  Widget _buildFinancialOverview() {
    final expenseService = ref.read(farmExpenseServiceProvider);
    final totalExpenses = widget.farm.expenses
        .fold(0.0, (sum, expense) => sum + expense.amount);
    final totalIncome = widget.farm.incomes
        .fold(0.0, (sum, income) => sum + income.amount);
    final netProfit = totalIncome - totalExpenses;

    return SliverList(
      delegate: SliverChildListDelegate([
        // Financial Summary Cards
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'कुल आय',
                '₹${_formatCurrency(totalIncome)}',
                Icons.trending_up,
                Colors.green,
                0,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                'कुल खर्च',
                '₹${_formatCurrency(totalExpenses)}',
                Icons.trending_down,
                Colors.red,
                1,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),

        _buildStatCard(
          'शुद्ध लाभ',
          '₹${_formatCurrency(netProfit)}',
          netProfit >= 0 ? Icons.monetization_on : Icons.money_off,
          netProfit >= 0 ? Colors.green : Colors.red,
          2,
        ),
        SizedBox(height: 24),

        // Expense Chart
        _buildSectionHeader('मासिक खर्च', Icons.bar_chart),
        SizedBox(height: 12),
        _buildExpenseChart(),
        SizedBox(height: 24),

        // Category-wise Expenses
        _buildSectionHeader('श्रेणी अनुसार खर्च', Icons.pie_chart),
        SizedBox(height: 12),
        _buildCategoryExpenseChart(),
        SizedBox(height: 24),

        // Recent Transactions
        _buildSectionHeader('हाल की लेन-देन', Icons.receipt_long),
        SizedBox(height: 12),
        ...widget.farm.expenses.take(5).map((expense) => 
          _buildTransactionCard(expense)).toList(),
      ]),
    );
  }

  Widget _buildEquipmentOverview() {
    return SliverList(
      delegate: SliverChildListDelegate([
        // Equipment Summary
        _buildSectionHeader('उपकरण सारांश', Icons.build),
        SizedBox(height: 12),
        
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'कुल यंत्र',
                '${widget.farm.instruments.length}',
                Icons.precision_manufacturing,
                Colors.blue,
                0,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                'रखरखाव देय',
                '${_getDueMaintenanceCount()}',
                Icons.build_circle,
                Colors.orange,
                1,
              ),
            ),
          ],
        ),
        SizedBox(height: 24),

        // Equipment List
        _buildSectionHeader('उपकरण सूची', Icons.list),
        SizedBox(height: 12),
        ...widget.farm.instruments.map((instrument) => 
          _buildEquipmentCard(instrument)).toList(),
        SizedBox(height: 24),

        // Maintenance Calendar
        _buildMaintenanceCalendar(),
      ]),
    );
  }

  Widget _buildSchemesOverview() {
    final schemes = GovernmentSchemesDatabase.getActiveSchemes();
    
    return SliverList(
      delegate: SliverChildListDelegate([
        // Popular Schemes
        _buildSectionHeader('लोकप्रिय योजनाएं', Icons.policy),
        SizedBox(height: 12),
        ...schemes.take(3).map((scheme) => _buildSchemeCard(scheme)).toList(),
        SizedBox(height: 24),

        // Scheme Categories
        _buildSectionHeader('योजना श्रेणियां', Icons.category),
        SizedBox(height: 12),
        _buildSchemeCategoriesGrid(),
        SizedBox(height: 24),

        // Applied Schemes
        _buildSectionHeader('आवेदित योजनाएं', Icons.check_circle),
        SizedBox(height: 12),
        _buildAppliedSchemesCard(),
      ]),
    );
  }

  Widget _buildNewsOverview() {
    final news = AgricultureNewsDatabase.getLatestNews();
    
    return SliverList(
      delegate: SliverChildListDelegate([
        // Important News
        _buildSectionHeader('महत्वपूर्ण समाचार', Icons.priority_high),
        SizedBox(height: 12),
        ...news.where((article) => article.isImportant).take(2)
          .map((article) => _buildNewsCard(article, isImportant: true)).toList(),
        SizedBox(height: 24),

        // Latest News
        _buildSectionHeader('ताजा समाचार', Icons.newspaper),
        SizedBox(height: 12),
        ...news.take(5).map((article) => _buildNewsCard(article)).toList(),
      ]),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
    int index,
  ) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withAlpha(50),
              color.withAlpha(20),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 24),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    ).animate(delay: Duration(milliseconds: index * 100))
      .slideX(begin: 0.3, duration: 600.ms)
      .fadeIn();
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildCropCard(CropField field) {
    final cropInfo = IndianCropDatabase.crops[field.cropName.toLowerCase()];
    
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getCropColor(field.cropName),
          child: Icon(
            _getCropIcon(field.cropName),
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          '${field.cropName} - ${field.variety}',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('क्षेत्रफल: ${field.areaInHectares} हेक्टेयर'),
            Text('बुआई: ${_formatDate(field.sowingDate)}'),
            LinearProgressIndicator(
              value: _getCropProgress(field),
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                _getCropColor(field.cropName),
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_getDaysToHarvest(field)} दिन',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text('कटाई तक', style: TextStyle(fontSize: 10)),
          ],
        ),
        onTap: () => _showCropDetails(field, cropInfo),
      ),
    ).animate().slideX().fadeIn();
  }

  Widget _buildWeatherCard() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.withAlpha(50),
              Colors.lightBlue.withAlpha(30),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'मौसम और सलाह',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.wb_sunny, color: Colors.orange, size: 24),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('तापमान: 28°C'),
                      Text('आर्द्रता: 65%'),
                      Text('हवा: 12 km/h'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('बारिश: 20%'),
                      Text('UV: मध्यम'),
                      Text('दृश्यता: 10 km'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(100),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '💡 आज सिंचाई के लिए अच्छा दिन है। शाम के समय छिड़काव करें।',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    ).animate().slideY().fadeIn();
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('त्वरित कार्य', Icons.flash_on),
        SizedBox(height: 12),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 2.5,
          children: [
            _buildActionButton('खर्च जोड़ें', Icons.add, Colors.blue, () {}),
            _buildActionButton('फसल रिकॉर्ड', Icons.note_add, Colors.green, () {}),
            _buildActionButton('मौसम अपडेट', Icons.cloud, Colors.orange, () {}),
            _buildActionButton('सलाह लें', Icons.support_agent, Colors.purple, () {}),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [color.withAlpha(50), color.withAlpha(20)],
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: 20),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper methods
  Color _getCropColor(String cropName) {
    switch (cropName.toLowerCase()) {
      case 'wheat': return Colors.amber;
      case 'rice': return Colors.green;
      case 'maize': return Colors.yellow;
      case 'cotton': return Colors.blue;
      default: return Colors.teal;
    }
  }

  IconData _getCropIcon(String cropName) {
    switch (cropName.toLowerCase()) {
      case 'wheat': return Icons.grass;
      case 'rice': return Icons.rice_bowl;
      case 'maize': return Icons.corn;
      case 'cotton': return Icons.eco;
      default: return Icons.agriculture;
    }
  }

  double _getCropProgress(CropField field) {
    final daysSinceSowing = DateTime.now().difference(field.sowingDate).inDays;
    final totalDays = field.harvestDate?.difference(field.sowingDate).inDays ?? 120;
    return (daysSinceSowing / totalDays).clamp(0.0, 1.0);
  }

  int _getDaysToHarvest(CropField field) {
    if (field.harvestDate == null) return 0;
    return field.harvestDate!.difference(DateTime.now()).inDays.clamp(0, 365);
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatCurrency(double amount) {
    if (amount >= 100000) {
      return '${(amount / 100000).toStringAsFixed(1)}L';
    } else if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(1)}K';
    }
    return amount.toStringAsFixed(0);
  }

  int _getDueMaintenanceCount() {
    return widget.farm.instruments
        .where((instrument) => 
            instrument.maintenance?.nextMaintenance.isBefore(
              DateTime.now().add(Duration(days: 30))) == true)
        .length;
  }

  Widget _buildExpenseChart() {
    // Implementation for expense chart
    return SizedBox(
      height: 200,
      child: Center(child: Text('Expense Chart Placeholder')),
    );
  }

  Widget _buildCategoryExpenseChart() {
    // Implementation for category expense chart
    return SizedBox(
      height: 200,
      child: Center(child: Text('Category Chart Placeholder')),
    );
  }

  Widget _buildTransactionCard(FarmExpense expense) {
    return Card(
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red.withAlpha(100),
          child: Icon(Icons.remove, color: Colors.red),
        ),
        title: Text(expense.description),
        subtitle: Text(_formatDate(expense.date)),
        trailing: Text(
          '₹${expense.amount.toStringAsFixed(0)}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget _buildEquipmentCard(FarmInstrumentDetail instrument) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.withAlpha(100),
          child: Icon(Icons.build, color: Colors.blue),
        ),
        title: Text(instrument.name),
        subtitle: Text('${instrument.brand} • ${instrument.condition}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              instrument.maintenance.nextMaintenance.isBefore(
                DateTime.now().add(Duration(days: 30))) == true
                  ? Icons.warning
                  : Icons.check_circle,
              color: instrument.maintenance.nextMaintenance.isBefore(
                DateTime.now().add(Duration(days: 30))) == true
                  ? Colors.orange
                  : Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaintenanceCalendar() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'रखरखाव कैलेंडर',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text('Maintenance calendar implementation here'),
          ],
        ),
      ),
    );
  }

  Widget _buildSchemeCard(GovernmentScheme scheme) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green.withAlpha(100),
          child: Icon(Icons.policy, color: Colors.green),
        ),
        title: Text(scheme.hindiName),
        subtitle: Text(scheme.description, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => _showSchemeDetails(scheme),
      ),
    );
  }

  Widget _buildSchemeCategoriesGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 2,
      children: [
        _buildCategoryCard('ऋण योजनाएं', Icons.account_balance, Colors.blue),
        _buildCategoryCard('बीमा योजनाएं', Icons.security, Colors.green),
        _buildCategoryCard('सब्सिडी योजनाएं', Icons.monetization_on, Colors.orange),
        _buildCategoryCard('प्रशिक्षण योजनाएं', Icons.school, Colors.purple),
      ],
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, Color color) {
    return Card(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [color.withAlpha(50), color.withAlpha(20)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 24),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppliedSchemesCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('आपने अभी तक कोई योजना के लिए आवेदन नहीं किया है।'),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: Text('योजनाएं देखें'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(AgricultureNews article, {bool isImportant = false}) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: isImportant ? Colors.red.withAlpha(100) : Colors.blue.withAlpha(100),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            isImportant ? Icons.priority_high : Icons.article,
            color: isImportant ? Colors.red : Colors.blue,
          ),
        ),
        title: Text(
          article.hindiTitle,
          style: TextStyle(fontWeight: FontWeight.w600),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  article.source,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Spacer(),
                Text(
                  _formatDate(article.date),
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        isThreeLine: true,
        onTap: () => _showNewsDetails(article),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () => _showQuickAddDialog(),
      icon: Icon(Icons.add),
      label: Text('जोड़ें'),
    );
  }

  // Event handlers
  void _showNotifications(BuildContext context) {
    // Implementation for notifications
  }

  void _showProfile(BuildContext context) {
    // Implementation for profile
  }

  void _showCropDetails(CropField field, CropInfo? cropInfo) {
    // Implementation for crop details
  }

  void _showSchemeDetails(GovernmentScheme scheme) {
    // Implementation for scheme details
  }

  void _showNewsDetails(AgricultureNews article) {
    // Implementation for news details
  }

  void _showQuickAddDialog() {
    // Implementation for quick add dialog
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _TabBarDelegate({required this.child});

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
