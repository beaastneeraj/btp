import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/khatabook_models.dart';
import 'transaction_form_screen.dart';
import 'khatabook_crop_form_screen.dart';
import 'khatabook_analytics_screen.dart';

class KhatabookScreen extends StatefulWidget {
  const KhatabookScreen({Key? key}) : super(key: key);

  @override
  State<KhatabookScreen> createState() => _KhatabookScreenState();
}

class _KhatabookScreenState extends State<KhatabookScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String _selectedPeriod = 'This Month';
  List<Transaction> _transactions = [];
  List<Crop> _crops = [];
  List<Budget> _budgets = [];
  
  // Sample data for demonstration
  double _totalIncome = 45000;
  double _totalExpenses = 28000;
  double _netProfit = 17000;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _loadSampleData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _loadSampleData() {
    // Sample transactions
    _transactions = [
      Transaction(
        id: '1',
        type: TransactionType.expense,
        amount: 5000,
        description: 'Wheat Seeds Purchase',
        date: DateTime.now().subtract(const Duration(days: 15)),
        expenseCategory: ExpenseCategory.seeds,
        cropId: 'crop1',
      ),
      Transaction(
        id: '2',
        type: TransactionType.income,
        amount: 15000,
        description: 'Rice Sale to Market',
        date: DateTime.now().subtract(const Duration(days: 10)),
        incomeCategory: IncomeCategory.cropSale,
        cropId: 'crop2',
      ),
      Transaction(
        id: '3',
        type: TransactionType.expense,
        amount: 3000,
        description: 'Fertilizer - NPK',
        date: DateTime.now().subtract(const Duration(days: 5)),
        expenseCategory: ExpenseCategory.fertilizer,
        cropId: 'crop1',
      ),
    ];

    // Sample crops
    _crops = [
      Crop(
        id: 'crop1',
        name: 'Winter Wheat',
        type: CropType.wheat,
        areaInAcres: 5.0,
        plantingDate: DateTime.now().subtract(const Duration(days: 60)),
        variety: 'HD-2967',
        expectedYield: 2500,
      ),
      Crop(
        id: 'crop2',
        name: 'Basmati Rice',
        type: CropType.rice,
        areaInAcres: 3.0,
        plantingDate: DateTime.now().subtract(const Duration(days: 120)),
        harvestDate: DateTime.now().subtract(const Duration(days: 10)),
        variety: 'Pusa Basmati 1121',
        expectedYield: 1800,
        actualYield: 1950,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: Colors.green.shade600,
            foregroundColor: Colors.white,
            title: const Text(
              'Farm Khatabook',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
            pinned: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.analytics_outlined),
                onPressed: () => _showAnalytics(),
              ),
              IconButton(
                icon: const Icon(Icons.download),
                onPressed: () => _exportData(),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Financial Summary Cards
                _buildFinancialSummary(),
                
                // Period Selector
                _buildPeriodSelector(),
                
                // Tab Bar
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabs: const [
                      Tab(text: 'Overview'),
                      Tab(text: 'Transactions'),
                      Tab(text: 'Crops'),
                      Tab(text: 'Budget'),
                      Tab(text: 'Tips'),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Tab Views
                SizedBox(
                  height: 700,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildOverviewTab(),
                      _buildTransactionsTab(),
                      _buildCropsTab(),
                      _buildBudgetTab(),
                      _buildTipsTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddTransactionDialog(),
        icon: const Icon(Icons.add),
        label: const Text('Add Entry'),
        backgroundColor: Colors.green.shade600,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildFinancialSummary() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildSummaryCard(
              'Total Income',
              '₹${NumberFormat('#,##,###').format(_totalIncome)}',
              Colors.green,
              Icons.trending_up,
              '+12.5%',
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildSummaryCard(
              'Total Expenses',
              '₹${NumberFormat('#,##,###').format(_totalExpenses)}',
              Colors.red,
              Icons.trending_down,
              '+8.2%',
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildSummaryCard(
              'Net Profit',
              '₹${NumberFormat('#,##,###').format(_netProfit)}',
              Colors.blue,
              Icons.account_balance_wallet,
              '+22.1%',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String amount, Color color, IconData icon, String trend) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 24),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    trend,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
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

  Widget _buildPeriodSelector() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Financial Overview',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.calendar_today),
            label: Text(_selectedPeriod),
            onPressed: _showPeriodSelector,
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profit/Loss Chart
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Profit/Loss Trend',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Profit/Loss Chart\n(Monthly Overview)',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Expense Breakdown
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Expense Breakdown',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildExpenseItem('Seeds & Planting', 8000, 28.6),
                  _buildExpenseItem('Fertilizers', 6500, 23.2),
                  _buildExpenseItem('Labor', 5000, 17.9),
                  _buildExpenseItem('Equipment', 4200, 15.0),
                  _buildExpenseItem('Others', 4300, 15.3),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Recent Activities
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent Activities',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ..._transactions.take(3).map((transaction) =>
                    _buildActivityItem(transaction)
                  ).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Filter Options
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Type',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'all', child: Text('All')),
                    DropdownMenuItem(value: 'income', child: Text('Income')),
                    DropdownMenuItem(value: 'expense', child: Text('Expense')),
                  ],
                  value: 'all',
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Crop',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    const DropdownMenuItem(value: 'all', child: Text('All Crops')),
                    ..._crops.map((crop) => DropdownMenuItem(
                      value: crop.id,
                      child: Text(crop.name),
                    )),
                  ],
                  value: 'all',
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Transaction List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _transactions.length,
            itemBuilder: (context, index) {
              final transaction = _transactions[index];
              return _buildTransactionCard(transaction);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCropsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Add Crop Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _showAddCropDialog(),
              icon: const Icon(Icons.add),
              label: const Text('Add New Crop'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Crops List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _crops.length,
            itemBuilder: (context, index) {
              final crop = _crops[index];
              return _buildCropCard(crop);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Budget Planning Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Budget Planning',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildBudgetMetric(
                          'Planned Budget',
                          '₹50,000',
                          Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildBudgetMetric(
                          'Actual Spent',
                          '₹28,000',
                          Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: 0.56,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                  const SizedBox(height: 8),
                  const Text('56% of budget used'),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Monthly Budget Comparison
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Monthly Budget vs Actual',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Budget Comparison Chart',
                        style: TextStyle(color: Colors.grey),
                      ),
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

  Widget _buildTipsTab() {
    final tips = [
      {
        'title': 'Optimize Fertilizer Usage',
        'description': 'Use soil testing to determine exact fertilizer requirements. This can reduce costs by 15-20%.',
        'category': 'Cost Reduction',
        'priority': 5,
      },
      {
        'title': 'Crop Rotation Benefits',
        'description': 'Rotate crops to improve soil health and reduce pest problems, leading to better yields.',
        'category': 'Yield Improvement',
        'priority': 4,
      },
      {
        'title': 'Weather-Based Planning',
        'description': 'Plan activities based on weather forecasts to optimize resource usage.',
        'category': 'Planning',
        'priority': 4,
      },
      {
        'title': 'Record Keeping',
        'description': 'Maintain detailed records of all activities to identify patterns and improve efficiency.',
        'category': 'Management',
        'priority': 3,
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Tips Header
          Card(
            color: Colors.green.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.lightbulb, color: Colors.green.shade600, size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Farming Tips & Advice',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Personalized recommendations based on your farm data',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Tips List
          ...tips.map((tip) => _buildTipCard(tip)).toList(),
        ],
      ),
    );
  }

  Widget _buildExpenseItem(String category, double amount, double percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(category),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₹${NumberFormat('#,##,###').format(amount)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '${percentage.toStringAsFixed(1)}%',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(Transaction transaction) {
    final isIncome = transaction.type == TransactionType.income;
    final crop = _crops.firstWhere(
      (c) => c.id == transaction.cropId,
      orElse: () => Crop(
        id: '',
        name: 'General',
        type: CropType.other,
        areaInAcres: 0,
        plantingDate: DateTime.now(),
        variety: '',
      ),
    );

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isIncome ? Colors.green.shade100 : Colors.red.shade100,
        child: Icon(
          isIncome ? Icons.trending_up : Icons.trending_down,
          color: isIncome ? Colors.green : Colors.red,
        ),
      ),
      title: Text(transaction.description),
      subtitle: Text('${crop.name} • ${DateFormat('MMM dd').format(transaction.date)}'),
      trailing: Text(
        '${isIncome ? '+' : '-'}₹${NumberFormat('#,##,###').format(transaction.amount)}',
        style: TextStyle(
          color: isIncome ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTransactionCard(Transaction transaction) {
    final isIncome = transaction.type == TransactionType.income;
    final crop = _crops.firstWhere(
      (c) => c.id == transaction.cropId,
      orElse: () => Crop(
        id: '',
        name: 'General',
        type: CropType.other,
        areaInAcres: 0,
        plantingDate: DateTime.now(),
        variety: '',
      ),
    );

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isIncome ? Colors.green.shade100 : Colors.red.shade100,
          child: Icon(
            isIncome ? Icons.trending_up : Icons.trending_down,
            color: isIncome ? Colors.green : Colors.red,
          ),
        ),
        title: Text(transaction.description),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${crop.name} • ${DateFormat('MMM dd, yyyy').format(transaction.date)}'),
            if (transaction.notes != null)
              Text(
                transaction.notes!,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${isIncome ? '+' : '-'}₹${NumberFormat('#,##,###').format(transaction.amount)}',
              style: TextStyle(
                color: isIncome ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              isIncome ? transaction.incomeCategory?.name ?? '' : transaction.expenseCategory?.name ?? '',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        onTap: () => _showTransactionDetails(transaction),
      ),
    );
  }

  Widget _buildCropCard(Crop crop) {
    final cropTransactions = _transactions.where((t) => t.cropId == crop.id).toList();
    final totalExpense = cropTransactions
        .where((t) => t.type == TransactionType.expense)
        .fold(0.0, (sum, t) => sum + t.amount);
    final totalIncome = cropTransactions
        .where((t) => t.type == TransactionType.income)
        .fold(0.0, (sum, t) => sum + t.amount);
    final profit = totalIncome - totalExpense;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        crop.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${crop.variety} • ${crop.areaInAcres} acres',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: crop.harvestDate != null ? Colors.green.shade100 : Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    crop.harvestDate != null ? 'Harvested' : 'Growing',
                    style: TextStyle(
                      color: crop.harvestDate != null ? Colors.green.shade800 : Colors.orange.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            Row(
              children: [
                Expanded(
                  child: _buildCropMetric('Expenses', '₹${NumberFormat('#,##,###').format(totalExpense)}', Colors.red),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildCropMetric('Income', '₹${NumberFormat('#,##,###').format(totalIncome)}', Colors.green),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildCropMetric(
                    'Profit',
                    '₹${NumberFormat('#,##,###').format(profit)}',
                    profit >= 0 ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Planted: ${DateFormat('MMM dd, yyyy').format(crop.plantingDate)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                if (crop.harvestDate != null)
                  Text(
                    'Harvested: ${DateFormat('MMM dd, yyyy').format(crop.harvestDate!)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCropMetric(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildBudgetMetric(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipCard(Map<String, dynamic> tip) {
    final priority = tip['priority'] as int;
    final priorityColor = priority >= 4 ? Colors.red : priority >= 3 ? Colors.orange : Colors.blue;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    tip['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: priorityColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.priority_high,
                        size: 12,
                        color: priorityColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        tip['category'],
                        style: TextStyle(
                          fontSize: 10,
                          color: priorityColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              tip['description'],
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border, size: 16),
                  label: const Text('Save'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share, size: 16),
                  label: const Text('Share'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showPeriodSelector() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Period',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...['This Week', 'This Month', 'Last 3 Months', 'This Year', 'Custom'].map(
              (period) => ListTile(
                title: Text(period),
                trailing: _selectedPeriod == period
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  setState(() {
                    _selectedPeriod = period;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddTransactionDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add New Entry',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _showTransactionForm(TransactionType.income);
                      },
                      icon: const Icon(Icons.trending_up),
                      label: const Text('Income'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _showTransactionForm(TransactionType.expense);
                      },
                      icon: const Icon(Icons.trending_down),
                      label: const Text('Expense'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTransactionForm(TransactionType type) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TransactionFormScreen(type: type),
      ),
    );
    
    if (result != null && result is Transaction) {
      setState(() {
        _transactions.add(result);
        // Update totals
        if (result.type == TransactionType.income) {
          _totalIncome += result.amount;
        } else {
          _totalExpenses += result.amount;
        }
        _netProfit = _totalIncome - _totalExpenses;
      });
    }
  }

  void _showAddCropDialog() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const KhatabookCropFormScreen(),
      ),
    );
    
    if (result != null && result is Crop) {
      setState(() {
        _crops.add(result);
      });
    }
  }

  void _showTransactionDetails(Transaction transaction) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TransactionFormScreen(
          type: transaction.type,
          transaction: transaction,
        ),
      ),
    );
    
    if (result != null) {
      if (result == 'deleted') {
        setState(() {
          _transactions.removeWhere((t) => t.id == transaction.id);
          // Recalculate totals
          _totalIncome = _transactions
              .where((t) => t.type == TransactionType.income)
              .fold(0.0, (sum, t) => sum + t.amount);
          _totalExpenses = _transactions
              .where((t) => t.type == TransactionType.expense)
              .fold(0.0, (sum, t) => sum + t.amount);
          _netProfit = _totalIncome - _totalExpenses;
        });
      } else if (result is Transaction) {
        setState(() {
          final index = _transactions.indexWhere((t) => t.id == transaction.id);
          if (index != -1) {
            _transactions[index] = result;
            // Recalculate totals
            _totalIncome = _transactions
                .where((t) => t.type == TransactionType.income)
                .fold(0.0, (sum, t) => sum + t.amount);
            _totalExpenses = _transactions
                .where((t) => t.type == TransactionType.expense)
                .fold(0.0, (sum, t) => sum + t.amount);
            _netProfit = _totalIncome - _totalExpenses;
          }
        });
      }
    }
  }

  void _showAnalytics() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const KhatabookAnalyticsScreen(),
      ),
    );
  }

  void _exportData() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Exporting khatabook data...'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
