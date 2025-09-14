// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_vision_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CropDiseaseAnalysis _$CropDiseaseAnalysisFromJson(Map<String, dynamic> json) {
  return _CropDiseaseAnalysis.fromJson(json);
}

/// @nodoc
mixin _$CropDiseaseAnalysis {
  String get diseaseName => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  String get severity => throw _privateConstructorUsedError;
  List<TreatmentRecommendation> get treatmentRecommendations =>
      throw _privateConstructorUsedError;
  double get estimatedDamage => throw _privateConstructorUsedError;
  List<String> get preventionTips => throw _privateConstructorUsedError;
  DateTime get analysisDate => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this CropDiseaseAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CropDiseaseAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CropDiseaseAnalysisCopyWith<CropDiseaseAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropDiseaseAnalysisCopyWith<$Res> {
  factory $CropDiseaseAnalysisCopyWith(
          CropDiseaseAnalysis value, $Res Function(CropDiseaseAnalysis) then) =
      _$CropDiseaseAnalysisCopyWithImpl<$Res, CropDiseaseAnalysis>;
  @useResult
  $Res call(
      {String diseaseName,
      double confidence,
      String severity,
      List<TreatmentRecommendation> treatmentRecommendations,
      double estimatedDamage,
      List<String> preventionTips,
      DateTime analysisDate,
      String imageUrl});
}

/// @nodoc
class _$CropDiseaseAnalysisCopyWithImpl<$Res, $Val extends CropDiseaseAnalysis>
    implements $CropDiseaseAnalysisCopyWith<$Res> {
  _$CropDiseaseAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CropDiseaseAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diseaseName = null,
    Object? confidence = null,
    Object? severity = null,
    Object? treatmentRecommendations = null,
    Object? estimatedDamage = null,
    Object? preventionTips = null,
    Object? analysisDate = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      diseaseName: null == diseaseName
          ? _value.diseaseName
          : diseaseName // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      treatmentRecommendations: null == treatmentRecommendations
          ? _value.treatmentRecommendations
          : treatmentRecommendations // ignore: cast_nullable_to_non_nullable
              as List<TreatmentRecommendation>,
      estimatedDamage: null == estimatedDamage
          ? _value.estimatedDamage
          : estimatedDamage // ignore: cast_nullable_to_non_nullable
              as double,
      preventionTips: null == preventionTips
          ? _value.preventionTips
          : preventionTips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      analysisDate: null == analysisDate
          ? _value.analysisDate
          : analysisDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CropDiseaseAnalysisImplCopyWith<$Res>
    implements $CropDiseaseAnalysisCopyWith<$Res> {
  factory _$$CropDiseaseAnalysisImplCopyWith(_$CropDiseaseAnalysisImpl value,
          $Res Function(_$CropDiseaseAnalysisImpl) then) =
      __$$CropDiseaseAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String diseaseName,
      double confidence,
      String severity,
      List<TreatmentRecommendation> treatmentRecommendations,
      double estimatedDamage,
      List<String> preventionTips,
      DateTime analysisDate,
      String imageUrl});
}

/// @nodoc
class __$$CropDiseaseAnalysisImplCopyWithImpl<$Res>
    extends _$CropDiseaseAnalysisCopyWithImpl<$Res, _$CropDiseaseAnalysisImpl>
    implements _$$CropDiseaseAnalysisImplCopyWith<$Res> {
  __$$CropDiseaseAnalysisImplCopyWithImpl(_$CropDiseaseAnalysisImpl _value,
      $Res Function(_$CropDiseaseAnalysisImpl) _then)
      : super(_value, _then);

  /// Create a copy of CropDiseaseAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diseaseName = null,
    Object? confidence = null,
    Object? severity = null,
    Object? treatmentRecommendations = null,
    Object? estimatedDamage = null,
    Object? preventionTips = null,
    Object? analysisDate = null,
    Object? imageUrl = null,
  }) {
    return _then(_$CropDiseaseAnalysisImpl(
      diseaseName: null == diseaseName
          ? _value.diseaseName
          : diseaseName // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      treatmentRecommendations: null == treatmentRecommendations
          ? _value._treatmentRecommendations
          : treatmentRecommendations // ignore: cast_nullable_to_non_nullable
              as List<TreatmentRecommendation>,
      estimatedDamage: null == estimatedDamage
          ? _value.estimatedDamage
          : estimatedDamage // ignore: cast_nullable_to_non_nullable
              as double,
      preventionTips: null == preventionTips
          ? _value._preventionTips
          : preventionTips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      analysisDate: null == analysisDate
          ? _value.analysisDate
          : analysisDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CropDiseaseAnalysisImpl implements _CropDiseaseAnalysis {
  const _$CropDiseaseAnalysisImpl(
      {required this.diseaseName,
      required this.confidence,
      required this.severity,
      required final List<TreatmentRecommendation> treatmentRecommendations,
      required this.estimatedDamage,
      required final List<String> preventionTips,
      required this.analysisDate,
      required this.imageUrl})
      : _treatmentRecommendations = treatmentRecommendations,
        _preventionTips = preventionTips;

  factory _$CropDiseaseAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$CropDiseaseAnalysisImplFromJson(json);

  @override
  final String diseaseName;
  @override
  final double confidence;
  @override
  final String severity;
  final List<TreatmentRecommendation> _treatmentRecommendations;
  @override
  List<TreatmentRecommendation> get treatmentRecommendations {
    if (_treatmentRecommendations is EqualUnmodifiableListView)
      return _treatmentRecommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_treatmentRecommendations);
  }

  @override
  final double estimatedDamage;
  final List<String> _preventionTips;
  @override
  List<String> get preventionTips {
    if (_preventionTips is EqualUnmodifiableListView) return _preventionTips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preventionTips);
  }

  @override
  final DateTime analysisDate;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'CropDiseaseAnalysis(diseaseName: $diseaseName, confidence: $confidence, severity: $severity, treatmentRecommendations: $treatmentRecommendations, estimatedDamage: $estimatedDamage, preventionTips: $preventionTips, analysisDate: $analysisDate, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CropDiseaseAnalysisImpl &&
            (identical(other.diseaseName, diseaseName) ||
                other.diseaseName == diseaseName) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            const DeepCollectionEquality().equals(
                other._treatmentRecommendations, _treatmentRecommendations) &&
            (identical(other.estimatedDamage, estimatedDamage) ||
                other.estimatedDamage == estimatedDamage) &&
            const DeepCollectionEquality()
                .equals(other._preventionTips, _preventionTips) &&
            (identical(other.analysisDate, analysisDate) ||
                other.analysisDate == analysisDate) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      diseaseName,
      confidence,
      severity,
      const DeepCollectionEquality().hash(_treatmentRecommendations),
      estimatedDamage,
      const DeepCollectionEquality().hash(_preventionTips),
      analysisDate,
      imageUrl);

  /// Create a copy of CropDiseaseAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CropDiseaseAnalysisImplCopyWith<_$CropDiseaseAnalysisImpl> get copyWith =>
      __$$CropDiseaseAnalysisImplCopyWithImpl<_$CropDiseaseAnalysisImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CropDiseaseAnalysisImplToJson(
      this,
    );
  }
}

