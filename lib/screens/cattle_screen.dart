import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/cattle.dart';
import '../themes/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class CattleScreen extends StatefulWidget {
  const CattleScreen({super.key});

  @override
  State<CattleScreen> createState() => _CattleScreenState();
}

class _CattleScreenState extends State<CattleScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  CattleType? _selectedType;
  HealthStatus? _selectedHealth;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.primaryGradient,
        ),
        child: Column(
          children: [
            CustomAppBar(
              title: 'Cattle Management',
              subtitle: 'Monitor your livestock health and productivity',
              actions: [
                IconButton(
                  onPressed: _showFilterDialog,
                  icon: const Icon(Icons.filter_list, color: Colors.white),
                ),
                IconButton(
                  onPressed: _showSearchDialog,
                  icon: const Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withOpacity(0.7),
                indicator: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                indicatorPadding: const EdgeInsets.all(4),
                tabs: const [
                  Tab(text: 'All Cattle'),
                  Tab(text: 'Health'),
                  Tab(text: 'Breeding'),
                  Tab(text: 'Production'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildAllCattleTab(),
                    _buildHealthTab(),
                    _buildBreedingTab(),
                    _buildProductionTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllCattleTab() {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        // For now, using mock data
        final cattleList = _getMockCattleData();
        final filteredCattle = _filterCattle(cattleList);

        return Column(
          children: [
            _buildCattleStats(cattleList),
            Expanded(
              child: filteredCattle.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredCattle.length,
                      itemBuilder: (context, index) {
                        final cattle = filteredCattle[index];
                        return _buildCattleCard(cattle);
                      },
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCattleStats(List<Cattle> cattleList) {
    final totalCattle = cattleList.length;
    final healthyCattle = cattleList.where((c) => c.healthStatus == HealthStatus.healthy).length;
    final lactatingCows = cattleList.where((c) => c.isLactating).length;
    final needsVaccination = cattleList.where((c) => c.needsVaccination).length;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              'Total Cattle',
              totalCattle.toString(),
              Icons.pets,
              AppTheme.primaryGreen,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              'Healthy',
              healthyCattle.toString(),
              Icons.favorite,
              AppTheme.successGreen,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              'Lactating',
              lactatingCows.toString(),
              Icons.local_drink,
              AppTheme.primaryBlue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              'Needs Care',
              needsVaccination.toString(),
              Icons.medical_services,
              AppTheme.warningOrange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
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
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCattleCard(Cattle cattle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _getHealthColor(cattle.healthStatus),
                        _getHealthColor(cattle.healthStatus).withOpacity(0.7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    _getCattleIcon(cattle.type),
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            cattle.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: _getHealthColor(cattle.healthStatus),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              cattle.healthStatus.displayName,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tag: ${cattle.tagNumber} • ${cattle.breed.displayName}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        'Age: ${cattle.displayAge} • Weight: ${cattle.weight}kg',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    if (cattle.needsVaccination)
                      Icon(
                        Icons.warning,
                        color: AppTheme.warningOrange,
                        size: 20,
                      ),
                    const SizedBox(height: 8),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (cattle.isLactating && cattle.dailyMilkYield != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.local_drink,
                    color: AppTheme.primaryBlue,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Daily Yield: ${cattle.dailyMilkYield!.toStringAsFixed(1)}L',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                  const Spacer(),
                  if (cattle.lastMilking != null)
                    Text(
                      'Last: ${_formatTime(cattle.lastMilking!)}',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade600,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHealthTab() {
    return const Center(
      child: Text('Health monitoring features coming soon...'),
    );
  }

  Widget _buildBreedingTab() {
    return const Center(
      child: Text('Breeding management features coming soon...'),
    );
  }

  Widget _buildProductionTab() {
    return const Center(
      child: Text('Production analytics coming soon...'),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.pets_outlined,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No cattle found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add your first cattle to get started',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  List<Cattle> _filterCattle(List<Cattle> cattleList) {
    return cattleList.where((cattle) {
      bool matchesSearch = _searchQuery.isEmpty ||
          cattle.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          cattle.tagNumber.toLowerCase().contains(_searchQuery.toLowerCase());
      
      bool matchesType = _selectedType == null || cattle.type == _selectedType;
      bool matchesHealth = _selectedHealth == null || cattle.healthStatus == _selectedHealth;
      
      return matchesSearch && matchesType && matchesHealth;
    }).toList();
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Cattle'),
        content: TextField(
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          decoration: const InputDecoration(
            hintText: 'Enter name or tag number',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _searchQuery = '';
              });
              Navigator.pop(context);
            },
            child: const Text('Clear'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Cattle'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<CattleType>(
              value: _selectedType,
              decoration: const InputDecoration(labelText: 'Type'),
              items: CattleType.values.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type.displayName),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedType = value;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<HealthStatus>(
              value: _selectedHealth,
              decoration: const InputDecoration(labelText: 'Health Status'),
              items: HealthStatus.values.map((status) {
                return DropdownMenuItem(
                  value: status,
                  child: Text(status.displayName),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedHealth = value;
                });
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _selectedType = null;
                _selectedHealth = null;
              });
              Navigator.pop(context);
            },
            child: const Text('Clear'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }

  Color _getHealthColor(HealthStatus status) {
    switch (status) {
      case HealthStatus.healthy:
        return AppTheme.successGreen;
      case HealthStatus.sick:
        return AppTheme.errorRed;
      case HealthStatus.injured:
        return AppTheme.warningOrange;
      case HealthStatus.pregnant:
        return AppTheme.primaryBlue;
      case HealthStatus.recovered:
        return AppTheme.accentGreen;
      case HealthStatus.quarantine:
        return Colors.purple;
    }
  }

  IconData _getCattleIcon(CattleType type) {
    switch (type) {
      case CattleType.cow:
        return Icons.pets;
      case CattleType.bull:
        return Icons.pets;
      case CattleType.calf:
        return Icons.pets_outlined;
      case CattleType.heifer:
        return Icons.pets;
      case CattleType.steer:
        return Icons.pets;
    }
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }

  List<Cattle> _getMockCattleData() {
    final now = DateTime.now();
    return [
      Cattle(
        id: '1',
        tagNumber: 'C001',
        name: 'Bella',
        type: CattleType.cow,
        breed: CattleBreed.holstein,
        birthDate: now.subtract(const Duration(days: 1200)),
        gender: Gender.female,
        weight: 650,
        healthStatus: HealthStatus.healthy,
        dailyMilkYield: 25.5,
        lastMilking: now.subtract(const Duration(hours: 6)),
        createdAt: now,
        updatedAt: now,
      ),
      Cattle(
        id: '2',
        tagNumber: 'C002',
        name: 'Thunder',
        type: CattleType.bull,
        breed: CattleBreed.angus,
        birthDate: now.subtract(const Duration(days: 1500)),
        gender: Gender.male,
        weight: 850,
        healthStatus: HealthStatus.healthy,
        createdAt: now,
        updatedAt: now,
      ),
      Cattle(
        id: '3',
        tagNumber: 'C003',
        name: 'Daisy',
        type: CattleType.cow,
        breed: CattleBreed.jersey,
        birthDate: now.subtract(const Duration(days: 900)),
        gender: Gender.female,
        weight: 450,
        healthStatus: HealthStatus.pregnant,
        createdAt: now,
        updatedAt: now,
      ),
    ];
  }
}
