import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/irrigation_system.dart';
import '../themes/app_theme.dart';

class IrrigationCalculator extends StatefulWidget {
  const IrrigationCalculator({super.key});

  @override
  State<IrrigationCalculator> createState() => _IrrigationCalculatorState();
}

class _IrrigationCalculatorState extends State<IrrigationCalculator> {
  final _formKey = GlobalKey<FormState>();
  
  // Form controllers
  final _areaController = TextEditingController();
  final _waterRateController = TextEditingController(text: '2.5');
  final _electricityRateController = TextEditingController(text: '6.0');
  final _hoursController = TextEditingController(text: '2');
  final _daysController = TextEditingController(text: '7');
  
  IrrigationType _selectedType = IrrigationType.drip;
  double _calculatedCost = 0.0;
  double _waterUsage = 0.0;
  double _monthlyProjection = 0.0;
  
  @override
  void dispose() {
    _areaController.dispose();
    _waterRateController.dispose();
    _electricityRateController.dispose();
    _hoursController.dispose();
    _daysController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildIrrigationTypeSelector(),
              const SizedBox(height: 24),
              _buildInputFields(),
              const SizedBox(height: 24),
              _buildCalculateButton(),
              const SizedBox(height: 24),
              _buildResults(),
              const SizedBox(height: 24),
              _buildRecommendations(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIrrigationTypeSelector() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceBlue,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Irrigation Type',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: IrrigationType.values.map((type) {
              final isSelected = type == _selectedType;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedType = type;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? AppTheme.primaryBlue 
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppTheme.primaryBlue,
                      width: isSelected ? 0 : 1,
                    ),
                  ),
                  child: Text(
                    type.displayName,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isSelected 
                          ? Colors.white 
                          : AppTheme.primaryBlue,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          Text(
            _selectedType.description,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.eco,
                size: 16,
                color: AppTheme.successGreen,
              ),
              const SizedBox(width: 4),
              Text(
                'Efficiency: ${_selectedType.typicalEfficiency}%',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.successGreen,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.currency_rupee,
                size: 16,
                color: AppTheme.warningOrange,
              ),
              const SizedBox(width: 4),
              Text(
                'Est. ₹${_selectedType.installationCostPerSqMeter}/m²',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.warningOrange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputFields() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Calculation Parameters',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildNumberField(
                  controller: _areaController,
                  label: 'Area (hectares)',
                  icon: Icons.grid_on,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Required';
                    }
                    if (double.tryParse(value!) == null) {
                      return 'Invalid number';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildNumberField(
                  controller: _hoursController,
                  label: 'Hours per day',
                  icon: Icons.schedule,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildNumberField(
                  controller: _daysController,
                  label: 'Days per week',
                  icon: Icons.calendar_today,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Required';
                    }
                    final days = int.tryParse(value!);
                    if (days == null || days < 1 || days > 7) {
                      return '1-7 days';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildNumberField(
                  controller: _waterRateController,
                  label: 'Water rate (₹/L)',
                  icon: Icons.water_drop,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildNumberField(
            controller: _electricityRateController,
            label: 'Electricity rate (₹/kWh)',
            icon: Icons.electric_bolt,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNumberField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppTheme.primaryBlue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppTheme.primaryBlue, width: 2),
        ),
      ),
      validator: validator,
    );
  }

  Widget _buildCalculateButton() {
    return ElevatedButton.icon(
      onPressed: _calculateCost,
      icon: const Icon(Icons.calculate),
      label: const Text('Calculate Cost'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildResults() {
    if (_calculatedCost == 0) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryBlue.withOpacity(0.1),
            AppTheme.accentBlue.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cost Analysis',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildResultCard(
                  'Weekly Cost',
                  '₹${_calculatedCost.toStringAsFixed(2)}',
                  Icons.calendar_view_week,
                  AppTheme.primaryBlue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildResultCard(
                  'Monthly Cost',
                  '₹${_monthlyProjection.toStringAsFixed(2)}',
                  Icons.calendar_month,
                  AppTheme.successGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildResultCard(
                  'Water Usage',
                  '${_waterUsage.toStringAsFixed(1)} L',
                  Icons.water_drop,
                  AppTheme.accentBlue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildResultCard(
                  'Per Hectare',
                  '₹${(_calculatedCost / double.parse(_areaController.text.isNotEmpty ? _areaController.text : "1")).toStringAsFixed(2)}/ha',
                  Icons.grid_on,
                  AppTheme.warningOrange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResultCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
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
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
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

  Widget _buildRecommendations() {
    if (_calculatedCost == 0) {
      return const SizedBox.shrink();
    }

    final recommendations = _getRecommendations();
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceGreen,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb,
                color: AppTheme.primaryGreen,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Recommendations',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...recommendations.map((rec) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_circle,
                  color: AppTheme.successGreen,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    rec,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  void _calculateCost() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final area = double.parse(_areaController.text);
    final waterRate = double.parse(_waterRateController.text);
    final electricityRate = double.parse(_electricityRateController.text);
    final hoursPerDay = double.parse(_hoursController.text);
    final daysPerWeek = int.parse(_daysController.text);

    // Mock irrigation system for calculation
    final mockSystem = IrrigationSystem(
      id: 'calc',
      name: 'Calculator',
      type: _selectedType,
      fieldId: 'calc',
      coverageArea: area,
      waterFlowRate: _getFlowRateForType(_selectedType, area),
      efficiency: _selectedType.typicalEfficiency,
      installationDate: DateTime.now(),
      totalCost: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final weeklyDuration = Duration(hours: (hoursPerDay * daysPerWeek).toInt());
    final weeklyCost = mockSystem.calculateOperationCost(
      weeklyDuration,
      waterRate,
      electricityRate,
    );

    setState(() {
      _calculatedCost = weeklyCost;
      _waterUsage = mockSystem.calculateWaterUsage(weeklyDuration);
      _monthlyProjection = weeklyCost * 4.33; // Average weeks per month
    });
  }

  double _getFlowRateForType(IrrigationType type, double area) {
    // Estimated flow rates based on irrigation type and area
    switch (type) {
      case IrrigationType.drip:
        return area * 200; // 200 L/h per hectare
      case IrrigationType.sprinkler:
        return area * 500; // 500 L/h per hectare
      case IrrigationType.furrow:
        return area * 800; // 800 L/h per hectare
      case IrrigationType.flood:
        return area * 1200; // 1200 L/h per hectare
      case IrrigationType.centerPivot:
        return area * 600; // 600 L/h per hectare
      case IrrigationType.microSpray:
        return area * 300; // 300 L/h per hectare
    }
  }

  List<String> _getRecommendations() {
    final recommendations = <String>[];
    
    if (_selectedType.typicalEfficiency >= 85) {
      recommendations.add('Excellent choice! This system has high water efficiency.');
    } else if (_selectedType.typicalEfficiency >= 70) {
      recommendations.add('Good efficiency. Consider upgrading to drip irrigation for better water savings.');
    } else {
      recommendations.add('Consider upgrading to a more efficient irrigation system to reduce water costs.');
    }
    
    if (_calculatedCost > 1000) {
      recommendations.add('High weekly cost detected. Consider reducing irrigation hours or frequency.');
    }
    
    recommendations.add('Schedule irrigation during early morning to reduce evaporation losses.');
    recommendations.add('Install soil moisture sensors to optimize irrigation timing.');
    recommendations.add('Regular maintenance can improve system efficiency by 10-15%.');
    
    return recommendations;
  }
}