abstract class _CropDiseaseAnalysis implements CropDiseaseAnalysis {
  const factory _CropDiseaseAnalysis(
      {required final String diseaseName,
      required final double confidence,
      required final String severity,
      required final List<TreatmentRecommendation> treatmentRecommendations,
      required final double estimatedDamage,
      required final List<String> preventionTips,
      required final DateTime analysisDate,
      required final String imageUrl}) = _$CropDiseaseAnalysisImpl;

  factory _CropDiseaseAnalysis.fromJson(Map<String, dynamic> json) =
      _$CropDiseaseAnalysisImpl.fromJson;

  @override
  String get diseaseName;
  @override
  double get confidence;
  @override
  String get severity;
  @override
  List<TreatmentRecommendation> get treatmentRecommendations;
  @override
  double get estimatedDamage;
  @override
  List<String> get preventionTips;
  @override
  DateTime get analysisDate;
  @override
  String get imageUrl;

  /// Create a copy of CropDiseaseAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CropDiseaseAnalysisImplCopyWith<_$CropDiseaseAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TreatmentRecommendation _$TreatmentRecommendationFromJson(
    Map<String, dynamic> json) {
  return _TreatmentRecommendation.fromJson(json);
}

/// @nodoc
mixin _$TreatmentRecommendation {
  String get treatment => throw _privateConstructorUsedError;
  String get dosage => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;

  /// Serializes this TreatmentRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreatmentRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreatmentRecommendationCopyWith<TreatmentRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreatmentRecommendationCopyWith<$Res> {
  factory $TreatmentRecommendationCopyWith(TreatmentRecommendation value,
          $Res Function(TreatmentRecommendation) then) =
      _$TreatmentRecommendationCopyWithImpl<$Res, TreatmentRecommendation>;
  @useResult
  $Res call(
      {String treatment,
      String dosage,
      String frequency,
      String duration,
      double cost});
}

