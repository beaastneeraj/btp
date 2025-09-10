import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CattleScreen extends StatefulWidget {
  const CattleScreen({super.key});

  @override
  State<CattleScreen> createState() => _CattleScreenState();
}

class _CattleScreenState extends State<CattleScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late TabController _tabController;
  String searchQuery = '';
  String selectedCategory = 'All Animals';
  String selectedHealthStatus = 'All Status';

  final List<String> categories = ['All Animals', 'Dairy Cows', 'Bulls', 'Calves', 'Goats', 'Sheep', 'Poultry'];
  final List<String> healthStatuses = ['All Status', 'Healthy', 'Under Treatment', 'Vaccination Due', 'Breeding'];

  final List<Map<String, dynamic>> livestockData = [
    {
      'id': 'C001',
      'name': 'Bella',
      'type': 'Dairy Cow',
      'breed': 'Holstein',
      'age': '4 years',
      'weight': '650 kg',
      'health': 'Healthy',
      'lastCheckup': '2024-09-01',
      'milkProduction': '28 L/day',
      'nextVaccination': '2024-11-15',
      'icon': '🐄',
      'color': const Color(0xFF4CAF50),
    },
    {
      'id': 'C002',
      'name': 'Thunder',
      'type': 'Bull',
      'breed': 'Angus',
      'age': '5 years',
      'weight': '900 kg',
      'health': 'Healthy',
      'lastCheckup': '2024-08-28',
      'milkProduction': 'N/A',
      'nextVaccination': '2024-12-01',
      'icon': '🐂',
      'color': const Color(0xFF2196F3),
    },
    {
      'id': 'C003',
      'name': 'Lily',
      'type': 'Calf',
      'breed': 'Jersey',
      'age': '8 months',
      'weight': '180 kg',
      'health': 'Under Treatment',
      'lastCheckup': '2024-09-15',
      'milkProduction': 'N/A',
      'nextVaccination': '2024-10-20',
      'icon': '🐮',
      'color': const Color(0xFFFF9800),
    },
    {
      'id': 'G001',
      'name': 'Daisy',
      'type': 'Goat',
      'breed': 'Boer',
      'age': '2 years',
      'weight': '45 kg',
      'health': 'Healthy',
      'lastCheckup': '2024-09-10',
      'milkProduction': '3 L/day',
      'nextVaccination': '2024-11-30',
      'icon': '🐐',
      'color': const Color(0xFF9C27B0),
    },
    {
      'id': 'S001',
      'name': 'Woolly',
      'type': 'Sheep',
      'breed': 'Merino',
      'age': '3 years',
      'weight': '70 kg',
      'health': 'Vaccination Due',
      'lastCheckup': '2024-08-20',
      'milkProduction': 'N/A',
      'nextVaccination': '2024-10-15',
      'icon': '🐑',
      'color': const Color(0xFFE91E63),
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _tabController = TabController(length: 4, vsync: this);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar.large(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              title: Text(
                'Livestock Management',
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorScheme.primary,
                        colorScheme.primary.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120, left: 24, right: 24),
                    child: Column(
                      children: [
                        Text(
                          'Health & Care Management',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: colorScheme.onPrimary.withOpacity(0.9),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${_getFilteredLivestock().length} Animals',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: colorScheme.onPrimary.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: colorScheme.onPrimary,
                labelColor: colorScheme.onPrimary,
                unselectedLabelColor: colorScheme.onPrimary.withOpacity(0.7),
                labelStyle: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500),
                tabs: const [
                  Tab(text: 'Animals'),
                  Tab(text: 'Health'),
                  Tab(text: 'Records'),
                  Tab(text: 'Care'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildAnimalsTab(),
            _buildHealthTab(),
            _buildRecordsTab(),
            _buildCareTab(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddAnimalDialog,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        icon: const Icon(Icons.add),
        label: Text(
          'Add Animal',
          style: GoogleFonts.roboto(),
        ),
      ),
    );
  }

  Widget _buildAnimalsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchAndFilters(),
          const SizedBox(height: 24),
          _buildOverviewCards(),
          const SizedBox(height: 24),
          _buildAnimalsList(),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilters() {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search & Filter',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => setState(() => searchQuery = value),
              decoration: InputDecoration(
                hintText: 'Search animals by name or ID...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedCategory,
                    decoration: InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    items: categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category, style: GoogleFonts.roboto()),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedHealthStatus,
                    decoration: InputDecoration(
                      labelText: 'Health Status',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    items: healthStatuses.map((String status) {
                      return DropdownMenuItem<String>(
                        value: status,
                        child: Text(status, style: GoogleFonts.roboto()),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedHealthStatus = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCards() {
    final healthyCount = livestockData.where((animal) => animal['health'] == 'Healthy').length;
    final treatmentCount = livestockData.where((animal) => animal['health'] == 'Under Treatment').length;
    final vaccinationDueCount = livestockData.where((animal) => animal['health'] == 'Vaccination Due').length;
    final totalAnimals = livestockData.length;

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: [
        _buildOverviewCard('Total Animals', '$totalAnimals', Icons.pets, Colors.blue),
        _buildOverviewCard('Healthy', '$healthyCount', Icons.favorite, Colors.green),
        _buildOverviewCard('Treatment', '$treatmentCount', Icons.medical_services, Colors.orange),
        _buildOverviewCard('Vaccination Due', '$vaccinationDueCount', Icons.schedule, Colors.red),
      ],
    );
  }

  Widget _buildOverviewCard(String title, String count, IconData icon, Color color) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              count,
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalsList() {
    final filteredAnimals = _getFilteredLivestock();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Animal List',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredAnimals.length,
          itemBuilder: (context, index) {
            final animal = filteredAnimals[index];
            return Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: (animal['color'] as Color).withOpacity(0.1),
                  radius: 30,
                  child: Text(
                    animal['icon'],
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                title: Text(
                  '${animal['name']} (${animal['id']})',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      '${animal['type']} • ${animal['breed']} • ${animal['age']}',
                      style: GoogleFonts.roboto(fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getHealthStatusColor(animal['health']).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            animal['health'],
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: _getHealthStatusColor(animal['health']),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          animal['weight'],
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
                onTap: () => _showAnimalDetails(animal),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildHealthTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Health Management',
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          _buildHealthAlerts(),
          const SizedBox(height: 24),
          _buildVaccinationSchedule(),
          const SizedBox(height: 24),
          _buildHealthReports(),
        ],
      ),
    );
  }

  Widget _buildHealthAlerts() {
    final treatmentAnimals = livestockData.where((animal) => 
      animal['health'] == 'Under Treatment' || animal['health'] == 'Vaccination Due').toList();

    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.errorContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.warning,
                  color: Theme.of(context).colorScheme.error,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  'Health Alerts',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (treatmentAnimals.isEmpty)
              Text(
                'No health alerts at this time.',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onErrorContainer.withOpacity(0.8),
                ),
              )
            else
              ...treatmentAnimals.map((animal) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${animal['name']} (${animal['id']}) - ${animal['health']}',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              )).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildVaccinationSchedule() {
    final upcomingVaccinations = livestockData.where((animal) => 
      DateTime.parse(animal['nextVaccination']).isAfter(DateTime.now())).toList();

    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upcoming Vaccinations',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...upcomingVaccinations.map((animal) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Text(animal['icon'], style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${animal['name']} (${animal['id']})',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Due: ${animal['nextVaccination']}',
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.schedule, size: 20),
                  ),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthReports() {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Health Reports',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Generate comprehensive health reports for veterinary consultation and record keeping.',
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.health_and_safety),
                label: Text(
                  'Generate Health Report',
                  style: GoogleFonts.roboto(),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
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
    );
  }

  Widget _buildRecordsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Animal Records',
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Detailed animal records and history will be displayed here.',
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCareTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Animal Care',
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Care guidelines and feeding schedules will be displayed here.',
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getFilteredLivestock() {
    return livestockData.where((animal) {
      final matchesSearch = searchQuery.isEmpty ||
          animal['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          animal['id'].toLowerCase().contains(searchQuery.toLowerCase());
      
      final matchesCategory = selectedCategory == 'All Animals' ||
          animal['type'] == selectedCategory.replaceAll('s', '').trim();
      
      final matchesHealth = selectedHealthStatus == 'All Status' ||
          animal['health'] == selectedHealthStatus;
      
      return matchesSearch && matchesCategory && matchesHealth;
    }).toList();
  }

  Color _getHealthStatusColor(String status) {
    switch (status) {
      case 'Healthy':
        return Colors.green;
      case 'Under Treatment':
        return Colors.orange;
      case 'Vaccination Due':
        return Colors.red;
      case 'Breeding':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  void _showAnimalDetails(Map<String, dynamic> animal) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    animal['icon'],
                    style: const TextStyle(fontSize: 32),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${animal['name']} (${animal['id']})',
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${animal['type']} • ${animal['breed']}',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildAnimalDetailCard('Basic Information', [
                'Age: ${animal['age']}',
                'Weight: ${animal['weight']}',
                'Breed: ${animal['breed']}',
                'Health Status: ${animal['health']}',
              ]),
              const SizedBox(height: 16),
              _buildAnimalDetailCard('Medical History', [
                'Last Checkup: ${animal['lastCheckup']}',
                'Next Vaccination: ${animal['nextVaccination']}',
                if (animal['milkProduction'] != 'N/A') 'Milk Production: ${animal['milkProduction']}',
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimalDetailCard(String title, List<String> details) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...details.map((detail) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                detail,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }

  void _showAddAnimalDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Add New Animal',
          style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
        ),
        content: Text(
          'Animal registration form will be displayed here.',
          style: GoogleFonts.roboto(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.roboto()),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Add Animal', style: GoogleFonts.roboto()),
          ),
        ],
      ),
    );
  }
}
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
