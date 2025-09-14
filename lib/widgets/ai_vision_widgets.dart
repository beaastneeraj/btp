import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:camera/camera.dart';
import '../models/ai_vision_models.dart';
import '../services/advanced_ai_vision_service.dart';

// Disease Analysis Card
class DiseaseAnalysisCard extends StatelessWidget {
  final CropDiseaseAnalysis analysis;

  const DiseaseAnalysisCard({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.biotech, color: colorScheme.primary, size: 28),
                const SizedBox(width: 12),
                Text(
                  'Disease Analysis',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildResultRow('Disease Detected', analysis.diseaseName, Icons.bug_report),
            _buildResultRow('Confidence', '${(analysis.confidence * 100).toStringAsFixed(1)}%', Icons.analytics),
            _buildResultRow('Severity', analysis.severity, Icons.warning),
            _buildResultRow('Estimated Damage', '${analysis.estimatedDamage.toStringAsFixed(1)}%', Icons.assessment),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: analysis.confidence,
              backgroundColor: colorScheme.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(
                analysis.confidence > 0.8 ? Colors.green :
                analysis.confidence > 0.6 ? Colors.orange : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: GoogleFonts.roboto(fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.roboto(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}

// Treatment Recommendations Card
class TreatmentRecommendationsCard extends StatelessWidget {
  final List<TreatmentRecommendation> recommendations;

  const TreatmentRecommendationsCard({super.key, required this.recommendations});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.medical_services, color: colorScheme.primary, size: 28),
                const SizedBox(width: 12),
                Text(
                  'Treatment Recommendations',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...recommendations.map((treatment) => _buildTreatmentTile(treatment, context)),
          ],
        ),
      ),
    );
  }