/// @nodoc
class _$TreatmentRecommendationCopyWithImpl<$Res,
        $Val extends TreatmentRecommendation>
    implements $TreatmentRecommendationCopyWith<$Res> {
  _$TreatmentRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreatmentRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? treatment = null,
    Object? dosage = null,
    Object? frequency = null,
    Object? duration = null,
    Object? cost = null,
  }) {
    return _then(_value.copyWith(
      treatment: null == treatment
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreatmentRecommendationImplCopyWith<$Res>
    implements $TreatmentRecommendationCopyWith<$Res> {
  factory _$$TreatmentRecommendationImplCopyWith(
          _$TreatmentRecommendationImpl value,
          $Res Function(_$TreatmentRecommendationImpl) then) =
      __$$TreatmentRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String treatment,
      String dosage,
      String frequency,
      String duration,
      double cost});
}

/// @nodoc
class __$$TreatmentRecommendationImplCopyWithImpl<$Res>
    extends _$TreatmentRecommendationCopyWithImpl<$Res,
        _$TreatmentRecommendationImpl>
    implements _$$TreatmentRecommendationImplCopyWith<$Res> {
  __$$TreatmentRecommendationImplCopyWithImpl(
      _$TreatmentRecommendationImpl _value,
      $Res Function(_$TreatmentRecommendationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreatmentRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? treatment = null,
    Object? dosage = null,
    Object? frequency = null,
    Object? duration = null,
    Object? cost = null,
  }) {
    return _then(_$TreatmentRecommendationImpl(
      treatment: null == treatment
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreatmentRecommendationImpl implements _TreatmentRecommendation {
  const _$TreatmentRecommendationImpl(
      {required this.treatment,
      required this.dosage,
      required this.frequency,
      required this.duration,
      required this.cost});

  factory _$TreatmentRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreatmentRecommendationImplFromJson(json);

  @override
  final String treatment;
  @override
  final String dosage;
  @override
  final String frequency;
  @override
  final String duration;
  @override
  final double cost;

  @override
  String toString() {
    return 'TreatmentRecommendation(treatment: $treatment, dosage: $dosage, frequency: $frequency, duration: $duration, cost: $cost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreatmentRecommendationImpl &&
            (identical(other.treatment, treatment) ||
                other.treatment == treatment) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, treatment, dosage, frequency, duration, cost);

  /// Create a copy of TreatmentRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreatmentRecommendationImplCopyWith<_$TreatmentRecommendationImpl>
      get copyWith => __$$TreatmentRecommendationImplCopyWithImpl<
          _$TreatmentRecommendationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreatmentRecommendationImplToJson(
      this,
    );
  }
}

abstract class _TreatmentRecommendation implements TreatmentRecommendation {
  const factory _TreatmentRecommendation(
      {required final String treatment,
      required final String dosage,
      required final String frequency,
      required final String duration,
      required final double cost}) = _$TreatmentRecommendationImpl;

  factory _TreatmentRecommendation.fromJson(Map<String, dynamic> json) =
      _$TreatmentRecommendationImpl.fromJson;

  @override
  String get treatment;
  @override
  String get dosage;
  @override
  String get frequency;
  @override
  String get duration;
  @override
  double get cost;

  /// Create a copy of TreatmentRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreatmentRecommendationImplCopyWith<_$TreatmentRecommendationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CropHealthAnalysis _$CropHealthAnalysisFromJson(Map<String, dynamic> json) {
  return _CropHealthAnalysis.fromJson(json);
}

/// @nodoc
mixin _$CropHealthAnalysis {
  double get overallHealthScore => throw _privateConstructorUsedError;
  NutrientLevel get nitrogenLevel => throw _privateConstructorUsedError;
  NutrientLevel get phosphorusLevel => throw _privateConstructorUsedError;
  NutrientLevel get potassiumLevel => throw _privateConstructorUsedError;
  StressLevel get waterStress => throw _privateConstructorUsedError;
  DamageLevel get pestDamage => throw _privateConstructorUsedError;
  String get growthStage => throw _privateConstructorUsedError;
  double get yieldPotential => throw _privateConstructorUsedError;
  List<ActionItem> get actionItems => throw _privateConstructorUsedError;
  DateTime get analysisDate => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this CropHealthAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CropHealthAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CropHealthAnalysisCopyWith<CropHealthAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropHealthAnalysisCopyWith<$Res> {
  factory $CropHealthAnalysisCopyWith(
          CropHealthAnalysis value, $Res Function(CropHealthAnalysis) then) =
      _$CropHealthAnalysisCopyWithImpl<$Res, CropHealthAnalysis>;
  @useResult
  $Res call(
      {double overallHealthScore,
      NutrientLevel nitrogenLevel,
      NutrientLevel phosphorusLevel,
      NutrientLevel potassiumLevel,
      StressLevel waterStress,
      DamageLevel pestDamage,
      String growthStage,
      double yieldPotential,
      List<ActionItem> actionItems,
      DateTime analysisDate,
      String imageUrl});
}

/// @nodoc
class _$CropHealthAnalysisCopyWithImpl<$Res, $Val extends CropHealthAnalysis>
    implements $CropHealthAnalysisCopyWith<$Res> {
  _$CropHealthAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CropHealthAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overallHealthScore = null,
    Object? nitrogenLevel = null,
    Object? phosphorusLevel = null,
    Object? potassiumLevel = null,
    Object? waterStress = null,
    Object? pestDamage = null,
    Object? growthStage = null,
    Object? yieldPotential = null,
    Object? actionItems = null,
    Object? analysisDate = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      overallHealthScore: null == overallHealthScore
          ? _value.overallHealthScore
          : overallHealthScore // ignore: cast_nullable_to_non_nullable
              as double,
      nitrogenLevel: null == nitrogenLevel
          ? _value.nitrogenLevel
          : nitrogenLevel // ignore: cast_nullable_to_non_nullable
              as NutrientLevel,
      phosphorusLevel: null == phosphorusLevel
          ? _value.phosphorusLevel
          : phosphorusLevel // ignore: cast_nullable_to_non_nullable
              as NutrientLevel,
      potassiumLevel: null == potassiumLevel
          ? _value.potassiumLevel
          : potassiumLevel // ignore: cast_nullable_to_non_nullable
              as NutrientLevel,
      waterStress: null == waterStress
          ? _value.waterStress
          : waterStress // ignore: cast_nullable_to_non_nullable
              as StressLevel,
      pestDamage: null == pestDamage
          ? _value.pestDamage
          : pestDamage // ignore: cast_nullable_to_non_nullable
              as DamageLevel,
      growthStage: null == growthStage
          ? _value.growthStage
          : growthStage // ignore: cast_nullable_to_non_nullable
              as String,
      yieldPotential: null == yieldPotential
          ? _value.yieldPotential
          : yieldPotential // ignore: cast_nullable_to_non_nullable
              as double,
      actionItems: null == actionItems
          ? _value.actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<ActionItem>,
      analysisDate: null == analysisDate
          ? _value.analysisDate
          : analysisDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CropHealthAnalysisImplCopyWith<$Res>
    implements $CropHealthAnalysisCopyWith<$Res> {
  factory _$$CropHealthAnalysisImplCopyWith(_$CropHealthAnalysisImpl value,
          $Res Function(_$CropHealthAnalysisImpl) then) =
      __$$CropHealthAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double overallHealthScore,
      NutrientLevel nitrogenLevel,
      NutrientLevel phosphorusLevel,
      NutrientLevel potassiumLevel,
      StressLevel waterStress,
      DamageLevel pestDamage,
      String growthStage,
      double yieldPotential,
      List<ActionItem> actionItems,
      DateTime analysisDate,
      String imageUrl});
}

/// @nodoc
class __$$CropHealthAnalysisImplCopyWithImpl<$Res>
    extends _$CropHealthAnalysisCopyWithImpl<$Res, _$CropHealthAnalysisImpl>
    implements _$$CropHealthAnalysisImplCopyWith<$Res> {
  __$$CropHealthAnalysisImplCopyWithImpl(_$CropHealthAnalysisImpl _value,
      $Res Function(_$CropHealthAnalysisImpl) _then)
      : super(_value, _then);

  /// Create a copy of CropHealthAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overallHealthScore = null,
    Object? nitrogenLevel = null,
    Object? phosphorusLevel = null,
    Object? potassiumLevel = null,
    Object? waterStress = null,
    Object? pestDamage = null,
    Object? growthStage = null,
    Object? yieldPotential = null,
    Object? actionItems = null,
    Object? analysisDate = null,
    Object? imageUrl = null,
  }) {
    return _then(_$CropHealthAnalysisImpl(
      overallHealthScore: null == overallHealthScore
          ? _value.overallHealthScore
          : overallHealthScore // ignore: cast_nullable_to_non_nullable
              as double,
      nitrogenLevel: null == nitrogenLevel
          ? _value.nitrogenLevel
          : nitrogenLevel // ignore: cast_nullable_to_non_nullable
              as NutrientLevel,
      phosphorusLevel: null == phosphorusLevel
          ? _value.phosphorusLevel
          : phosphorusLevel // ignore: cast_nullable_to_non_nullable
              as NutrientLevel,
      potassiumLevel: null == potassiumLevel
          ? _value.potassiumLevel
          : potassiumLevel // ignore: cast_nullable_to_non_nullable
              as NutrientLevel,
      waterStress: null == waterStress
          ? _value.waterStress
          : waterStress // ignore: cast_nullable_to_non_nullable
              as StressLevel,
      pestDamage: null == pestDamage
          ? _value.pestDamage
          : pestDamage // ignore: cast_nullable_to_non_nullable
              as DamageLevel,
      growthStage: null == growthStage
          ? _value.growthStage
          : growthStage // ignore: cast_nullable_to_non_nullable
              as String,
      yieldPotential: null == yieldPotential
          ? _value.yieldPotential
          : yieldPotential // ignore: cast_nullable_to_non_nullable
              as double,
      actionItems: null == actionItems
          ? _value._actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<ActionItem>,
      analysisDate: null == analysisDate
          ? _value.analysisDate
          : analysisDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CropHealthAnalysisImpl implements _CropHealthAnalysis {
  const _$CropHealthAnalysisImpl(
      {required this.overallHealthScore,
      required this.nitrogenLevel,
      required this.phosphorusLevel,
      required this.potassiumLevel,
      required this.waterStress,
      required this.pestDamage,
      required this.growthStage,
      required this.yieldPotential,
      required final List<ActionItem> actionItems,
      required this.analysisDate,
      required this.imageUrl})
      : _actionItems = actionItems;

  factory _$CropHealthAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$CropHealthAnalysisImplFromJson(json);

  @override
  final double overallHealthScore;
  @override
  final NutrientLevel nitrogenLevel;
  @override
  final NutrientLevel phosphorusLevel;
  @override
  final NutrientLevel potassiumLevel;
  @override
  final StressLevel waterStress;
  @override
  final DamageLevel pestDamage;
  @override
  final String growthStage;
  @override
  final double yieldPotential;
  final List<ActionItem> _actionItems;
  @override
  List<ActionItem> get actionItems {
    if (_actionItems is EqualUnmodifiableListView) return _actionItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionItems);
  }

  @override
  final DateTime analysisDate;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'CropHealthAnalysis(overallHealthScore: $overallHealthScore, nitrogenLevel: $nitrogenLevel, phosphorusLevel: $phosphorusLevel, potassiumLevel: $potassiumLevel, waterStress: $waterStress, pestDamage: $pestDamage, growthStage: $growthStage, yieldPotential: $yieldPotential, actionItems: $actionItems, analysisDate: $analysisDate, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CropHealthAnalysisImpl &&
            (identical(other.overallHealthScore, overallHealthScore) ||
                other.overallHealthScore == overallHealthScore) &&
            (identical(other.nitrogenLevel, nitrogenLevel) ||
                other.nitrogenLevel == nitrogenLevel) &&
            (identical(other.phosphorusLevel, phosphorusLevel) ||
                other.phosphorusLevel == phosphorusLevel) &&
            (identical(other.potassiumLevel, potassiumLevel) ||
                other.potassiumLevel == potassiumLevel) &&
            (identical(other.waterStress, waterStress) ||
                other.waterStress == waterStress) &&
            (identical(other.pestDamage, pestDamage) ||
                other.pestDamage == pestDamage) &&
            (identical(other.growthStage, growthStage) ||
                other.growthStage == growthStage) &&
            (identical(other.yieldPotential, yieldPotential) ||
                other.yieldPotential == yieldPotential) &&
            const DeepCollectionEquality()
                .equals(other._actionItems, _actionItems) &&
            (identical(other.analysisDate, analysisDate) ||
                other.analysisDate == analysisDate) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      overallHealthScore,
      nitrogenLevel,
      phosphorusLevel,
      potassiumLevel,
      waterStress,
      pestDamage,
      growthStage,
      yieldPotential,
      const DeepCollectionEquality().hash(_actionItems),
      analysisDate,
      imageUrl);

  /// Create a copy of CropHealthAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CropHealthAnalysisImplCopyWith<_$CropHealthAnalysisImpl> get copyWith =>
      __$$CropHealthAnalysisImplCopyWithImpl<_$CropHealthAnalysisImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CropHealthAnalysisImplToJson(
      this,
    );
  }
}

abstract class _CropHealthAnalysis implements CropHealthAnalysis {
  const factory _CropHealthAnalysis(
      {required final double overallHealthScore,
      required final NutrientLevel nitrogenLevel,
      required final NutrientLevel phosphorusLevel,
      required final NutrientLevel potassiumLevel,
      required final StressLevel waterStress,
      required final DamageLevel pestDamage,
      required final String growthStage,
      required final double yieldPotential,
      required final List<ActionItem> actionItems,
      required final DateTime analysisDate,
      required final String imageUrl}) = _$CropHealthAnalysisImpl;

  factory _CropHealthAnalysis.fromJson(Map<String, dynamic> json) =
      _$CropHealthAnalysisImpl.fromJson;

  @override
  double get overallHealthScore;
  @override
  NutrientLevel get nitrogenLevel;
  @override
  NutrientLevel get phosphorusLevel;
  @override
  NutrientLevel get potassiumLevel;
  @override
  StressLevel get waterStress;
  @override
  DamageLevel get pestDamage;
  @override
  String get growthStage;
  @override
  double get yieldPotential;
  @override
  List<ActionItem> get actionItems;
  @override
  DateTime get analysisDate;
  @override
  String get imageUrl;

  /// Create a copy of CropHealthAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CropHealthAnalysisImplCopyWith<_$CropHealthAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActionItem _$ActionItemFromJson(Map<String, dynamic> json) {
  return _ActionItem.fromJson(json);
}

/// @nodoc
mixin _$ActionItem {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ActionPriority get priority => throw _privateConstructorUsedError;
  double get estimatedCost => throw _privateConstructorUsedError;
  String get timeframe => throw _privateConstructorUsedError;

  /// Serializes this ActionItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActionItemCopyWith<ActionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionItemCopyWith<$Res> {
  factory $ActionItemCopyWith(
          ActionItem value, $Res Function(ActionItem) then) =
      _$ActionItemCopyWithImpl<$Res, ActionItem>;
  @useResult
  $Res call(
      {String title,
      String description,
      ActionPriority priority,
      double estimatedCost,
      String timeframe});
}

/// @nodoc
class _$ActionItemCopyWithImpl<$Res, $Val extends ActionItem>
    implements $ActionItemCopyWith<$Res> {
  _$ActionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? priority = null,
    Object? estimatedCost = null,
    Object? timeframe = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as ActionPriority,
      estimatedCost: null == estimatedCost
          ? _value.estimatedCost
          : estimatedCost // ignore: cast_nullable_to_non_nullable
              as double,
      timeframe: null == timeframe
          ? _value.timeframe
          : timeframe // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionItemImplCopyWith<$Res>
    implements $ActionItemCopyWith<$Res> {
  factory _$$ActionItemImplCopyWith(
          _$ActionItemImpl value, $Res Function(_$ActionItemImpl) then) =
      __$$ActionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      ActionPriority priority,
      double estimatedCost,
      String timeframe});
}

/// @nodoc
class __$$ActionItemImplCopyWithImpl<$Res>
    extends _$ActionItemCopyWithImpl<$Res, _$ActionItemImpl>
    implements _$$ActionItemImplCopyWith<$Res> {
  __$$ActionItemImplCopyWithImpl(
      _$ActionItemImpl _value, $Res Function(_$ActionItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? priority = null,
    Object? estimatedCost = null,
    Object? timeframe = null,
  }) {
    return _then(_$ActionItemImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as ActionPriority,
      estimatedCost: null == estimatedCost
          ? _value.estimatedCost
          : estimatedCost // ignore: cast_nullable_to_non_nullable
              as double,
      timeframe: null == timeframe
          ? _value.timeframe
          : timeframe // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActionItemImpl implements _ActionItem {
  const _$ActionItemImpl(
      {required this.title,
      required this.description,
      required this.priority,
      required this.estimatedCost,
      required this.timeframe});

  factory _$ActionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionItemImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final ActionPriority priority;
  @override
  final double estimatedCost;
  @override
  final String timeframe;

  @override
  String toString() {
    return 'ActionItem(title: $title, description: $description, priority: $priority, estimatedCost: $estimatedCost, timeframe: $timeframe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionItemImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.estimatedCost, estimatedCost) ||
                other.estimatedCost == estimatedCost) &&
            (identical(other.timeframe, timeframe) ||
                other.timeframe == timeframe));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, description, priority, estimatedCost, timeframe);

  /// Create a copy of ActionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionItemImplCopyWith<_$ActionItemImpl> get copyWith =>
      __$$ActionItemImplCopyWithImpl<_$ActionItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionItemImplToJson(
      this,
    );
  }
}

abstract class _ActionItem implements ActionItem {
  const factory _ActionItem(
      {required final String title,
      required final String description,
      required final ActionPriority priority,
      required final double estimatedCost,
      required final String timeframe}) = _$ActionItemImpl;

  factory _ActionItem.fromJson(Map<String, dynamic> json) =
      _$ActionItemImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  ActionPriority get priority;
  @override
  double get estimatedCost;
  @override
  String get timeframe;

  /// Create a copy of ActionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionItemImplCopyWith<_$ActionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

YieldPrediction _$YieldPredictionFromJson(Map<String, dynamic> json) {
  return _YieldPrediction.fromJson(json);
}

/// @nodoc
mixin _$YieldPrediction {
  double get expectedYield => throw _privateConstructorUsedError;
  double get minYield => throw _privateConstructorUsedError;
  double get maxYield => throw _privateConstructorUsedError;
  double get confidenceLevel => throw _privateConstructorUsedError;
  List<YieldFactor> get factorsAffectingYield =>
      throw _privateConstructorUsedError;
  List<String> get recommendedActions => throw _privateConstructorUsedError;
  double get marketValue => throw _privateConstructorUsedError;
  DateTime get predictionDate => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this YieldPrediction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YieldPrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YieldPredictionCopyWith<YieldPrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YieldPredictionCopyWith<$Res> {
  factory $YieldPredictionCopyWith(
          YieldPrediction value, $Res Function(YieldPrediction) then) =
      _$YieldPredictionCopyWithImpl<$Res, YieldPrediction>;
  @useResult
  $Res call(
      {double expectedYield,
      double minYield,
      double maxYield,
      double confidenceLevel,
      List<YieldFactor> factorsAffectingYield,
      List<String> recommendedActions,
      double marketValue,
      DateTime predictionDate,
      String imageUrl});
}

/// @nodoc
class _$YieldPredictionCopyWithImpl<$Res, $Val extends YieldPrediction>
    implements $YieldPredictionCopyWith<$Res> {
  _$YieldPredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YieldPrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expectedYield = null,
    Object? minYield = null,
    Object? maxYield = null,
    Object? confidenceLevel = null,
    Object? factorsAffectingYield = null,
    Object? recommendedActions = null,
    Object? marketValue = null,
    Object? predictionDate = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      expectedYield: null == expectedYield
          ? _value.expectedYield
          : expectedYield // ignore: cast_nullable_to_non_nullable
              as double,
      minYield: null == minYield
          ? _value.minYield
          : minYield // ignore: cast_nullable_to_non_nullable
              as double,
      maxYield: null == maxYield
          ? _value.maxYield
          : maxYield // ignore: cast_nullable_to_non_nullable
              as double,
      confidenceLevel: null == confidenceLevel
          ? _value.confidenceLevel
          : confidenceLevel // ignore: cast_nullable_to_non_nullable
              as double,
      factorsAffectingYield: null == factorsAffectingYield
          ? _value.factorsAffectingYield
          : factorsAffectingYield // ignore: cast_nullable_to_non_nullable
              as List<YieldFactor>,
      recommendedActions: null == recommendedActions
          ? _value.recommendedActions
          : recommendedActions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      marketValue: null == marketValue
          ? _value.marketValue
          : marketValue // ignore: cast_nullable_to_non_nullable
              as double,
      predictionDate: null == predictionDate
          ? _value.predictionDate
          : predictionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YieldPredictionImplCopyWith<$Res>
    implements $YieldPredictionCopyWith<$Res> {
  factory _$$YieldPredictionImplCopyWith(_$YieldPredictionImpl value,
          $Res Function(_$YieldPredictionImpl) then) =
      __$$YieldPredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double expectedYield,
      double minYield,
      double maxYield,
      double confidenceLevel,
      List<YieldFactor> factorsAffectingYield,
      List<String> recommendedActions,
      double marketValue,
      DateTime predictionDate,
      String imageUrl});
}

/// @nodoc
class __$$YieldPredictionImplCopyWithImpl<$Res>
    extends _$YieldPredictionCopyWithImpl<$Res, _$YieldPredictionImpl>
    implements _$$YieldPredictionImplCopyWith<$Res> {
  __$$YieldPredictionImplCopyWithImpl(
      _$YieldPredictionImpl _value, $Res Function(_$YieldPredictionImpl) _then)
      : super(_value, _then);

  /// Create a copy of YieldPrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expectedYield = null,
    Object? minYield = null,
    Object? maxYield = null,
    Object? confidenceLevel = null,
    Object? factorsAffectingYield = null,
    Object? recommendedActions = null,
    Object? marketValue = null,
    Object? predictionDate = null,
    Object? imageUrl = null,
  }) {
    return _then(_$YieldPredictionImpl(
      expectedYield: null == expectedYield
          ? _value.expectedYield
          : expectedYield // ignore: cast_nullable_to_non_nullable
              as double,
      minYield: null == minYield
          ? _value.minYield
          : minYield // ignore: cast_nullable_to_non_nullable
              as double,
      maxYield: null == maxYield
          ? _value.maxYield
          : maxYield // ignore: cast_nullable_to_non_nullable
              as double,
      confidenceLevel: null == confidenceLevel
          ? _value.confidenceLevel
          : confidenceLevel // ignore: cast_nullable_to_non_nullable
              as double,
      factorsAffectingYield: null == factorsAffectingYield
          ? _value._factorsAffectingYield
          : factorsAffectingYield // ignore: cast_nullable_to_non_nullable
              as List<YieldFactor>,
      recommendedActions: null == recommendedActions
          ? _value._recommendedActions
          : recommendedActions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      marketValue: null == marketValue
          ? _value.marketValue
          : marketValue // ignore: cast_nullable_to_non_nullable
              as double,
      predictionDate: null == predictionDate
          ? _value.predictionDate
          : predictionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YieldPredictionImpl implements _YieldPrediction {
  const _$YieldPredictionImpl(
      {required this.expectedYield,
      required this.minYield,
      required this.maxYield,
      required this.confidenceLevel,
      required final List<YieldFactor> factorsAffectingYield,
      required final List<String> recommendedActions,
      required this.marketValue,
      required this.predictionDate,
      required this.imageUrl})
      : _factorsAffectingYield = factorsAffectingYield,
        _recommendedActions = recommendedActions;

  factory _$YieldPredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$YieldPredictionImplFromJson(json);

  @override
  final double expectedYield;
  @override
  final double minYield;
  @override
  final double maxYield;
  @override
  final double confidenceLevel;
  final List<YieldFactor> _factorsAffectingYield;
  @override
  List<YieldFactor> get factorsAffectingYield {
    if (_factorsAffectingYield is EqualUnmodifiableListView)
      return _factorsAffectingYield;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_factorsAffectingYield);
  }

  final List<String> _recommendedActions;
  @override
  List<String> get recommendedActions {
    if (_recommendedActions is EqualUnmodifiableListView)
      return _recommendedActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedActions);
  }

  @override
  final double marketValue;
  @override
  final DateTime predictionDate;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'YieldPrediction(expectedYield: $expectedYield, minYield: $minYield, maxYield: $maxYield, confidenceLevel: $confidenceLevel, factorsAffectingYield: $factorsAffectingYield, recommendedActions: $recommendedActions, marketValue: $marketValue, predictionDate: $predictionDate, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YieldPredictionImpl &&
            (identical(other.expectedYield, expectedYield) ||
                other.expectedYield == expectedYield) &&
            (identical(other.minYield, minYield) ||
                other.minYield == minYield) &&
            (identical(other.maxYield, maxYield) ||
                other.maxYield == maxYield) &&
            (identical(other.confidenceLevel, confidenceLevel) ||
                other.confidenceLevel == confidenceLevel) &&
            const DeepCollectionEquality()
                .equals(other._factorsAffectingYield, _factorsAffectingYield) &&
            const DeepCollectionEquality()
                .equals(other._recommendedActions, _recommendedActions) &&
            (identical(other.marketValue, marketValue) ||
                other.marketValue == marketValue) &&
            (identical(other.predictionDate, predictionDate) ||
                other.predictionDate == predictionDate) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      expectedYield,
      minYield,
      maxYield,
      confidenceLevel,
      const DeepCollectionEquality().hash(_factorsAffectingYield),
      const DeepCollectionEquality().hash(_recommendedActions),
      marketValue,
      predictionDate,
      imageUrl);

  /// Create a copy of YieldPrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YieldPredictionImplCopyWith<_$YieldPredictionImpl> get copyWith =>
      __$$YieldPredictionImplCopyWithImpl<_$YieldPredictionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YieldPredictionImplToJson(
      this,
    );
  }
}

