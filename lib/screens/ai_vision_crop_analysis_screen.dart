import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:io';
import '../services/advanced_ai_vision_service.dart';
import '../models/ai_vision_models.dart';
import '../widgets/ai_vision_widgets.dart';

class AIVisionCropAnalysisScreen extends ConsumerStatefulWidget {
  const AIVisionCropAnalysisScreen({super.key});

  @override
  ConsumerState<AIVisionCropAnalysisScreen> createState() => _AIVisionCropAnalysisScreenState();
}

class _AIVisionCropAnalysisScreenState extends ConsumerState<AIVisionCropAnalysisScreen>
    with TickerProviderStateMixin {
  final AIVisionService _aiVisionService = AIVisionService.instance;
  final ImagePicker _imagePicker = ImagePicker();
  
  late TabController _tabController;
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  
  bool _isLoading = false;
  bool _isInitialized = false;
  bool _isCameraActive = false;
  
  CropDiseaseAnalysis? _diseaseAnalysis;
  CropHealthAnalysis? _healthAnalysis;
  YieldPrediction? _yieldPrediction;
  
  CropType _selectedCropType = CropType.rice;
  double _fieldArea = 1.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _initializeAI();
    _initializeCamera();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _initializeAI() async {
    setState(() => _isLoading = true);
    try {
      await _aiVisionService.initializeAIModels();
      setState(() => _isInitialized = true);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('AI initialization failed: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        _cameraController = CameraController(
          _cameras!.first,
          ResolutionPreset.high,
        );
        await _cameraController!.initialize();
        if (mounted) {
          setState(() {});
        }
      }
    } catch (e) {
      print('Camera initialization error: $e');
    }
  }

  Future<void> _analyzeFromCamera() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    setState(() => _isLoading = true);
    try {
      final image = await _cameraController!.takePicture();
      final file = File(image.path);
      await _performAnalysis(file);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Camera capture failed: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _analyzeFromGallery() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _isLoading = true);
      try {
        final file = File(pickedFile.path);
        await _performAnalysis(file);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Image analysis failed: $e')),
          );
        }
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _performAnalysis(File imageFile) async {
    try {
      // Convert File to XFile for web compatibility
      final xFile = XFile(imageFile.path);
      
      // Perform all three types of analysis
      final futures = await Future.wait([
        _aiVisionService.analyzeCropDisease(xFile),
        _aiVisionService.analyzeCropHealth(xFile, _selectedCropType),
        _aiVisionService.predictYieldFromImage(
          xFile,
          _selectedCropType,
          _fieldArea,
          {'previousYield': 2.5, 'soilType': 'loamy'},
        ),
      ]);

      setState(() {
        _diseaseAnalysis = futures[0] as CropDiseaseAnalysis;
        _healthAnalysis = futures[1] as CropHealthAnalysis;
        _yieldPrediction = futures[2] as YieldPrediction;
      });
    } catch (e) {
      throw Exception('Analysis failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Vision Crop Analysis',
          style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
        ),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: _isCameraActive ? _analyzeFromCamera : null,
            icon: const Icon(Icons.camera_alt),
          ),
          IconButton(
            onPressed: _analyzeFromGallery,
            icon: const Icon(Icons.photo_library),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.biotech), text: 'Disease'),
            Tab(icon: Icon(Icons.health_and_safety), text: 'Health'),
            Tab(icon: Icon(Icons.trending_up), text: 'Yield'),
            Tab(icon: Icon(Icons.video_call), text: 'Live'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _buildParameterSelection(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildDiseaseAnalysisTab(),
                      _buildHealthAnalysisTab(),
                      _buildYieldPredictionTab(),
                      _buildLiveAnalysisTab(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildParameterSelection() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<CropType>(
                  value: _selectedCropType,
                  onChanged: (value) => setState(() => _selectedCropType = value!),
                  decoration: const InputDecoration(
                    labelText: 'Crop Type',
                    border: OutlineInputBorder(),
                  ),
                  items: CropType.values.map((crop) {
                    return DropdownMenuItem(
                      value: crop,
                      child: Text('${crop.icon} ${crop.displayName}'),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  initialValue: _fieldArea.toString(),
                  onChanged: (value) => _fieldArea = double.tryParse(value) ?? 1.0,
                  decoration: const InputDecoration(
                    labelText: 'Field Area (hectares)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiseaseAnalysisTab() {
    if (_diseaseAnalysis == null) {
      return _buildEmptyState('Take a photo to analyze crop diseases');
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          DiseaseAnalysisCard(analysis: _diseaseAnalysis!),
          const SizedBox(height: 16),
          TreatmentRecommendationsCard(
            recommendations: _diseaseAnalysis!.treatmentRecommendations,
          ),
          const SizedBox(height: 16),
          PreventionTipsCard(tips: _diseaseAnalysis!.preventionTips),
        ].map((widget) => widget.animate().fadeIn(delay: Duration(milliseconds: 200)).slideY()).toList(),
      ),
    );
  }

  Widget _buildHealthAnalysisTab() {
    if (_healthAnalysis == null) {
      return _buildEmptyState('Take a photo to analyze crop health');
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          HealthScoreCard(analysis: _healthAnalysis!),
          const SizedBox(height: 16),
          NutrientLevelsCard(analysis: _healthAnalysis!),
          const SizedBox(height: 16),
          ActionItemsCard(actionItems: _healthAnalysis!.actionItems),
        ].map((widget) => widget.animate().fadeIn(delay: Duration(milliseconds: 200)).slideY()).toList(),
      ),
    );
  }

  Widget _buildYieldPredictionTab() {
    if (_yieldPrediction == null) {
      return _buildEmptyState('Take a photo to predict crop yield');
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          YieldPredictionCard(prediction: _yieldPrediction!),
          const SizedBox(height: 16),
          YieldFactorsCard(factors: _yieldPrediction!.factorsAffectingYield),
          const SizedBox(height: 16),
          OptimizationActionsCard(actions: _yieldPrediction!.recommendedActions),
        ].map((widget) => widget.animate().fadeIn(delay: Duration(milliseconds: 200)).slideY()).toList(),
      ),
    );
  }

  Widget _buildLiveAnalysisTab() {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return _buildEmptyState('Camera not available');
    }

    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              CameraPreview(_cameraController!),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: ElevatedButton.icon(
                  onPressed: () => setState(() => _isCameraActive = !_isCameraActive),
                  icon: Icon(_isCameraActive ? Icons.stop : Icons.play_arrow),
                  label: Text(_isCameraActive ? 'Stop Analysis' : 'Start Analysis'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isCameraActive ? Colors.red : Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: _isCameraActive
              ? LiveAnalysisStream(controller: _cameraController!)
              : _buildEmptyState('Start live analysis to see real-time insights'),
        ),
      ],
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.camera_alt_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _analyzeFromCamera,
                icon: const Icon(Icons.camera_alt),
                label: const Text('Camera'),
              ),
              const SizedBox(width: 16),
              OutlinedButton.icon(
                onPressed: _analyzeFromGallery,
                icon: const Icon(Icons.photo_library),
                label: const Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Alias for the service to match the expected naming
typedef AIVisionService = AdvancedAIVisionService;