  Widget _buildTreatmentTile(TreatmentRecommendation treatment, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            treatment.treatment,
            style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildDetailRow('Dosage', treatment.dosage),
          _buildDetailRow('Frequency', treatment.frequency),
          _buildDetailRow('Duration', treatment.duration),
          _buildDetailRow('Estimated Cost', '₹${treatment.cost.toStringAsFixed(0)}'),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey[600]),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.roboto(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

// Prevention Tips Card
class PreventionTipsCard extends StatelessWidget {
  final List<String> tips;

  const PreventionTipsCard({super.key, required this.tips});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.shield, color: colorScheme.primary, size: 28),
                const SizedBox(width: 12),
                Text(
                  'Prevention Tips',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...tips.map((tip) => _buildTipTile(tip)),
          ],
        ),
      ),
    );
  }

  Widget _buildTipTile(String tip) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb_outline, size: 16, color: Colors.amber),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              tip,
              style: GoogleFonts.roboto(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

// Health Score Card
class HealthScoreCard extends StatelessWidget {
  final CropHealthAnalysis analysis;

  const HealthScoreCard({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final healthColor = _getHealthColor(analysis.overallHealthScore);

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.health_and_safety, color: colorScheme.primary, size: 28),
                const SizedBox(width: 12),
                Text(
                  'Overall Health Score',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircularProgressIndicator(
                    value: analysis.overallHealthScore / 100,
                    strokeWidth: 8,
                    backgroundColor: colorScheme.surfaceVariant,
                    valueColor: AlwaysStoppedAnimation<Color>(healthColor),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '${analysis.overallHealthScore.toStringAsFixed(0)}%',
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: healthColor,
                      ),
                    ),
                    Text(
                      _getHealthStatus(analysis.overallHealthScore),
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Growth Stage: ${analysis.growthStage}',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getHealthColor(double score) {
    if (score >= 80) return Colors.green;
    if (score >= 60) return Colors.orange;
    return Colors.red;
  }

  String _getHealthStatus(double score) {
    if (score >= 80) return 'Excellent';
    if (score >= 60) return 'Good';
    if (score >= 40) return 'Fair';
    return 'Poor';
  }
}

// Nutrient Levels Card
class NutrientLevelsCard extends StatelessWidget {
  final CropHealthAnalysis analysis;

  const NutrientLevelsCard({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nutrient Levels',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _buildNutrientRow('Nitrogen (N)', analysis.nitrogenLevel),
            _buildNutrientRow('Phosphorus (P)', analysis.phosphorusLevel),
            _buildNutrientRow('Potassium (K)', analysis.potassiumLevel),
            const SizedBox(height: 16),
            _buildStressRow('Water Stress', analysis.waterStress),
            _buildDamageRow('Pest Damage', analysis.pestDamage),
          ],
        ),
      ),
    );
  }

  Widget _buildNutrientRow(String nutrient, NutrientLevel level) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              nutrient,
              style: GoogleFonts.roboto(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Color(int.parse(level.colorCode.substring(1), radix: 16) + 0xFF000000).withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Color(int.parse(level.colorCode.substring(1), radix: 16) + 0xFF000000),
                  width: 1,
                ),
              ),
              child: Text(
                level.displayName,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(int.parse(level.colorCode.substring(1), radix: 16) + 0xFF000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStressRow(String label, StressLevel level) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: GoogleFonts.roboto(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Color(int.parse(level.colorCode.substring(1), radix: 16) + 0xFF000000).withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Color(int.parse(level.colorCode.substring(1), radix: 16) + 0xFF000000),
                  width: 1,
                ),
              ),
              child: Text(
                level.displayName,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(int.parse(level.colorCode.substring(1), radix: 16) + 0xFF000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDamageRow(String label, DamageLevel level) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: GoogleFonts.roboto(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _getDamageColor(level).withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _getDamageColor(level), width: 1),
              ),
              child: Text(
                level.name.toUpperCase(),
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: _getDamageColor(level),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getDamageColor(DamageLevel level) {
    switch (level) {
      case DamageLevel.none:
        return Colors.green;
      case DamageLevel.minimal:
        return Colors.lightGreen;
      case DamageLevel.moderate:
        return Colors.orange;
      case DamageLevel.severe:
        return Colors.red;
    }
  }
}

// Action Items Card
class ActionItemsCard extends StatelessWidget {
  final List<ActionItem> actionItems;

  const ActionItemsCard({super.key, required this.actionItems});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended Actions',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...actionItems.map((item) => _buildActionTile(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(ActionItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 4,
            color: Color(int.parse(item.priority.colorCode.substring(1), radix: 16) + 0xFF000000),
          ),
        ),
        color: Colors.grey[50],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  item.title,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(int.parse(item.priority.colorCode.substring(1), radix: 16) + 0xFF000000).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  item.priority.displayName,
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(int.parse(item.priority.colorCode.substring(1), radix: 16) + 0xFF000000),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            item.description,
            style: GoogleFonts.roboto(fontSize: 14, color: Colors.grey[700]),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.schedule, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                item.timeframe,
                style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(width: 16),
              Icon(Icons.currency_rupee, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                '₹${item.estimatedCost.toStringAsFixed(0)}',
                style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Yield Prediction Card
class YieldPredictionCard extends StatelessWidget {
  final YieldPrediction prediction;

  const YieldPredictionCard({super.key, required this.prediction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yield Prediction',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildYieldMetric(
                    'Expected',
                    prediction.expectedYield,
                    Colors.blue,
                    'tons',
                  ),
                ),
                Expanded(
                  child: _buildYieldMetric(
                    'Minimum',
                    prediction.minYield,
                    Colors.orange,
                    'tons',
                  ),
                ),
                Expanded(
                  child: _buildYieldMetric(
                    'Maximum',
                    prediction.maxYield,
                    Colors.green,
                    'tons',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.attach_money, color: Colors.green[700]),
                  const SizedBox(width: 8),
                  Text(
                    'Estimated Market Value: ₹${prediction.marketValue.toStringAsFixed(0)}',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYieldMetric(String label, double value, Color color, String unit) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.roboto(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${value.toStringAsFixed(1)}',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          unit,
          style: GoogleFonts.roboto(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

// Yield Factors Card
class YieldFactorsCard extends StatelessWidget {
  final List<YieldFactor> factors;

  const YieldFactorsCard({super.key, required this.factors});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Factors Affecting Yield',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...factors.map((factor) => _buildFactorTile(factor)),
          ],
        ),
      ),
    );
  }

  Widget _buildFactorTile(YieldFactor factor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              factor.factor,
              style: GoogleFonts.roboto(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: factor.impact,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    factor.impact > 0.7 ? Colors.green :
                    factor.impact > 0.4 ? Colors.orange : Colors.red,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  factor.description,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Optimization Actions Card
class OptimizationActionsCard extends StatelessWidget {
  final List<String> actions;

  const OptimizationActionsCard({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Optimization Actions',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...actions.map((action) => _buildActionTile(action)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.arrow_forward, size: 16, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              action,
              style: GoogleFonts.roboto(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

// Live Analysis Stream Widget
class LiveAnalysisStream extends StatefulWidget {
  final CameraController controller;

  const LiveAnalysisStream({super.key, required this.controller});

  @override
  State<LiveAnalysisStream> createState() => _LiveAnalysisStreamState();
}

class _LiveAnalysisStreamState extends State<LiveAnalysisStream> {
  final AdvancedAIVisionService _aiService = AdvancedAIVisionService.instance;
  RealTimeCropAnalysis? _latestAnalysis;

  @override
  void initState() {
    super.initState();
    _startAnalysis();
  }

  void _startAnalysis() {
    _aiService.getRealTimeCropAnalysis(widget.controller).listen((analysis) {
      if (mounted) {
        setState(() {
          _latestAnalysis = analysis;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_latestAnalysis == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildMetricRow('Health Score', '${_latestAnalysis!.healthScore.toStringAsFixed(0)}%', Icons.health_and_safety),
          _buildMetricRow('Moisture Level', '${_latestAnalysis!.moistureLevel.toStringAsFixed(0)}%', Icons.water_drop),
          _buildMetricRow('Pest Activity', _latestAnalysis!.pestActivity, Icons.bug_report),
          _buildMetricRow('Growth Rate', _latestAnalysis!.growthRate, Icons.trending_up),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: Row(
              children: [
                Icon(Icons.lightbulb, color: Colors.blue[700]),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _latestAnalysis!.recommendedAction,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      color: Colors.blue[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: GoogleFonts.roboto(fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.roboto(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