abstract class _YieldPrediction implements YieldPrediction {
  const factory _YieldPrediction(
      {required final double expectedYield,
      required final double minYield,
      required final double maxYield,
      required final double confidenceLevel,
      required final List<YieldFactor> factorsAffectingYield,
      required final List<String> recommendedActions,
      required final double marketValue,
      required final DateTime predictionDate,
      required final String imageUrl}) = _$YieldPredictionImpl;

  factory _YieldPrediction.fromJson(Map<String, dynamic> json) =
      _$YieldPredictionImpl.fromJson;

  @override
  double get expectedYield;
  @override
  double get minYield;
  @override
  double get maxYield;
  @override
  double get confidenceLevel;
  @override
  List<YieldFactor> get factorsAffectingYield;
  @override
  List<String> get recommendedActions;
  @override
  double get marketValue;
  @override
  DateTime get predictionDate;
  @override
  String get imageUrl;

  /// Create a copy of YieldPrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YieldPredictionImplCopyWith<_$YieldPredictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

YieldFactor _$YieldFactorFromJson(Map<String, dynamic> json) {
  return _YieldFactor.fromJson(json);
}

/// @nodoc
mixin _$YieldFactor {
  String get factor => throw _privateConstructorUsedError;
  double get impact => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this YieldFactor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YieldFactor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YieldFactorCopyWith<YieldFactor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YieldFactorCopyWith<$Res> {
  factory $YieldFactorCopyWith(
          YieldFactor value, $Res Function(YieldFactor) then) =
      _$YieldFactorCopyWithImpl<$Res, YieldFactor>;
  @useResult
  $Res call({String factor, double impact, String description});
}

/// @nodoc
class _$YieldFactorCopyWithImpl<$Res, $Val extends YieldFactor>
    implements $YieldFactorCopyWith<$Res> {
  _$YieldFactorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YieldFactor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? factor = null,
    Object? impact = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      factor: null == factor
          ? _value.factor
          : factor // ignore: cast_nullable_to_non_nullable
              as String,
      impact: null == impact
          ? _value.impact
          : impact // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YieldFactorImplCopyWith<$Res>
    implements $YieldFactorCopyWith<$Res> {
  factory _$$YieldFactorImplCopyWith(
          _$YieldFactorImpl value, $Res Function(_$YieldFactorImpl) then) =
      __$$YieldFactorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String factor, double impact, String description});
}

/// @nodoc
class __$$YieldFactorImplCopyWithImpl<$Res>
    extends _$YieldFactorCopyWithImpl<$Res, _$YieldFactorImpl>
    implements _$$YieldFactorImplCopyWith<$Res> {
  __$$YieldFactorImplCopyWithImpl(
      _$YieldFactorImpl _value, $Res Function(_$YieldFactorImpl) _then)
      : super(_value, _then);

  /// Create a copy of YieldFactor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? factor = null,
    Object? impact = null,
    Object? description = null,
  }) {
    return _then(_$YieldFactorImpl(
      factor: null == factor
          ? _value.factor
          : factor // ignore: cast_nullable_to_non_nullable
              as String,
      impact: null == impact
          ? _value.impact
          : impact // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YieldFactorImpl implements _YieldFactor {
  const _$YieldFactorImpl(
      {required this.factor, required this.impact, required this.description});

  factory _$YieldFactorImpl.fromJson(Map<String, dynamic> json) =>
      _$$YieldFactorImplFromJson(json);

  @override
  final String factor;
  @override
  final double impact;
  @override
  final String description;

  @override
  String toString() {
    return 'YieldFactor(factor: $factor, impact: $impact, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YieldFactorImpl &&
            (identical(other.factor, factor) || other.factor == factor) &&
            (identical(other.impact, impact) || other.impact == impact) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, factor, impact, description);

  /// Create a copy of YieldFactor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YieldFactorImplCopyWith<_$YieldFactorImpl> get copyWith =>
      __$$YieldFactorImplCopyWithImpl<_$YieldFactorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YieldFactorImplToJson(
      this,
    );
  }
}

abstract class _YieldFactor implements YieldFactor {
  const factory _YieldFactor(
      {required final String factor,
      required final double impact,
      required final String description}) = _$YieldFactorImpl;

  factory _YieldFactor.fromJson(Map<String, dynamic> json) =
      _$YieldFactorImpl.fromJson;

  @override
  String get factor;
  @override
  double get impact;
  @override
  String get description;

  /// Create a copy of YieldFactor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YieldFactorImplCopyWith<_$YieldFactorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RealTimeCropAnalysis _$RealTimeCropAnalysisFromJson(Map<String, dynamic> json) {
  return _RealTimeCropAnalysis.fromJson(json);
}

/// @nodoc
mixin _$RealTimeCropAnalysis {
  double get healthScore => throw _privateConstructorUsedError;
  double get moistureLevel => throw _privateConstructorUsedError;
  String get pestActivity => throw _privateConstructorUsedError;
  String get growthRate => throw _privateConstructorUsedError;
  String get recommendedAction => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this RealTimeCropAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RealTimeCropAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RealTimeCropAnalysisCopyWith<RealTimeCropAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealTimeCropAnalysisCopyWith<$Res> {
  factory $RealTimeCropAnalysisCopyWith(RealTimeCropAnalysis value,
          $Res Function(RealTimeCropAnalysis) then) =
      _$RealTimeCropAnalysisCopyWithImpl<$Res, RealTimeCropAnalysis>;
  @useResult
  $Res call(
      {double healthScore,
      double moistureLevel,
      String pestActivity,
      String growthRate,
      String recommendedAction,
      DateTime timestamp});
}

/// @nodoc
class _$RealTimeCropAnalysisCopyWithImpl<$Res,
        $Val extends RealTimeCropAnalysis>
    implements $RealTimeCropAnalysisCopyWith<$Res> {
  _$RealTimeCropAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RealTimeCropAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? healthScore = null,
    Object? moistureLevel = null,
    Object? pestActivity = null,
    Object? growthRate = null,
    Object? recommendedAction = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      healthScore: null == healthScore
          ? _value.healthScore
          : healthScore // ignore: cast_nullable_to_non_nullable
              as double,
      moistureLevel: null == moistureLevel
          ? _value.moistureLevel
          : moistureLevel // ignore: cast_nullable_to_non_nullable
              as double,
      pestActivity: null == pestActivity
          ? _value.pestActivity
          : pestActivity // ignore: cast_nullable_to_non_nullable
              as String,
      growthRate: null == growthRate
          ? _value.growthRate
          : growthRate // ignore: cast_nullable_to_non_nullable
              as String,
      recommendedAction: null == recommendedAction
          ? _value.recommendedAction
          : recommendedAction // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RealTimeCropAnalysisImplCopyWith<$Res>
    implements $RealTimeCropAnalysisCopyWith<$Res> {
  factory _$$RealTimeCropAnalysisImplCopyWith(_$RealTimeCropAnalysisImpl value,
          $Res Function(_$RealTimeCropAnalysisImpl) then) =
      __$$RealTimeCropAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double healthScore,
      double moistureLevel,
      String pestActivity,
      String growthRate,
      String recommendedAction,
      DateTime timestamp});
}

/// @nodoc
class __$$RealTimeCropAnalysisImplCopyWithImpl<$Res>
    extends _$RealTimeCropAnalysisCopyWithImpl<$Res, _$RealTimeCropAnalysisImpl>
    implements _$$RealTimeCropAnalysisImplCopyWith<$Res> {
  __$$RealTimeCropAnalysisImplCopyWithImpl(_$RealTimeCropAnalysisImpl _value,
      $Res Function(_$RealTimeCropAnalysisImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealTimeCropAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? healthScore = null,
    Object? moistureLevel = null,
    Object? pestActivity = null,
    Object? growthRate = null,
    Object? recommendedAction = null,
    Object? timestamp = null,
  }) {
    return _then(_$RealTimeCropAnalysisImpl(
      healthScore: null == healthScore
          ? _value.healthScore
          : healthScore // ignore: cast_nullable_to_non_nullable
              as double,
      moistureLevel: null == moistureLevel
          ? _value.moistureLevel
          : moistureLevel // ignore: cast_nullable_to_non_nullable
              as double,
      pestActivity: null == pestActivity
          ? _value.pestActivity
          : pestActivity // ignore: cast_nullable_to_non_nullable
              as String,
      growthRate: null == growthRate
          ? _value.growthRate
          : growthRate // ignore: cast_nullable_to_non_nullable
              as String,
      recommendedAction: null == recommendedAction
          ? _value.recommendedAction
          : recommendedAction // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealTimeCropAnalysisImpl implements _RealTimeCropAnalysis {
  const _$RealTimeCropAnalysisImpl(
      {required this.healthScore,
      required this.moistureLevel,
      required this.pestActivity,
      required this.growthRate,
      required this.recommendedAction,
      required this.timestamp});

  factory _$RealTimeCropAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$RealTimeCropAnalysisImplFromJson(json);

  @override
  final double healthScore;
  @override
  final double moistureLevel;
  @override
  final String pestActivity;
  @override
  final String growthRate;
  @override
  final String recommendedAction;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'RealTimeCropAnalysis(healthScore: $healthScore, moistureLevel: $moistureLevel, pestActivity: $pestActivity, growthRate: $growthRate, recommendedAction: $recommendedAction, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealTimeCropAnalysisImpl &&
            (identical(other.healthScore, healthScore) ||
                other.healthScore == healthScore) &&
            (identical(other.moistureLevel, moistureLevel) ||
                other.moistureLevel == moistureLevel) &&
            (identical(other.pestActivity, pestActivity) ||
                other.pestActivity == pestActivity) &&
            (identical(other.growthRate, growthRate) ||
                other.growthRate == growthRate) &&
            (identical(other.recommendedAction, recommendedAction) ||
                other.recommendedAction == recommendedAction) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, healthScore, moistureLevel,
      pestActivity, growthRate, recommendedAction, timestamp);

  /// Create a copy of RealTimeCropAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealTimeCropAnalysisImplCopyWith<_$RealTimeCropAnalysisImpl>
      get copyWith =>
          __$$RealTimeCropAnalysisImplCopyWithImpl<_$RealTimeCropAnalysisImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RealTimeCropAnalysisImplToJson(
      this,
    );
  }
}

abstract class _RealTimeCropAnalysis implements RealTimeCropAnalysis {
  const factory _RealTimeCropAnalysis(
      {required final double healthScore,
      required final double moistureLevel,
      required final String pestActivity,
      required final String growthRate,
      required final String recommendedAction,
      required final DateTime timestamp}) = _$RealTimeCropAnalysisImpl;

  factory _RealTimeCropAnalysis.fromJson(Map<String, dynamic> json) =
      _$RealTimeCropAnalysisImpl.fromJson;

  @override
  double get healthScore;
  @override
  double get moistureLevel;
  @override
  String get pestActivity;
  @override
  String get growthRate;
  @override
  String get recommendedAction;
  @override
  DateTime get timestamp;

  /// Create a copy of RealTimeCropAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealTimeCropAnalysisImplCopyWith<_$RealTimeCropAnalysisImpl>
      get copyWith => throw _privateConstructorUsedError;
}
