import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/crop_model.dart';
import '../themes/material3_theme.dart';

// Enhanced Crop Form Screen with Material 3 Design
class EnhancedCropFormScreen extends ConsumerStatefulWidget {
  final CropModel? crop;
  final Function(CropModel) onSave;
  final String? fieldId;

  const EnhancedCropFormScreen({
    super.key,
    this.crop,
    required this.onSave,
    this.fieldId,
  });

  @override
  ConsumerState<EnhancedCropFormScreen> createState() => _EnhancedCropFormScreenState();
}

class _EnhancedCropFormScreenState extends ConsumerState<EnhancedCropFormScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  
  // Form controllers
  final _cropNameController = TextEditingController();
  final _varietyController = TextEditingController();
  final _yieldController = TextEditingController();
  final _notesController = TextEditingController();
  
  // Form data
  DateTime? _plantingDate;
  DateTime? _harvestDate;
  String _selectedCropType = 'Cereal';
  String _selectedSeason = 'Kharif';
  bool _isIrrigated = true;
  double _expectedYield = 0.0;
  
  // Common crop types for Indian farming
  final List<String> _cropTypes = [
    'Cereal', 'Pulse', 'Oilseed', 'Vegetable', 'Fruit', 'Spice', 'Cash Crop'
  ];
  
  // Seasons in Indian agriculture
  final List<String> _seasons = ['Kharif', 'Rabi', 'Zaid'];
  
  // Common crop varieties by type
  final Map<String, List<String>> _cropVarieties = {
    'Cereal': ['Rice', 'Wheat', 'Maize', 'Barley', 'Millet', 'Sorghum'],
    'Pulse': ['Arhar', 'Moong', 'Urad', 'Gram', 'Masur', 'Peas'],
    'Oilseed': ['Groundnut', 'Mustard', 'Sunflower', 'Sesame', 'Castor'],
    'Vegetable': ['Tomato', 'Onion', 'Potato', 'Cabbage', 'Cauliflower', 'Brinjal'],
    'Fruit': ['Mango', 'Banana', 'Orange', 'Apple', 'Grapes', 'Pomegranate'],
    'Spice': ['Turmeric', 'Coriander', 'Cumin', 'Fenugreek', 'Chili'],
    'Cash Crop': ['Cotton', 'Sugarcane', 'Tobacco', 'Jute']
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );
    
    // Initialize form with existing data if editing
    if (widget.crop != null) {
      _cropNameController.text = widget.crop!.cropName;
      _varietyController.text = widget.crop!.variety;
      _yieldController.text = widget.crop!.yieldAmount?.toString() ?? '';
      _plantingDate = widget.crop!.plantingDate;
      _harvestDate = widget.crop!.harvestDate;
    }
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _cropNameController.dispose();
    _varietyController.dispose();
    _yieldController.dispose();
    _notesController.dispose();
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: _buildAppBar(colorScheme),
      body: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 0.1),
          end: Offset.zero,
        ).animate(_slideAnimation),
        child: FadeTransition(
          opacity: _slideAnimation,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTabBar(colorScheme),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildBasicInfoTab(colorScheme),
                      _buildPlanningTab(colorScheme),
                      _buildExpectationsTab(colorScheme),
                    ],
                  ),
                ),
                _buildActionButtons(colorScheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(ColorScheme colorScheme) {
    return AppBar(
      title: Text(
        widget.crop == null ? 'Add New Crop' : 'Edit Crop',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: colorScheme.surface,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.close),
      ),
    );
  }

  Widget _buildTabBar(ColorScheme colorScheme) {
    return TabBar(
      controller: _tabController,
      labelColor: colorScheme.primary,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      indicatorColor: colorScheme.primary,
      tabs: [
        Tab(text: 'Basic Info', icon: Icon(Icons.info_outline)),
        Tab(text: 'Planning', icon: Icon(Icons.calendar_today)),
        Tab(text: 'Expectations', icon: Icon(Icons.trending_up)),
      ],
    );
  }

  Widget _buildBasicInfoTab(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crop Information',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                
                // Crop Type Selection
                DropdownButtonFormField<String>(
                  value: _selectedCropType,
                  decoration: InputDecoration(
                    labelText: 'Crop Type',
                    prefixIcon: Icon(Icons.category),
                  ),
                  items: _cropTypes.map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  )).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCropType = value!;
                      _cropNameController.clear(); // Clear when type changes
                    });
                  },
                  validator: (value) => value == null ? 'Please select crop type' : null,
                ),
                SizedBox(height: 16),
                
                // Crop Name Selection based on type
                DropdownButtonFormField<String>(
                  value: _cropVarieties[_selectedCropType]!.contains(_cropNameController.text) 
                      ? _cropNameController.text 
                      : null,
                  decoration: InputDecoration(
                    labelText: 'Crop Name',
                    prefixIcon: Icon(Icons.eco),
                  ),
                  items: _cropVarieties[_selectedCropType]!.map((crop) => DropdownMenuItem(
                    value: crop,
                    child: Text(crop),
                  )).toList(),
                  onChanged: (value) {
                    setState(() {
                      _cropNameController.text = value!;
                    });
                  },
                  validator: (value) => value == null ? 'Please select crop name' : null,
                ),
                SizedBox(height: 16),
                
                // Variety Input
                TextFormField(
                  controller: _varietyController,
                  decoration: InputDecoration(
                    labelText: 'Variety/Breed',
                    prefixIcon: Icon(Icons.grass),
                    hintText: 'e.g., Basmati, IR64, Local variety',
                  ),
                  validator: (value) => value?.isEmpty ?? true ? 'Please enter crop variety' : null,
                ),
                SizedBox(height: 16),
                
                // Season Selection
                DropdownButtonFormField<String>(
                  value: _selectedSeason,
                  decoration: InputDecoration(
                    labelText: 'Growing Season',
                    prefixIcon: Icon(Icons.wb_sunny),
                  ),
                  items: _seasons.map((season) => DropdownMenuItem(
                    value: season,
                    child: Text(season),
                  )).toList(),
                  onChanged: (value) => setState(() => _selectedSeason = value!),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanningTab(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crop Schedule',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                
                // Planting Date
                InkWell(
                  onTap: () => _selectPlantingDate(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Planting Date',
                      prefixIcon: Icon(Icons.event),
                      errorText: _plantingDate == null ? 'Please select planting date' : null,
                    ),
                    child: Text(
                      _plantingDate != null
                          ? DateFormat('dd MMM yyyy').format(_plantingDate!)
                          : 'Select planting date',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                
                // Expected Harvest Date
                InkWell(
                  onTap: () => _selectHarvestDate(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Expected Harvest Date',
                      prefixIcon: Icon(Icons.event_available),
                    ),
                    child: Text(
                      _harvestDate != null
                          ? DateFormat('dd MMM yyyy').format(_harvestDate!)
                          : 'Select harvest date (optional)',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                
                // Irrigation switch
                SwitchListTile(
                  title: Text('Irrigated Crop'),
                  subtitle: Text('Does this crop have irrigation facility?'),
                  value: _isIrrigated,
                  onChanged: (value) => setState(() => _isIrrigated = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpectationsTab(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yield Expectations',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                
                // Expected Yield
                TextFormField(
                  controller: _yieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Expected Yield (kg/hectare)',
                    prefixIcon: Icon(Icons.agriculture),
                    suffixText: 'kg/ha',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _expectedYield = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
                SizedBox(height: 16),
                
                // Yield indicator
                if (_expectedYield > 0) ...[
                  Text(
                    'Yield Category',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: 8),
                  _buildYieldIndicator(colorScheme),
                  SizedBox(height: 16),
                ],
                
                // Notes
                TextFormField(
                  controller: _notesController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Additional Notes',
                    prefixIcon: Icon(Icons.notes),
                    hintText: 'Any special considerations, treatments, or observations...',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYieldIndicator(ColorScheme colorScheme) {
    String category;
    Color indicatorColor;
    IconData icon;
    
    if (_expectedYield < 2000) {
      category = 'Low Yield';
      indicatorColor = colorScheme.error;
      icon = Icons.trending_down;
    } else if (_expectedYield < 4000) {
      category = 'Moderate Yield';
      indicatorColor = Colors.orange;
      icon = Icons.trending_flat;
    } else {
      category = 'High Yield';
      indicatorColor = Colors.green;
      icon = Icons.trending_up;
    }
    
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: indicatorColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: indicatorColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: indicatorColor),
          SizedBox(width: 8),
          Text(
            category,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: indicatorColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(color: colorScheme.outline.withOpacity(0.2)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: FilledButton(
              onPressed: _saveCrop,
              child: Text(widget.crop == null ? 'Add Crop' : 'Update Crop'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectPlantingDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _plantingDate ?? DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (date != null) {
      setState(() => _plantingDate = date);
    }
  }

  Future<void> _selectHarvestDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _harvestDate ?? DateTime.now().add(Duration(days: 90)),
      firstDate: _plantingDate ?? DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (date != null) {
      setState(() => _harvestDate = date);
    }
  }

  void _saveCrop() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_plantingDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select planting date'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        return;
      }
      
      try {
        final crop = CropModel(
          id: widget.crop?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
          fieldId: widget.fieldId ?? widget.crop?.fieldId ?? '',
          cropName: _cropNameController.text.trim(),
          variety: _varietyController.text.trim(),
          plantingDate: _plantingDate!,
          harvestDate: _harvestDate,
          yieldAmount: _yieldController.text.trim().isNotEmpty 
              ? double.tryParse(_yieldController.text.trim())
              : null,
        );

        widget.onSave(crop);
        Navigator.pop(context);
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.crop == null ? 'Crop added successfully!' : 'Crop updated successfully!'),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving crop: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }
}