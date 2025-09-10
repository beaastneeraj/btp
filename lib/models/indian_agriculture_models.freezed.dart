// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'indian_agriculture_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IndianCrop _$IndianCropFromJson(Map<String, dynamic> json) {
  return _IndianCrop.fromJson(json);
}

/// @nodoc
mixin _$IndianCrop {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get hindiName => throw _privateConstructorUsedError;
  String get scientificName => throw _privateConstructorUsedError;
  CropCategory get category => throw _privateConstructorUsedError;
  List<IndianState> get suitableStates => throw _privateConstructorUsedError;
  List<SoilType> get suitableSoils => throw _privateConstructorUsedError;
  List<ClimateZone> get suitableClimates => throw _privateConstructorUsedError;
  List<CropSeason> get seasons => throw _privateConstructorUsedError;
  int get growthDurationDays => throw _privateConstructorUsedError;
  double get temperatureMin => throw _privateConstructorUsedError;
  double get temperatureMax => throw _privateConstructorUsedError;
  double get rainfallMin => throw _privateConstructorUsedError;
  double get rainfallMax => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get varieties => throw _privateConstructorUsedError;
  CropManual get manual => throw _privateConstructorUsedError;
  List<String> get diseases => throw _privateConstructorUsedError;
  List<String> get pests => throw _privateConstructorUsedError;
  MarketInfo get marketInfo => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this IndianCrop to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IndianCrop
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IndianCropCopyWith<IndianCrop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndianCropCopyWith<$Res> {
  factory $IndianCropCopyWith(
          IndianCrop value, $Res Function(IndianCrop) then) =
      _$IndianCropCopyWithImpl<$Res, IndianCrop>;
  @useResult
  $Res call(
      {String id,
      String name,
      String hindiName,
      String scientificName,
      CropCategory category,
      List<IndianState> suitableStates,
      List<SoilType> suitableSoils,
      List<ClimateZone> suitableClimates,
      List<CropSeason> seasons,
      int growthDurationDays,
      double temperatureMin,
      double temperatureMax,
      double rainfallMin,
      double rainfallMax,
      String description,
      List<String> varieties,
      CropManual manual,
      List<String> diseases,
      List<String> pests,
      MarketInfo marketInfo,
      List<String> images});

  $CropManualCopyWith<$Res> get manual;
  $MarketInfoCopyWith<$Res> get marketInfo;
}

/// @nodoc
class _$IndianCropCopyWithImpl<$Res, $Val extends IndianCrop>
    implements $IndianCropCopyWith<$Res> {
  _$IndianCropCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IndianCrop
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hindiName = null,
    Object? scientificName = null,
    Object? category = null,
    Object? suitableStates = null,
    Object? suitableSoils = null,
    Object? suitableClimates = null,
    Object? seasons = null,
    Object? growthDurationDays = null,
    Object? temperatureMin = null,
    Object? temperatureMax = null,
    Object? rainfallMin = null,
    Object? rainfallMax = null,
    Object? description = null,
    Object? varieties = null,
    Object? manual = null,
    Object? diseases = null,
    Object? pests = null,
    Object? marketInfo = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      scientificName: null == scientificName
          ? _value.scientificName
          : scientificName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CropCategory,
      suitableStates: null == suitableStates
          ? _value.suitableStates
          : suitableStates // ignore: cast_nullable_to_non_nullable
              as List<IndianState>,
      suitableSoils: null == suitableSoils
          ? _value.suitableSoils
          : suitableSoils // ignore: cast_nullable_to_non_nullable
              as List<SoilType>,
      suitableClimates: null == suitableClimates
          ? _value.suitableClimates
          : suitableClimates // ignore: cast_nullable_to_non_nullable
              as List<ClimateZone>,
      seasons: null == seasons
          ? _value.seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<CropSeason>,
      growthDurationDays: null == growthDurationDays
          ? _value.growthDurationDays
          : growthDurationDays // ignore: cast_nullable_to_non_nullable
              as int,
      temperatureMin: null == temperatureMin
          ? _value.temperatureMin
          : temperatureMin // ignore: cast_nullable_to_non_nullable
              as double,
      temperatureMax: null == temperatureMax
          ? _value.temperatureMax
          : temperatureMax // ignore: cast_nullable_to_non_nullable
              as double,
      rainfallMin: null == rainfallMin
          ? _value.rainfallMin
          : rainfallMin // ignore: cast_nullable_to_non_nullable
              as double,
      rainfallMax: null == rainfallMax
          ? _value.rainfallMax
          : rainfallMax // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      varieties: null == varieties
          ? _value.varieties
          : varieties // ignore: cast_nullable_to_non_nullable
              as List<String>,
      manual: null == manual
          ? _value.manual
          : manual // ignore: cast_nullable_to_non_nullable
              as CropManual,
      diseases: null == diseases
          ? _value.diseases
          : diseases // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pests: null == pests
          ? _value.pests
          : pests // ignore: cast_nullable_to_non_nullable
              as List<String>,
      marketInfo: null == marketInfo
          ? _value.marketInfo
          : marketInfo // ignore: cast_nullable_to_non_nullable
              as MarketInfo,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of IndianCrop
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CropManualCopyWith<$Res> get manual {
    return $CropManualCopyWith<$Res>(_value.manual, (value) {
      return _then(_value.copyWith(manual: value) as $Val);
    });
  }

  /// Create a copy of IndianCrop
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MarketInfoCopyWith<$Res> get marketInfo {
    return $MarketInfoCopyWith<$Res>(_value.marketInfo, (value) {
      return _then(_value.copyWith(marketInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IndianCropImplCopyWith<$Res>
    implements $IndianCropCopyWith<$Res> {
  factory _$$IndianCropImplCopyWith(
          _$IndianCropImpl value, $Res Function(_$IndianCropImpl) then) =
      __$$IndianCropImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String hindiName,
      String scientificName,
      CropCategory category,
      List<IndianState> suitableStates,
      List<SoilType> suitableSoils,
      List<ClimateZone> suitableClimates,
      List<CropSeason> seasons,
      int growthDurationDays,
      double temperatureMin,
      double temperatureMax,
      double rainfallMin,
      double rainfallMax,
      String description,
      List<String> varieties,
      CropManual manual,
      List<String> diseases,
      List<String> pests,
      MarketInfo marketInfo,
      List<String> images});

  @override
  $CropManualCopyWith<$Res> get manual;
  @override
  $MarketInfoCopyWith<$Res> get marketInfo;
}

/// @nodoc
class __$$IndianCropImplCopyWithImpl<$Res>
    extends _$IndianCropCopyWithImpl<$Res, _$IndianCropImpl>
    implements _$$IndianCropImplCopyWith<$Res> {
  __$$IndianCropImplCopyWithImpl(
      _$IndianCropImpl _value, $Res Function(_$IndianCropImpl) _then)
      : super(_value, _then);

  /// Create a copy of IndianCrop
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hindiName = null,
    Object? scientificName = null,
    Object? category = null,
    Object? suitableStates = null,
    Object? suitableSoils = null,
    Object? suitableClimates = null,
    Object? seasons = null,
    Object? growthDurationDays = null,
    Object? temperatureMin = null,
    Object? temperatureMax = null,
    Object? rainfallMin = null,
    Object? rainfallMax = null,
    Object? description = null,
    Object? varieties = null,
    Object? manual = null,
    Object? diseases = null,
    Object? pests = null,
    Object? marketInfo = null,
    Object? images = null,
  }) {
    return _then(_$IndianCropImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      scientificName: null == scientificName
          ? _value.scientificName
          : scientificName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CropCategory,
      suitableStates: null == suitableStates
          ? _value._suitableStates
          : suitableStates // ignore: cast_nullable_to_non_nullable
              as List<IndianState>,
      suitableSoils: null == suitableSoils
          ? _value._suitableSoils
          : suitableSoils // ignore: cast_nullable_to_non_nullable
              as List<SoilType>,
      suitableClimates: null == suitableClimates
          ? _value._suitableClimates
          : suitableClimates // ignore: cast_nullable_to_non_nullable
              as List<ClimateZone>,
      seasons: null == seasons
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<CropSeason>,
      growthDurationDays: null == growthDurationDays
          ? _value.growthDurationDays
          : growthDurationDays // ignore: cast_nullable_to_non_nullable
              as int,
      temperatureMin: null == temperatureMin
          ? _value.temperatureMin
          : temperatureMin // ignore: cast_nullable_to_non_nullable
              as double,
      temperatureMax: null == temperatureMax
          ? _value.temperatureMax
          : temperatureMax // ignore: cast_nullable_to_non_nullable
              as double,
      rainfallMin: null == rainfallMin
          ? _value.rainfallMin
          : rainfallMin // ignore: cast_nullable_to_non_nullable
              as double,
      rainfallMax: null == rainfallMax
          ? _value.rainfallMax
          : rainfallMax // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      varieties: null == varieties
          ? _value._varieties
          : varieties // ignore: cast_nullable_to_non_nullable
              as List<String>,
      manual: null == manual
          ? _value.manual
          : manual // ignore: cast_nullable_to_non_nullable
              as CropManual,
      diseases: null == diseases
          ? _value._diseases
          : diseases // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pests: null == pests
          ? _value._pests
          : pests // ignore: cast_nullable_to_non_nullable
              as List<String>,
      marketInfo: null == marketInfo
          ? _value.marketInfo
          : marketInfo // ignore: cast_nullable_to_non_nullable
              as MarketInfo,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IndianCropImpl implements _IndianCrop {
  const _$IndianCropImpl(
      {required this.id,
      required this.name,
      required this.hindiName,
      required this.scientificName,
      required this.category,
      required final List<IndianState> suitableStates,
      required final List<SoilType> suitableSoils,
      required final List<ClimateZone> suitableClimates,
      required final List<CropSeason> seasons,
      required this.growthDurationDays,
      required this.temperatureMin,
      required this.temperatureMax,
      required this.rainfallMin,
      required this.rainfallMax,
      required this.description,
      required final List<String> varieties,
      required this.manual,
      required final List<String> diseases,
      required final List<String> pests,
      required this.marketInfo,
      final List<String> images = const []})
      : _suitableStates = suitableStates,
        _suitableSoils = suitableSoils,
        _suitableClimates = suitableClimates,
        _seasons = seasons,
        _varieties = varieties,
        _diseases = diseases,
        _pests = pests,
        _images = images;

  factory _$IndianCropImpl.fromJson(Map<String, dynamic> json) =>
      _$$IndianCropImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String hindiName;
  @override
  final String scientificName;
  @override
  final CropCategory category;
  final List<IndianState> _suitableStates;
  @override
  List<IndianState> get suitableStates {
    if (_suitableStates is EqualUnmodifiableListView) return _suitableStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suitableStates);
  }

  final List<SoilType> _suitableSoils;
  @override
  List<SoilType> get suitableSoils {
    if (_suitableSoils is EqualUnmodifiableListView) return _suitableSoils;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suitableSoils);
  }

  final List<ClimateZone> _suitableClimates;
  @override
  List<ClimateZone> get suitableClimates {
    if (_suitableClimates is EqualUnmodifiableListView)
      return _suitableClimates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suitableClimates);
  }

  final List<CropSeason> _seasons;
  @override
  List<CropSeason> get seasons {
    if (_seasons is EqualUnmodifiableListView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seasons);
  }

  @override
  final int growthDurationDays;
  @override
  final double temperatureMin;
  @override
  final double temperatureMax;
  @override
  final double rainfallMin;
  @override
  final double rainfallMax;
  @override
  final String description;
  final List<String> _varieties;
  @override
  List<String> get varieties {
    if (_varieties is EqualUnmodifiableListView) return _varieties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_varieties);
  }

  @override
  final CropManual manual;
  final List<String> _diseases;
  @override
  List<String> get diseases {
    if (_diseases is EqualUnmodifiableListView) return _diseases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseases);
  }

  final List<String> _pests;
  @override
  List<String> get pests {
    if (_pests is EqualUnmodifiableListView) return _pests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pests);
  }

  @override
  final MarketInfo marketInfo;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'IndianCrop(id: $id, name: $name, hindiName: $hindiName, scientificName: $scientificName, category: $category, suitableStates: $suitableStates, suitableSoils: $suitableSoils, suitableClimates: $suitableClimates, seasons: $seasons, growthDurationDays: $growthDurationDays, temperatureMin: $temperatureMin, temperatureMax: $temperatureMax, rainfallMin: $rainfallMin, rainfallMax: $rainfallMax, description: $description, varieties: $varieties, manual: $manual, diseases: $diseases, pests: $pests, marketInfo: $marketInfo, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndianCropImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hindiName, hindiName) ||
                other.hindiName == hindiName) &&
            (identical(other.scientificName, scientificName) ||
                other.scientificName == scientificName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._suitableStates, _suitableStates) &&
            const DeepCollectionEquality()
                .equals(other._suitableSoils, _suitableSoils) &&
            const DeepCollectionEquality()
                .equals(other._suitableClimates, _suitableClimates) &&
            const DeepCollectionEquality().equals(other._seasons, _seasons) &&
            (identical(other.growthDurationDays, growthDurationDays) ||
                other.growthDurationDays == growthDurationDays) &&
            (identical(other.temperatureMin, temperatureMin) ||
                other.temperatureMin == temperatureMin) &&
            (identical(other.temperatureMax, temperatureMax) ||
                other.temperatureMax == temperatureMax) &&
            (identical(other.rainfallMin, rainfallMin) ||
                other.rainfallMin == rainfallMin) &&
            (identical(other.rainfallMax, rainfallMax) ||
                other.rainfallMax == rainfallMax) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._varieties, _varieties) &&
            (identical(other.manual, manual) || other.manual == manual) &&
            const DeepCollectionEquality().equals(other._diseases, _diseases) &&
            const DeepCollectionEquality().equals(other._pests, _pests) &&
            (identical(other.marketInfo, marketInfo) ||
                other.marketInfo == marketInfo) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        hindiName,
        scientificName,
        category,
        const DeepCollectionEquality().hash(_suitableStates),
        const DeepCollectionEquality().hash(_suitableSoils),
        const DeepCollectionEquality().hash(_suitableClimates),
        const DeepCollectionEquality().hash(_seasons),
        growthDurationDays,
        temperatureMin,
        temperatureMax,
        rainfallMin,
        rainfallMax,
        description,
        const DeepCollectionEquality().hash(_varieties),
        manual,
        const DeepCollectionEquality().hash(_diseases),
        const DeepCollectionEquality().hash(_pests),
        marketInfo,
        const DeepCollectionEquality().hash(_images)
      ]);

  /// Create a copy of IndianCrop
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IndianCropImplCopyWith<_$IndianCropImpl> get copyWith =>
      __$$IndianCropImplCopyWithImpl<_$IndianCropImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IndianCropImplToJson(
      this,
    );
  }
}

abstract class _IndianCrop implements IndianCrop {
  const factory _IndianCrop(
      {required final String id,
      required final String name,
      required final String hindiName,
      required final String scientificName,
      required final CropCategory category,
      required final List<IndianState> suitableStates,
      required final List<SoilType> suitableSoils,
      required final List<ClimateZone> suitableClimates,
      required final List<CropSeason> seasons,
      required final int growthDurationDays,
      required final double temperatureMin,
      required final double temperatureMax,
      required final double rainfallMin,
      required final double rainfallMax,
      required final String description,
      required final List<String> varieties,
      required final CropManual manual,
      required final List<String> diseases,
      required final List<String> pests,
      required final MarketInfo marketInfo,
      final List<String> images}) = _$IndianCropImpl;

  factory _IndianCrop.fromJson(Map<String, dynamic> json) =
      _$IndianCropImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get hindiName;
  @override
  String get scientificName;
  @override
  CropCategory get category;
  @override
  List<IndianState> get suitableStates;
  @override
  List<SoilType> get suitableSoils;
  @override
  List<ClimateZone> get suitableClimates;
  @override
  List<CropSeason> get seasons;
  @override
  int get growthDurationDays;
  @override
  double get temperatureMin;
  @override
  double get temperatureMax;
  @override
  double get rainfallMin;
  @override
  double get rainfallMax;
  @override
  String get description;
  @override
  List<String> get varieties;
  @override
  CropManual get manual;
  @override
  List<String> get diseases;
  @override
  List<String> get pests;
  @override
  MarketInfo get marketInfo;
  @override
  List<String> get images;

  /// Create a copy of IndianCrop
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IndianCropImplCopyWith<_$IndianCropImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CropManual _$CropManualFromJson(Map<String, dynamic> json) {
  return _CropManual.fromJson(json);
}

/// @nodoc
mixin _$CropManual {
  String get cropId => throw _privateConstructorUsedError;
  SoilPreparation get soilPreparation => throw _privateConstructorUsedError;
  SeedingInfo get seedingInfo => throw _privateConstructorUsedError;
  IrrigationSchedule get irrigation => throw _privateConstructorUsedError;
  FertilizerSchedule get fertilizer => throw _privateConstructorUsedError;
  PestManagement get pestManagement => throw _privateConstructorUsedError;
  HarvestingInfo get harvesting => throw _privateConstructorUsedError;
  PostHarvestCare get postHarvest => throw _privateConstructorUsedError;
  List<String> get tips => throw _privateConstructorUsedError;
  List<String> get warnings => throw _privateConstructorUsedError;

  /// Serializes this CropManual to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CropManual
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CropManualCopyWith<CropManual> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropManualCopyWith<$Res> {
  factory $CropManualCopyWith(
          CropManual value, $Res Function(CropManual) then) =
      _$CropManualCopyWithImpl<$Res, CropManual>;
  @useResult
  $Res call(
      {String cropId,
      SoilPreparation soilPreparation,
      SeedingInfo seedingInfo,
      IrrigationSchedule irrigation,
      FertilizerSchedule fertilizer,
      PestManagement pestManagement,
      HarvestingInfo harvesting,
      PostHarvestCare postHarvest,
      List<String> tips,
      List<String> warnings});

  $SoilPreparationCopyWith<$Res> get soilPreparation;
  $SeedingInfoCopyWith<$Res> get seedingInfo;
  $IrrigationScheduleCopyWith<$Res> get irrigation;
  $FertilizerScheduleCopyWith<$Res> get fertilizer;
  $PestManagementCopyWith<$Res> get pestManagement;
  $HarvestingInfoCopyWith<$Res> get harvesting;
  $PostHarvestCareCopyWith<$Res> get postHarvest;
}

/// @nodoc
class _$CropManualCopyWithImpl<$Res, $Val extends CropManual>
    implements $CropManualCopyWith<$Res> {
  _$CropManualCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CropManual
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cropId = null,
    Object? soilPreparation = null,
    Object? seedingInfo = null,
    Object? irrigation = null,
    Object? fertilizer = null,
    Object? pestManagement = null,
    Object? harvesting = null,
    Object? postHarvest = null,
    Object? tips = null,
    Object? warnings = null,
  }) {
    return _then(_value.copyWith(
      cropId: null == cropId
          ? _value.cropId
          : cropId // ignore: cast_nullable_to_non_nullable
              as String,
      soilPreparation: null == soilPreparation
          ? _value.soilPreparation
          : soilPreparation // ignore: cast_nullable_to_non_nullable
              as SoilPreparation,
      seedingInfo: null == seedingInfo
          ? _value.seedingInfo
          : seedingInfo // ignore: cast_nullable_to_non_nullable
              as SeedingInfo,
      irrigation: null == irrigation
          ? _value.irrigation
          : irrigation // ignore: cast_nullable_to_non_nullable
              as IrrigationSchedule,
      fertilizer: null == fertilizer
          ? _value.fertilizer
          : fertilizer // ignore: cast_nullable_to_non_nullable
              as FertilizerSchedule,
      pestManagement: null == pestManagement
          ? _value.pestManagement
          : pestManagement // ignore: cast_nullable_to_non_nullable
              as PestManagement,
      harvesting: null == harvesting
          ? _value.harvesting
          : harvesting // ignore: cast_nullable_to_non_nullable
              as HarvestingInfo,
      postHarvest: null == postHarvest
          ? _value.postHarvest
          : postHarvest // ignore: cast_nullable_to_non_nullable
              as PostHarvestCare,
      tips: null == tips
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      warnings: null == warnings
          ? _value.warnings
          : warnings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of CropManual
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SoilPreparationCopyWith<$Res> get soilPreparation {
    return $SoilPreparationCopyWith<$Res>(_value.soilPreparation, (value) {
      return _then(_value.copyWith(soilPreparation: value) as $Val);
    });
  }

  /// Create a copy of CropManual
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeedingInfoCopyWith<$Res> get seedingInfo {
    return $SeedingInfoCopyWith<$Res>(_value.seedingInfo, (value) {
      return _then(_value.copyWith(seedingInfo: value) as $Val);
    });
  }

  /// Create a copy of CropManual
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IrrigationScheduleCopyWith<$Res> get irrigation {
    return $IrrigationScheduleCopyWith<$Res>(_value.irrigation, (value) {
      return _then(_value.copyWith(irrigation: value) as $Val);
    });
  }

  /// Create a copy of CropManual
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FertilizerScheduleCopyWith<$Res> get fertilizer {
    return $FertilizerScheduleCopyWith<$Res>(_value.fertilizer, (value) {
      return _then(_value.copyWith(fertilizer: value) as $Val);
    });
  }

  /// Create a copy of CropManual
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PestManagementCopyWith<$Res> get pestManagement {
    return $PestManagementCopyWith<$Res>(_value.pestManagement, (value) {
      return _then(_value.copyWith(pestManagement: value) as $Val);
    });
  }

  /// Create a copy of CropManual
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HarvestingInfoCopyWith<$Res> get harvesting {
    return $HarvestingInfoCopyWith<$Res>(_value.harvesting, (value) {
      return _then(_value.copyWith(harvesting: value) as $Val);
    });
  }

  /// Create a copy of CropManual
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostHarvestCareCopyWith<$Res> get postHarvest {
    return $PostHarvestCareCopyWith<$Res>(_value.postHarvest, (value) {
      return _then(_value.copyWith(postHarvest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CropManualImplCopyWith<$Res>
    implements $CropManualCopyWith<$Res> {
  factory _$$CropManualImplCopyWith(
          _$CropManualImpl value, $Res Function(_$CropManualImpl) then) =
      __$$CropManualImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cropId,
      SoilPreparation soilPreparation,
      SeedingInfo seedingInfo,
      IrrigationSchedule irrigation,
      FertilizerSchedule fertilizer,
      PestManagement pestManagement,
      HarvestingInfo harvesting,
      PostHarvestCare postHarvest,
      List<String> tips,
      List<String> warnings});

  @override
  $SoilPreparationCopyWith<$Res> get soilPreparation;
  @override
  $SeedingInfoCopyWith<$Res> get seedingInfo;
  @override
  $IrrigationScheduleCopyWith<$Res> get irrigation;
  @override
  $FertilizerScheduleCopyWith<$Res> get fertilizer;
  @override
  $PestManagementCopyWith<$Res> get pestManagement;
  @override
  $HarvestingInfoCopyWith<$Res> get harvesting;
  @override
  $PostHarvestCareCopyWith<$Res> get postHarvest;
}

/// @nodoc
class __$$CropManualImplCopyWithImpl<$Res>
    extends _$CropManualCopyWithImpl<$Res, _$CropManualImpl>
    implements _$$CropManualImplCopyWith<$Res> {
  __$$CropManualImplCopyWithImpl(
      _$CropManualImpl _value, $Res Function(_$CropManualImpl) _then)
      : super(_value, _then);

  /// Create a copy of CropManual
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cropId = null,
    Object? soilPreparation = null,
    Object? seedingInfo = null,
    Object? irrigation = null,
    Object? fertilizer = null,
    Object? pestManagement = null,
    Object? harvesting = null,
    Object? postHarvest = null,
    Object? tips = null,
    Object? warnings = null,
  }) {
    return _then(_$CropManualImpl(
      cropId: null == cropId
          ? _value.cropId
          : cropId // ignore: cast_nullable_to_non_nullable
              as String,
      soilPreparation: null == soilPreparation
          ? _value.soilPreparation
          : soilPreparation // ignore: cast_nullable_to_non_nullable
              as SoilPreparation,
      seedingInfo: null == seedingInfo
          ? _value.seedingInfo
          : seedingInfo // ignore: cast_nullable_to_non_nullable
              as SeedingInfo,
      irrigation: null == irrigation
          ? _value.irrigation
          : irrigation // ignore: cast_nullable_to_non_nullable
              as IrrigationSchedule,
      fertilizer: null == fertilizer
          ? _value.fertilizer
          : fertilizer // ignore: cast_nullable_to_non_nullable
              as FertilizerSchedule,
      pestManagement: null == pestManagement
          ? _value.pestManagement
          : pestManagement // ignore: cast_nullable_to_non_nullable
              as PestManagement,
      harvesting: null == harvesting
          ? _value.harvesting
          : harvesting // ignore: cast_nullable_to_non_nullable
              as HarvestingInfo,
      postHarvest: null == postHarvest
          ? _value.postHarvest
          : postHarvest // ignore: cast_nullable_to_non_nullable
              as PostHarvestCare,
      tips: null == tips
          ? _value._tips
          : tips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      warnings: null == warnings
          ? _value._warnings
          : warnings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CropManualImpl implements _CropManual {
  const _$CropManualImpl(
      {required this.cropId,
      required this.soilPreparation,
      required this.seedingInfo,
      required this.irrigation,
      required this.fertilizer,
      required this.pestManagement,
      required this.harvesting,
      required this.postHarvest,
      required final List<String> tips,
      required final List<String> warnings})
      : _tips = tips,
        _warnings = warnings;

  factory _$CropManualImpl.fromJson(Map<String, dynamic> json) =>
      _$$CropManualImplFromJson(json);

  @override
  final String cropId;
  @override
  final SoilPreparation soilPreparation;
  @override
  final SeedingInfo seedingInfo;
  @override
  final IrrigationSchedule irrigation;
  @override
  final FertilizerSchedule fertilizer;
  @override
  final PestManagement pestManagement;
  @override
  final HarvestingInfo harvesting;
  @override
  final PostHarvestCare postHarvest;
  final List<String> _tips;
  @override
  List<String> get tips {
    if (_tips is EqualUnmodifiableListView) return _tips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tips);
  }

  final List<String> _warnings;
  @override
  List<String> get warnings {
    if (_warnings is EqualUnmodifiableListView) return _warnings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warnings);
  }

  @override
  String toString() {
    return 'CropManual(cropId: $cropId, soilPreparation: $soilPreparation, seedingInfo: $seedingInfo, irrigation: $irrigation, fertilizer: $fertilizer, pestManagement: $pestManagement, harvesting: $harvesting, postHarvest: $postHarvest, tips: $tips, warnings: $warnings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CropManualImpl &&
            (identical(other.cropId, cropId) || other.cropId == cropId) &&
            (identical(other.soilPreparation, soilPreparation) ||
                other.soilPreparation == soilPreparation) &&
            (identical(other.seedingInfo, seedingInfo) ||
                other.seedingInfo == seedingInfo) &&
            (identical(other.irrigation, irrigation) ||
                other.irrigation == irrigation) &&
            (identical(other.fertilizer, fertilizer) ||
                other.fertilizer == fertilizer) &&
            (identical(other.pestManagement, pestManagement) ||
                other.pestManagement == pestManagement) &&
            (identical(other.harvesting, harvesting) ||
                other.harvesting == harvesting) &&
            (identical(other.postHarvest, postHarvest) ||
                other.postHarvest == postHarvest) &&
            const DeepCollectionEquality().equals(other._tips, _tips) &&
            const DeepCollectionEquality().equals(other._warnings, _warnings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cropId,
      soilPreparation,
      seedingInfo,
      irrigation,
      fertilizer,
      pestManagement,
      harvesting,
      postHarvest,
      const DeepCollectionEquality().hash(_tips),
      const DeepCollectionEquality().hash(_warnings));

  /// Create a copy of CropManual
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CropManualImplCopyWith<_$CropManualImpl> get copyWith =>
      __$$CropManualImplCopyWithImpl<_$CropManualImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CropManualImplToJson(
      this,
    );
  }
}

abstract class _CropManual implements CropManual {
  const factory _CropManual(
      {required final String cropId,
      required final SoilPreparation soilPreparation,
      required final SeedingInfo seedingInfo,
      required final IrrigationSchedule irrigation,
      required final FertilizerSchedule fertilizer,
      required final PestManagement pestManagement,
      required final HarvestingInfo harvesting,
      required final PostHarvestCare postHarvest,
      required final List<String> tips,
      required final List<String> warnings}) = _$CropManualImpl;

  factory _CropManual.fromJson(Map<String, dynamic> json) =
      _$CropManualImpl.fromJson;

  @override
  String get cropId;
  @override
  SoilPreparation get soilPreparation;
  @override
  SeedingInfo get seedingInfo;
  @override
  IrrigationSchedule get irrigation;
  @override
  FertilizerSchedule get fertilizer;
  @override
  PestManagement get pestManagement;
  @override
  HarvestingInfo get harvesting;
  @override
  PostHarvestCare get postHarvest;
  @override
  List<String> get tips;
  @override
  List<String> get warnings;

  /// Create a copy of CropManual
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CropManualImplCopyWith<_$CropManualImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SoilPreparation _$SoilPreparationFromJson(Map<String, dynamic> json) {
  return _SoilPreparation.fromJson(json);
}

/// @nodoc
mixin _$SoilPreparation {
  List<String> get steps => throw _privateConstructorUsedError;
  String get ploughingDepth => throw _privateConstructorUsedError;
  int get numberOfPloughings => throw _privateConstructorUsedError;
  List<String> get tools => throw _privateConstructorUsedError;
  String get timing => throw _privateConstructorUsedError;
  String get soilMoisture => throw _privateConstructorUsedError;

  /// Serializes this SoilPreparation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SoilPreparation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SoilPreparationCopyWith<SoilPreparation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoilPreparationCopyWith<$Res> {
  factory $SoilPreparationCopyWith(
          SoilPreparation value, $Res Function(SoilPreparation) then) =
      _$SoilPreparationCopyWithImpl<$Res, SoilPreparation>;
  @useResult
  $Res call(
      {List<String> steps,
      String ploughingDepth,
      int numberOfPloughings,
      List<String> tools,
      String timing,
      String soilMoisture});
}

/// @nodoc
class _$SoilPreparationCopyWithImpl<$Res, $Val extends SoilPreparation>
    implements $SoilPreparationCopyWith<$Res> {
  _$SoilPreparationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SoilPreparation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? ploughingDepth = null,
    Object? numberOfPloughings = null,
    Object? tools = null,
    Object? timing = null,
    Object? soilMoisture = null,
  }) {
    return _then(_value.copyWith(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ploughingDepth: null == ploughingDepth
          ? _value.ploughingDepth
          : ploughingDepth // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfPloughings: null == numberOfPloughings
          ? _value.numberOfPloughings
          : numberOfPloughings // ignore: cast_nullable_to_non_nullable
              as int,
      tools: null == tools
          ? _value.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timing: null == timing
          ? _value.timing
          : timing // ignore: cast_nullable_to_non_nullable
              as String,
      soilMoisture: null == soilMoisture
          ? _value.soilMoisture
          : soilMoisture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SoilPreparationImplCopyWith<$Res>
    implements $SoilPreparationCopyWith<$Res> {
  factory _$$SoilPreparationImplCopyWith(_$SoilPreparationImpl value,
          $Res Function(_$SoilPreparationImpl) then) =
      __$$SoilPreparationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> steps,
      String ploughingDepth,
      int numberOfPloughings,
      List<String> tools,
      String timing,
      String soilMoisture});
}

/// @nodoc
class __$$SoilPreparationImplCopyWithImpl<$Res>
    extends _$SoilPreparationCopyWithImpl<$Res, _$SoilPreparationImpl>
    implements _$$SoilPreparationImplCopyWith<$Res> {
  __$$SoilPreparationImplCopyWithImpl(
      _$SoilPreparationImpl _value, $Res Function(_$SoilPreparationImpl) _then)
      : super(_value, _then);

  /// Create a copy of SoilPreparation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? ploughingDepth = null,
    Object? numberOfPloughings = null,
    Object? tools = null,
    Object? timing = null,
    Object? soilMoisture = null,
  }) {
    return _then(_$SoilPreparationImpl(
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ploughingDepth: null == ploughingDepth
          ? _value.ploughingDepth
          : ploughingDepth // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfPloughings: null == numberOfPloughings
          ? _value.numberOfPloughings
          : numberOfPloughings // ignore: cast_nullable_to_non_nullable
              as int,
      tools: null == tools
          ? _value._tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timing: null == timing
          ? _value.timing
          : timing // ignore: cast_nullable_to_non_nullable
              as String,
      soilMoisture: null == soilMoisture
          ? _value.soilMoisture
          : soilMoisture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SoilPreparationImpl implements _SoilPreparation {
  const _$SoilPreparationImpl(
      {required final List<String> steps,
      required this.ploughingDepth,
      required this.numberOfPloughings,
      required final List<String> tools,
      required this.timing,
      required this.soilMoisture})
      : _steps = steps,
        _tools = tools;

  factory _$SoilPreparationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SoilPreparationImplFromJson(json);

  final List<String> _steps;
  @override
  List<String> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final String ploughingDepth;
  @override
  final int numberOfPloughings;
  final List<String> _tools;
  @override
  List<String> get tools {
    if (_tools is EqualUnmodifiableListView) return _tools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tools);
  }

  @override
  final String timing;
  @override
  final String soilMoisture;

  @override
  String toString() {
    return 'SoilPreparation(steps: $steps, ploughingDepth: $ploughingDepth, numberOfPloughings: $numberOfPloughings, tools: $tools, timing: $timing, soilMoisture: $soilMoisture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoilPreparationImpl &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.ploughingDepth, ploughingDepth) ||
                other.ploughingDepth == ploughingDepth) &&
            (identical(other.numberOfPloughings, numberOfPloughings) ||
                other.numberOfPloughings == numberOfPloughings) &&
            const DeepCollectionEquality().equals(other._tools, _tools) &&
            (identical(other.timing, timing) || other.timing == timing) &&
            (identical(other.soilMoisture, soilMoisture) ||
                other.soilMoisture == soilMoisture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_steps),
      ploughingDepth,
      numberOfPloughings,
      const DeepCollectionEquality().hash(_tools),
      timing,
      soilMoisture);

  /// Create a copy of SoilPreparation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SoilPreparationImplCopyWith<_$SoilPreparationImpl> get copyWith =>
      __$$SoilPreparationImplCopyWithImpl<_$SoilPreparationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SoilPreparationImplToJson(
      this,
    );
  }
}

abstract class _SoilPreparation implements SoilPreparation {
  const factory _SoilPreparation(
      {required final List<String> steps,
      required final String ploughingDepth,
      required final int numberOfPloughings,
      required final List<String> tools,
      required final String timing,
      required final String soilMoisture}) = _$SoilPreparationImpl;

  factory _SoilPreparation.fromJson(Map<String, dynamic> json) =
      _$SoilPreparationImpl.fromJson;

  @override
  List<String> get steps;
  @override
  String get ploughingDepth;
  @override
  int get numberOfPloughings;
  @override
  List<String> get tools;
  @override
  String get timing;
  @override
  String get soilMoisture;

  /// Create a copy of SoilPreparation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SoilPreparationImplCopyWith<_$SoilPreparationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SeedingInfo _$SeedingInfoFromJson(Map<String, dynamic> json) {
  return _SeedingInfo.fromJson(json);
}

/// @nodoc
mixin _$SeedingInfo {
  double get seedRate => throw _privateConstructorUsedError;
  String get seedRateUnit => throw _privateConstructorUsedError;
  String get spacingBetweenRows => throw _privateConstructorUsedError;
  String get spacingBetweenPlants => throw _privateConstructorUsedError;
  String get sowingDepth => throw _privateConstructorUsedError;
  String get sowingMethod => throw _privateConstructorUsedError;
  List<String> get seedTreatment => throw _privateConstructorUsedError;
  String get bestSowingTime => throw _privateConstructorUsedError;

  /// Serializes this SeedingInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeedingInfoCopyWith<SeedingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeedingInfoCopyWith<$Res> {
  factory $SeedingInfoCopyWith(
          SeedingInfo value, $Res Function(SeedingInfo) then) =
      _$SeedingInfoCopyWithImpl<$Res, SeedingInfo>;
  @useResult
  $Res call(
      {double seedRate,
      String seedRateUnit,
      String spacingBetweenRows,
      String spacingBetweenPlants,
      String sowingDepth,
      String sowingMethod,
      List<String> seedTreatment,
      String bestSowingTime});
}

/// @nodoc
class _$SeedingInfoCopyWithImpl<$Res, $Val extends SeedingInfo>
    implements $SeedingInfoCopyWith<$Res> {
  _$SeedingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seedRate = null,
    Object? seedRateUnit = null,
    Object? spacingBetweenRows = null,
    Object? spacingBetweenPlants = null,
    Object? sowingDepth = null,
    Object? sowingMethod = null,
    Object? seedTreatment = null,
    Object? bestSowingTime = null,
  }) {
    return _then(_value.copyWith(
      seedRate: null == seedRate
          ? _value.seedRate
          : seedRate // ignore: cast_nullable_to_non_nullable
              as double,
      seedRateUnit: null == seedRateUnit
          ? _value.seedRateUnit
          : seedRateUnit // ignore: cast_nullable_to_non_nullable
              as String,
      spacingBetweenRows: null == spacingBetweenRows
          ? _value.spacingBetweenRows
          : spacingBetweenRows // ignore: cast_nullable_to_non_nullable
              as String,
      spacingBetweenPlants: null == spacingBetweenPlants
          ? _value.spacingBetweenPlants
          : spacingBetweenPlants // ignore: cast_nullable_to_non_nullable
              as String,
      sowingDepth: null == sowingDepth
          ? _value.sowingDepth
          : sowingDepth // ignore: cast_nullable_to_non_nullable
              as String,
      sowingMethod: null == sowingMethod
          ? _value.sowingMethod
          : sowingMethod // ignore: cast_nullable_to_non_nullable
              as String,
      seedTreatment: null == seedTreatment
          ? _value.seedTreatment
          : seedTreatment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bestSowingTime: null == bestSowingTime
          ? _value.bestSowingTime
          : bestSowingTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeedingInfoImplCopyWith<$Res>
    implements $SeedingInfoCopyWith<$Res> {
  factory _$$SeedingInfoImplCopyWith(
          _$SeedingInfoImpl value, $Res Function(_$SeedingInfoImpl) then) =
      __$$SeedingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double seedRate,
      String seedRateUnit,
      String spacingBetweenRows,
      String spacingBetweenPlants,
      String sowingDepth,
      String sowingMethod,
      List<String> seedTreatment,
      String bestSowingTime});
}

/// @nodoc
class __$$SeedingInfoImplCopyWithImpl<$Res>
    extends _$SeedingInfoCopyWithImpl<$Res, _$SeedingInfoImpl>
    implements _$$SeedingInfoImplCopyWith<$Res> {
  __$$SeedingInfoImplCopyWithImpl(
      _$SeedingInfoImpl _value, $Res Function(_$SeedingInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seedRate = null,
    Object? seedRateUnit = null,
    Object? spacingBetweenRows = null,
    Object? spacingBetweenPlants = null,
    Object? sowingDepth = null,
    Object? sowingMethod = null,
    Object? seedTreatment = null,
    Object? bestSowingTime = null,
  }) {
    return _then(_$SeedingInfoImpl(
      seedRate: null == seedRate
          ? _value.seedRate
          : seedRate // ignore: cast_nullable_to_non_nullable
              as double,
      seedRateUnit: null == seedRateUnit
          ? _value.seedRateUnit
          : seedRateUnit // ignore: cast_nullable_to_non_nullable
              as String,
      spacingBetweenRows: null == spacingBetweenRows
          ? _value.spacingBetweenRows
          : spacingBetweenRows // ignore: cast_nullable_to_non_nullable
              as String,
      spacingBetweenPlants: null == spacingBetweenPlants
          ? _value.spacingBetweenPlants
          : spacingBetweenPlants // ignore: cast_nullable_to_non_nullable
              as String,
      sowingDepth: null == sowingDepth
          ? _value.sowingDepth
          : sowingDepth // ignore: cast_nullable_to_non_nullable
              as String,
      sowingMethod: null == sowingMethod
          ? _value.sowingMethod
          : sowingMethod // ignore: cast_nullable_to_non_nullable
              as String,
      seedTreatment: null == seedTreatment
          ? _value._seedTreatment
          : seedTreatment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bestSowingTime: null == bestSowingTime
          ? _value.bestSowingTime
          : bestSowingTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeedingInfoImpl implements _SeedingInfo {
  const _$SeedingInfoImpl(
      {required this.seedRate,
      required this.seedRateUnit,
      required this.spacingBetweenRows,
      required this.spacingBetweenPlants,
      required this.sowingDepth,
      required this.sowingMethod,
      required final List<String> seedTreatment,
      required this.bestSowingTime})
      : _seedTreatment = seedTreatment;

  factory _$SeedingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeedingInfoImplFromJson(json);

  @override
  final double seedRate;
  @override
  final String seedRateUnit;
  @override
  final String spacingBetweenRows;
  @override
  final String spacingBetweenPlants;
  @override
  final String sowingDepth;
  @override
  final String sowingMethod;
  final List<String> _seedTreatment;
  @override
  List<String> get seedTreatment {
    if (_seedTreatment is EqualUnmodifiableListView) return _seedTreatment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seedTreatment);
  }

  @override
  final String bestSowingTime;

  @override
  String toString() {
    return 'SeedingInfo(seedRate: $seedRate, seedRateUnit: $seedRateUnit, spacingBetweenRows: $spacingBetweenRows, spacingBetweenPlants: $spacingBetweenPlants, sowingDepth: $sowingDepth, sowingMethod: $sowingMethod, seedTreatment: $seedTreatment, bestSowingTime: $bestSowingTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeedingInfoImpl &&
            (identical(other.seedRate, seedRate) ||
                other.seedRate == seedRate) &&
            (identical(other.seedRateUnit, seedRateUnit) ||
                other.seedRateUnit == seedRateUnit) &&
            (identical(other.spacingBetweenRows, spacingBetweenRows) ||
                other.spacingBetweenRows == spacingBetweenRows) &&
            (identical(other.spacingBetweenPlants, spacingBetweenPlants) ||
                other.spacingBetweenPlants == spacingBetweenPlants) &&
            (identical(other.sowingDepth, sowingDepth) ||
                other.sowingDepth == sowingDepth) &&
            (identical(other.sowingMethod, sowingMethod) ||
                other.sowingMethod == sowingMethod) &&
            const DeepCollectionEquality()
                .equals(other._seedTreatment, _seedTreatment) &&
            (identical(other.bestSowingTime, bestSowingTime) ||
                other.bestSowingTime == bestSowingTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      seedRate,
      seedRateUnit,
      spacingBetweenRows,
      spacingBetweenPlants,
      sowingDepth,
      sowingMethod,
      const DeepCollectionEquality().hash(_seedTreatment),
      bestSowingTime);

  /// Create a copy of SeedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeedingInfoImplCopyWith<_$SeedingInfoImpl> get copyWith =>
      __$$SeedingInfoImplCopyWithImpl<_$SeedingInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeedingInfoImplToJson(
      this,
    );
  }
}

abstract class _SeedingInfo implements SeedingInfo {
  const factory _SeedingInfo(
      {required final double seedRate,
      required final String seedRateUnit,
      required final String spacingBetweenRows,
      required final String spacingBetweenPlants,
      required final String sowingDepth,
      required final String sowingMethod,
      required final List<String> seedTreatment,
      required final String bestSowingTime}) = _$SeedingInfoImpl;

  factory _SeedingInfo.fromJson(Map<String, dynamic> json) =
      _$SeedingInfoImpl.fromJson;

  @override
  double get seedRate;
  @override
  String get seedRateUnit;
  @override
  String get spacingBetweenRows;
  @override
  String get spacingBetweenPlants;
  @override
  String get sowingDepth;
  @override
  String get sowingMethod;
  @override
  List<String> get seedTreatment;
  @override
  String get bestSowingTime;

  /// Create a copy of SeedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeedingInfoImplCopyWith<_$SeedingInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IrrigationSchedule _$IrrigationScheduleFromJson(Map<String, dynamic> json) {
  return _IrrigationSchedule.fromJson(json);
}

/// @nodoc
mixin _$IrrigationSchedule {
  List<IrrigationStage> get stages => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  double get totalWaterRequirement => throw _privateConstructorUsedError;
  String get waterQuality => throw _privateConstructorUsedError;
  List<String> get criticalStages => throw _privateConstructorUsedError;

  /// Serializes this IrrigationSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IrrigationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IrrigationScheduleCopyWith<IrrigationSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IrrigationScheduleCopyWith<$Res> {
  factory $IrrigationScheduleCopyWith(
          IrrigationSchedule value, $Res Function(IrrigationSchedule) then) =
      _$IrrigationScheduleCopyWithImpl<$Res, IrrigationSchedule>;
  @useResult
  $Res call(
      {List<IrrigationStage> stages,
      String method,
      double totalWaterRequirement,
      String waterQuality,
      List<String> criticalStages});
}

/// @nodoc
class _$IrrigationScheduleCopyWithImpl<$Res, $Val extends IrrigationSchedule>
    implements $IrrigationScheduleCopyWith<$Res> {
  _$IrrigationScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IrrigationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stages = null,
    Object? method = null,
    Object? totalWaterRequirement = null,
    Object? waterQuality = null,
    Object? criticalStages = null,
  }) {
    return _then(_value.copyWith(
      stages: null == stages
          ? _value.stages
          : stages // ignore: cast_nullable_to_non_nullable
              as List<IrrigationStage>,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      totalWaterRequirement: null == totalWaterRequirement
          ? _value.totalWaterRequirement
          : totalWaterRequirement // ignore: cast_nullable_to_non_nullable
              as double,
      waterQuality: null == waterQuality
          ? _value.waterQuality
          : waterQuality // ignore: cast_nullable_to_non_nullable
              as String,
      criticalStages: null == criticalStages
          ? _value.criticalStages
          : criticalStages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IrrigationScheduleImplCopyWith<$Res>
    implements $IrrigationScheduleCopyWith<$Res> {
  factory _$$IrrigationScheduleImplCopyWith(_$IrrigationScheduleImpl value,
          $Res Function(_$IrrigationScheduleImpl) then) =
      __$$IrrigationScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<IrrigationStage> stages,
      String method,
      double totalWaterRequirement,
      String waterQuality,
      List<String> criticalStages});
}

/// @nodoc
class __$$IrrigationScheduleImplCopyWithImpl<$Res>
    extends _$IrrigationScheduleCopyWithImpl<$Res, _$IrrigationScheduleImpl>
    implements _$$IrrigationScheduleImplCopyWith<$Res> {
  __$$IrrigationScheduleImplCopyWithImpl(_$IrrigationScheduleImpl _value,
      $Res Function(_$IrrigationScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of IrrigationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stages = null,
    Object? method = null,
    Object? totalWaterRequirement = null,
    Object? waterQuality = null,
    Object? criticalStages = null,
  }) {
    return _then(_$IrrigationScheduleImpl(
      stages: null == stages
          ? _value._stages
          : stages // ignore: cast_nullable_to_non_nullable
              as List<IrrigationStage>,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      totalWaterRequirement: null == totalWaterRequirement
          ? _value.totalWaterRequirement
          : totalWaterRequirement // ignore: cast_nullable_to_non_nullable
              as double,
      waterQuality: null == waterQuality
          ? _value.waterQuality
          : waterQuality // ignore: cast_nullable_to_non_nullable
              as String,
      criticalStages: null == criticalStages
          ? _value._criticalStages
          : criticalStages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IrrigationScheduleImpl implements _IrrigationSchedule {
  const _$IrrigationScheduleImpl(
      {required final List<IrrigationStage> stages,
      required this.method,
      required this.totalWaterRequirement,
      required this.waterQuality,
      required final List<String> criticalStages})
      : _stages = stages,
        _criticalStages = criticalStages;

  factory _$IrrigationScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$IrrigationScheduleImplFromJson(json);

  final List<IrrigationStage> _stages;
  @override
  List<IrrigationStage> get stages {
    if (_stages is EqualUnmodifiableListView) return _stages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stages);
  }

  @override
  final String method;
  @override
  final double totalWaterRequirement;
  @override
  final String waterQuality;
  final List<String> _criticalStages;
  @override
  List<String> get criticalStages {
    if (_criticalStages is EqualUnmodifiableListView) return _criticalStages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_criticalStages);
  }

  @override
  String toString() {
    return 'IrrigationSchedule(stages: $stages, method: $method, totalWaterRequirement: $totalWaterRequirement, waterQuality: $waterQuality, criticalStages: $criticalStages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IrrigationScheduleImpl &&
            const DeepCollectionEquality().equals(other._stages, _stages) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.totalWaterRequirement, totalWaterRequirement) ||
                other.totalWaterRequirement == totalWaterRequirement) &&
            (identical(other.waterQuality, waterQuality) ||
                other.waterQuality == waterQuality) &&
            const DeepCollectionEquality()
                .equals(other._criticalStages, _criticalStages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_stages),
      method,
      totalWaterRequirement,
      waterQuality,
      const DeepCollectionEquality().hash(_criticalStages));

  /// Create a copy of IrrigationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IrrigationScheduleImplCopyWith<_$IrrigationScheduleImpl> get copyWith =>
      __$$IrrigationScheduleImplCopyWithImpl<_$IrrigationScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IrrigationScheduleImplToJson(
      this,
    );
  }
}

abstract class _IrrigationSchedule implements IrrigationSchedule {
  const factory _IrrigationSchedule(
      {required final List<IrrigationStage> stages,
      required final String method,
      required final double totalWaterRequirement,
      required final String waterQuality,
      required final List<String> criticalStages}) = _$IrrigationScheduleImpl;

  factory _IrrigationSchedule.fromJson(Map<String, dynamic> json) =
      _$IrrigationScheduleImpl.fromJson;

  @override
  List<IrrigationStage> get stages;
  @override
  String get method;
  @override
  double get totalWaterRequirement;
  @override
  String get waterQuality;
  @override
  List<String> get criticalStages;

  /// Create a copy of IrrigationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IrrigationScheduleImplCopyWith<_$IrrigationScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IrrigationStage _$IrrigationStageFromJson(Map<String, dynamic> json) {
  return _IrrigationStage.fromJson(json);
}

/// @nodoc
mixin _$IrrigationStage {
  String get stage => throw _privateConstructorUsedError;
  int get daysAfterSowing => throw _privateConstructorUsedError;
  double get waterAmount => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this IrrigationStage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IrrigationStage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IrrigationStageCopyWith<IrrigationStage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IrrigationStageCopyWith<$Res> {
  factory $IrrigationStageCopyWith(
          IrrigationStage value, $Res Function(IrrigationStage) then) =
      _$IrrigationStageCopyWithImpl<$Res, IrrigationStage>;
  @useResult
  $Res call(
      {String stage,
      int daysAfterSowing,
      double waterAmount,
      String frequency,
      String notes});
}

/// @nodoc
class _$IrrigationStageCopyWithImpl<$Res, $Val extends IrrigationStage>
    implements $IrrigationStageCopyWith<$Res> {
  _$IrrigationStageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IrrigationStage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? daysAfterSowing = null,
    Object? waterAmount = null,
    Object? frequency = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      daysAfterSowing: null == daysAfterSowing
          ? _value.daysAfterSowing
          : daysAfterSowing // ignore: cast_nullable_to_non_nullable
              as int,
      waterAmount: null == waterAmount
          ? _value.waterAmount
          : waterAmount // ignore: cast_nullable_to_non_nullable
              as double,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IrrigationStageImplCopyWith<$Res>
    implements $IrrigationStageCopyWith<$Res> {
  factory _$$IrrigationStageImplCopyWith(_$IrrigationStageImpl value,
          $Res Function(_$IrrigationStageImpl) then) =
      __$$IrrigationStageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stage,
      int daysAfterSowing,
      double waterAmount,
      String frequency,
      String notes});
}

/// @nodoc
class __$$IrrigationStageImplCopyWithImpl<$Res>
    extends _$IrrigationStageCopyWithImpl<$Res, _$IrrigationStageImpl>
    implements _$$IrrigationStageImplCopyWith<$Res> {
  __$$IrrigationStageImplCopyWithImpl(
      _$IrrigationStageImpl _value, $Res Function(_$IrrigationStageImpl) _then)
      : super(_value, _then);

  /// Create a copy of IrrigationStage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? daysAfterSowing = null,
    Object? waterAmount = null,
    Object? frequency = null,
    Object? notes = null,
  }) {
    return _then(_$IrrigationStageImpl(
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      daysAfterSowing: null == daysAfterSowing
          ? _value.daysAfterSowing
          : daysAfterSowing // ignore: cast_nullable_to_non_nullable
              as int,
      waterAmount: null == waterAmount
          ? _value.waterAmount
          : waterAmount // ignore: cast_nullable_to_non_nullable
              as double,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IrrigationStageImpl implements _IrrigationStage {
  const _$IrrigationStageImpl(
      {required this.stage,
      required this.daysAfterSowing,
      required this.waterAmount,
      required this.frequency,
      required this.notes});

  factory _$IrrigationStageImpl.fromJson(Map<String, dynamic> json) =>
      _$$IrrigationStageImplFromJson(json);

  @override
  final String stage;
  @override
  final int daysAfterSowing;
  @override
  final double waterAmount;
  @override
  final String frequency;
  @override
  final String notes;

  @override
  String toString() {
    return 'IrrigationStage(stage: $stage, daysAfterSowing: $daysAfterSowing, waterAmount: $waterAmount, frequency: $frequency, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IrrigationStageImpl &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.daysAfterSowing, daysAfterSowing) ||
                other.daysAfterSowing == daysAfterSowing) &&
            (identical(other.waterAmount, waterAmount) ||
                other.waterAmount == waterAmount) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, stage, daysAfterSowing, waterAmount, frequency, notes);

  /// Create a copy of IrrigationStage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IrrigationStageImplCopyWith<_$IrrigationStageImpl> get copyWith =>
      __$$IrrigationStageImplCopyWithImpl<_$IrrigationStageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IrrigationStageImplToJson(
      this,
    );
  }
}

abstract class _IrrigationStage implements IrrigationStage {
  const factory _IrrigationStage(
      {required final String stage,
      required final int daysAfterSowing,
      required final double waterAmount,
      required final String frequency,
      required final String notes}) = _$IrrigationStageImpl;

  factory _IrrigationStage.fromJson(Map<String, dynamic> json) =
      _$IrrigationStageImpl.fromJson;

  @override
  String get stage;
  @override
  int get daysAfterSowing;
  @override
  double get waterAmount;
  @override
  String get frequency;
  @override
  String get notes;

  /// Create a copy of IrrigationStage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IrrigationStageImplCopyWith<_$IrrigationStageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FertilizerSchedule _$FertilizerScheduleFromJson(Map<String, dynamic> json) {
  return _FertilizerSchedule.fromJson(json);
}

/// @nodoc
mixin _$FertilizerSchedule {
  List<FertilizerApplication> get applications =>
      throw _privateConstructorUsedError;
  OrganicFertilizers get organic => throw _privateConstructorUsedError;
  List<String> get micronutrients => throw _privateConstructorUsedError;
  String get soilTesting => throw _privateConstructorUsedError;

  /// Serializes this FertilizerSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FertilizerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FertilizerScheduleCopyWith<FertilizerSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FertilizerScheduleCopyWith<$Res> {
  factory $FertilizerScheduleCopyWith(
          FertilizerSchedule value, $Res Function(FertilizerSchedule) then) =
      _$FertilizerScheduleCopyWithImpl<$Res, FertilizerSchedule>;
  @useResult
  $Res call(
      {List<FertilizerApplication> applications,
      OrganicFertilizers organic,
      List<String> micronutrients,
      String soilTesting});

  $OrganicFertilizersCopyWith<$Res> get organic;
}

/// @nodoc
class _$FertilizerScheduleCopyWithImpl<$Res, $Val extends FertilizerSchedule>
    implements $FertilizerScheduleCopyWith<$Res> {
  _$FertilizerScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FertilizerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applications = null,
    Object? organic = null,
    Object? micronutrients = null,
    Object? soilTesting = null,
  }) {
    return _then(_value.copyWith(
      applications: null == applications
          ? _value.applications
          : applications // ignore: cast_nullable_to_non_nullable
              as List<FertilizerApplication>,
      organic: null == organic
          ? _value.organic
          : organic // ignore: cast_nullable_to_non_nullable
              as OrganicFertilizers,
      micronutrients: null == micronutrients
          ? _value.micronutrients
          : micronutrients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      soilTesting: null == soilTesting
          ? _value.soilTesting
          : soilTesting // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of FertilizerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganicFertilizersCopyWith<$Res> get organic {
    return $OrganicFertilizersCopyWith<$Res>(_value.organic, (value) {
      return _then(_value.copyWith(organic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FertilizerScheduleImplCopyWith<$Res>
    implements $FertilizerScheduleCopyWith<$Res> {
  factory _$$FertilizerScheduleImplCopyWith(_$FertilizerScheduleImpl value,
          $Res Function(_$FertilizerScheduleImpl) then) =
      __$$FertilizerScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<FertilizerApplication> applications,
      OrganicFertilizers organic,
      List<String> micronutrients,
      String soilTesting});

  @override
  $OrganicFertilizersCopyWith<$Res> get organic;
}

/// @nodoc
class __$$FertilizerScheduleImplCopyWithImpl<$Res>
    extends _$FertilizerScheduleCopyWithImpl<$Res, _$FertilizerScheduleImpl>
    implements _$$FertilizerScheduleImplCopyWith<$Res> {
  __$$FertilizerScheduleImplCopyWithImpl(_$FertilizerScheduleImpl _value,
      $Res Function(_$FertilizerScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of FertilizerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applications = null,
    Object? organic = null,
    Object? micronutrients = null,
    Object? soilTesting = null,
  }) {
    return _then(_$FertilizerScheduleImpl(
      applications: null == applications
          ? _value._applications
          : applications // ignore: cast_nullable_to_non_nullable
              as List<FertilizerApplication>,
      organic: null == organic
          ? _value.organic
          : organic // ignore: cast_nullable_to_non_nullable
              as OrganicFertilizers,
      micronutrients: null == micronutrients
          ? _value._micronutrients
          : micronutrients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      soilTesting: null == soilTesting
          ? _value.soilTesting
          : soilTesting // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FertilizerScheduleImpl implements _FertilizerSchedule {
  const _$FertilizerScheduleImpl(
      {required final List<FertilizerApplication> applications,
      required this.organic,
      required final List<String> micronutrients,
      required this.soilTesting})
      : _applications = applications,
        _micronutrients = micronutrients;

  factory _$FertilizerScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$FertilizerScheduleImplFromJson(json);

  final List<FertilizerApplication> _applications;
  @override
  List<FertilizerApplication> get applications {
    if (_applications is EqualUnmodifiableListView) return _applications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applications);
  }

  @override
  final OrganicFertilizers organic;
  final List<String> _micronutrients;
  @override
  List<String> get micronutrients {
    if (_micronutrients is EqualUnmodifiableListView) return _micronutrients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_micronutrients);
  }

  @override
  final String soilTesting;

  @override
  String toString() {
    return 'FertilizerSchedule(applications: $applications, organic: $organic, micronutrients: $micronutrients, soilTesting: $soilTesting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FertilizerScheduleImpl &&
            const DeepCollectionEquality()
                .equals(other._applications, _applications) &&
            (identical(other.organic, organic) || other.organic == organic) &&
            const DeepCollectionEquality()
                .equals(other._micronutrients, _micronutrients) &&
            (identical(other.soilTesting, soilTesting) ||
                other.soilTesting == soilTesting));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_applications),
      organic,
      const DeepCollectionEquality().hash(_micronutrients),
      soilTesting);

  /// Create a copy of FertilizerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FertilizerScheduleImplCopyWith<_$FertilizerScheduleImpl> get copyWith =>
      __$$FertilizerScheduleImplCopyWithImpl<_$FertilizerScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FertilizerScheduleImplToJson(
      this,
    );
  }
}

abstract class _FertilizerSchedule implements FertilizerSchedule {
  const factory _FertilizerSchedule(
      {required final List<FertilizerApplication> applications,
      required final OrganicFertilizers organic,
      required final List<String> micronutrients,
      required final String soilTesting}) = _$FertilizerScheduleImpl;

  factory _FertilizerSchedule.fromJson(Map<String, dynamic> json) =
      _$FertilizerScheduleImpl.fromJson;

  @override
  List<FertilizerApplication> get applications;
  @override
  OrganicFertilizers get organic;
  @override
  List<String> get micronutrients;
  @override
  String get soilTesting;

  /// Create a copy of FertilizerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FertilizerScheduleImplCopyWith<_$FertilizerScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FertilizerApplication _$FertilizerApplicationFromJson(
    Map<String, dynamic> json) {
  return _FertilizerApplication.fromJson(json);
}

/// @nodoc
mixin _$FertilizerApplication {
  String get stage => throw _privateConstructorUsedError;
  int get daysAfterSowing => throw _privateConstructorUsedError;
  String get npkRatio => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this FertilizerApplication to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FertilizerApplication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FertilizerApplicationCopyWith<FertilizerApplication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FertilizerApplicationCopyWith<$Res> {
  factory $FertilizerApplicationCopyWith(FertilizerApplication value,
          $Res Function(FertilizerApplication) then) =
      _$FertilizerApplicationCopyWithImpl<$Res, FertilizerApplication>;
  @useResult
  $Res call(
      {String stage,
      int daysAfterSowing,
      String npkRatio,
      double quantity,
      String unit,
      String method,
      String notes});
}

/// @nodoc
class _$FertilizerApplicationCopyWithImpl<$Res,
        $Val extends FertilizerApplication>
    implements $FertilizerApplicationCopyWith<$Res> {
  _$FertilizerApplicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FertilizerApplication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? daysAfterSowing = null,
    Object? npkRatio = null,
    Object? quantity = null,
    Object? unit = null,
    Object? method = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      daysAfterSowing: null == daysAfterSowing
          ? _value.daysAfterSowing
          : daysAfterSowing // ignore: cast_nullable_to_non_nullable
              as int,
      npkRatio: null == npkRatio
          ? _value.npkRatio
          : npkRatio // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FertilizerApplicationImplCopyWith<$Res>
    implements $FertilizerApplicationCopyWith<$Res> {
  factory _$$FertilizerApplicationImplCopyWith(
          _$FertilizerApplicationImpl value,
          $Res Function(_$FertilizerApplicationImpl) then) =
      __$$FertilizerApplicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stage,
      int daysAfterSowing,
      String npkRatio,
      double quantity,
      String unit,
      String method,
      String notes});
}

/// @nodoc
class __$$FertilizerApplicationImplCopyWithImpl<$Res>
    extends _$FertilizerApplicationCopyWithImpl<$Res,
        _$FertilizerApplicationImpl>
    implements _$$FertilizerApplicationImplCopyWith<$Res> {
  __$$FertilizerApplicationImplCopyWithImpl(_$FertilizerApplicationImpl _value,
      $Res Function(_$FertilizerApplicationImpl) _then)
      : super(_value, _then);

  /// Create a copy of FertilizerApplication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? daysAfterSowing = null,
    Object? npkRatio = null,
    Object? quantity = null,
    Object? unit = null,
    Object? method = null,
    Object? notes = null,
  }) {
    return _then(_$FertilizerApplicationImpl(
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      daysAfterSowing: null == daysAfterSowing
          ? _value.daysAfterSowing
          : daysAfterSowing // ignore: cast_nullable_to_non_nullable
              as int,
      npkRatio: null == npkRatio
          ? _value.npkRatio
          : npkRatio // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FertilizerApplicationImpl implements _FertilizerApplication {
  const _$FertilizerApplicationImpl(
      {required this.stage,
      required this.daysAfterSowing,
      required this.npkRatio,
      required this.quantity,
      required this.unit,
      required this.method,
      required this.notes});

  factory _$FertilizerApplicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$FertilizerApplicationImplFromJson(json);

  @override
  final String stage;
  @override
  final int daysAfterSowing;
  @override
  final String npkRatio;
  @override
  final double quantity;
  @override
  final String unit;
  @override
  final String method;
  @override
  final String notes;

  @override
  String toString() {
    return 'FertilizerApplication(stage: $stage, daysAfterSowing: $daysAfterSowing, npkRatio: $npkRatio, quantity: $quantity, unit: $unit, method: $method, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FertilizerApplicationImpl &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.daysAfterSowing, daysAfterSowing) ||
                other.daysAfterSowing == daysAfterSowing) &&
            (identical(other.npkRatio, npkRatio) ||
                other.npkRatio == npkRatio) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stage, daysAfterSowing, npkRatio,
      quantity, unit, method, notes);

  /// Create a copy of FertilizerApplication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FertilizerApplicationImplCopyWith<_$FertilizerApplicationImpl>
      get copyWith => __$$FertilizerApplicationImplCopyWithImpl<
          _$FertilizerApplicationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FertilizerApplicationImplToJson(
      this,
    );
  }
}

abstract class _FertilizerApplication implements FertilizerApplication {
  const factory _FertilizerApplication(
      {required final String stage,
      required final int daysAfterSowing,
      required final String npkRatio,
      required final double quantity,
      required final String unit,
      required final String method,
      required final String notes}) = _$FertilizerApplicationImpl;

  factory _FertilizerApplication.fromJson(Map<String, dynamic> json) =
      _$FertilizerApplicationImpl.fromJson;

  @override
  String get stage;
  @override
  int get daysAfterSowing;
  @override
  String get npkRatio;
  @override
  double get quantity;
  @override
  String get unit;
  @override
  String get method;
  @override
  String get notes;

  /// Create a copy of FertilizerApplication
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FertilizerApplicationImplCopyWith<_$FertilizerApplicationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OrganicFertilizers _$OrganicFertilizersFromJson(Map<String, dynamic> json) {
  return _OrganicFertilizers.fromJson(json);
}

/// @nodoc
mixin _$OrganicFertilizers {
  String get farmyardManure => throw _privateConstructorUsedError;
  String get compost => throw _privateConstructorUsedError;
  String get vermicompost => throw _privateConstructorUsedError;
  String get greenManure => throw _privateConstructorUsedError;
  List<String> get biofertilizers => throw _privateConstructorUsedError;

  /// Serializes this OrganicFertilizers to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrganicFertilizers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrganicFertilizersCopyWith<OrganicFertilizers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganicFertilizersCopyWith<$Res> {
  factory $OrganicFertilizersCopyWith(
          OrganicFertilizers value, $Res Function(OrganicFertilizers) then) =
      _$OrganicFertilizersCopyWithImpl<$Res, OrganicFertilizers>;
  @useResult
  $Res call(
      {String farmyardManure,
      String compost,
      String vermicompost,
      String greenManure,
      List<String> biofertilizers});
}

/// @nodoc
class _$OrganicFertilizersCopyWithImpl<$Res, $Val extends OrganicFertilizers>
    implements $OrganicFertilizersCopyWith<$Res> {
  _$OrganicFertilizersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrganicFertilizers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmyardManure = null,
    Object? compost = null,
    Object? vermicompost = null,
    Object? greenManure = null,
    Object? biofertilizers = null,
  }) {
    return _then(_value.copyWith(
      farmyardManure: null == farmyardManure
          ? _value.farmyardManure
          : farmyardManure // ignore: cast_nullable_to_non_nullable
              as String,
      compost: null == compost
          ? _value.compost
          : compost // ignore: cast_nullable_to_non_nullable
              as String,
      vermicompost: null == vermicompost
          ? _value.vermicompost
          : vermicompost // ignore: cast_nullable_to_non_nullable
              as String,
      greenManure: null == greenManure
          ? _value.greenManure
          : greenManure // ignore: cast_nullable_to_non_nullable
              as String,
      biofertilizers: null == biofertilizers
          ? _value.biofertilizers
          : biofertilizers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrganicFertilizersImplCopyWith<$Res>
    implements $OrganicFertilizersCopyWith<$Res> {
  factory _$$OrganicFertilizersImplCopyWith(_$OrganicFertilizersImpl value,
          $Res Function(_$OrganicFertilizersImpl) then) =
      __$$OrganicFertilizersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String farmyardManure,
      String compost,
      String vermicompost,
      String greenManure,
      List<String> biofertilizers});
}

/// @nodoc
class __$$OrganicFertilizersImplCopyWithImpl<$Res>
    extends _$OrganicFertilizersCopyWithImpl<$Res, _$OrganicFertilizersImpl>
    implements _$$OrganicFertilizersImplCopyWith<$Res> {
  __$$OrganicFertilizersImplCopyWithImpl(_$OrganicFertilizersImpl _value,
      $Res Function(_$OrganicFertilizersImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganicFertilizers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmyardManure = null,
    Object? compost = null,
    Object? vermicompost = null,
    Object? greenManure = null,
    Object? biofertilizers = null,
  }) {
    return _then(_$OrganicFertilizersImpl(
      farmyardManure: null == farmyardManure
          ? _value.farmyardManure
          : farmyardManure // ignore: cast_nullable_to_non_nullable
              as String,
      compost: null == compost
          ? _value.compost
          : compost // ignore: cast_nullable_to_non_nullable
              as String,
      vermicompost: null == vermicompost
          ? _value.vermicompost
          : vermicompost // ignore: cast_nullable_to_non_nullable
              as String,
      greenManure: null == greenManure
          ? _value.greenManure
          : greenManure // ignore: cast_nullable_to_non_nullable
              as String,
      biofertilizers: null == biofertilizers
          ? _value._biofertilizers
          : biofertilizers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrganicFertilizersImpl implements _OrganicFertilizers {
  const _$OrganicFertilizersImpl(
      {required this.farmyardManure,
      required this.compost,
      required this.vermicompost,
      required this.greenManure,
      required final List<String> biofertilizers})
      : _biofertilizers = biofertilizers;

  factory _$OrganicFertilizersImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganicFertilizersImplFromJson(json);

  @override
  final String farmyardManure;
  @override
  final String compost;
  @override
  final String vermicompost;
  @override
  final String greenManure;
  final List<String> _biofertilizers;
  @override
  List<String> get biofertilizers {
    if (_biofertilizers is EqualUnmodifiableListView) return _biofertilizers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_biofertilizers);
  }

  @override
  String toString() {
    return 'OrganicFertilizers(farmyardManure: $farmyardManure, compost: $compost, vermicompost: $vermicompost, greenManure: $greenManure, biofertilizers: $biofertilizers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganicFertilizersImpl &&
            (identical(other.farmyardManure, farmyardManure) ||
                other.farmyardManure == farmyardManure) &&
            (identical(other.compost, compost) || other.compost == compost) &&
            (identical(other.vermicompost, vermicompost) ||
                other.vermicompost == vermicompost) &&
            (identical(other.greenManure, greenManure) ||
                other.greenManure == greenManure) &&
            const DeepCollectionEquality()
                .equals(other._biofertilizers, _biofertilizers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      farmyardManure,
      compost,
      vermicompost,
      greenManure,
      const DeepCollectionEquality().hash(_biofertilizers));

  /// Create a copy of OrganicFertilizers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganicFertilizersImplCopyWith<_$OrganicFertilizersImpl> get copyWith =>
      __$$OrganicFertilizersImplCopyWithImpl<_$OrganicFertilizersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganicFertilizersImplToJson(
      this,
    );
  }
}

abstract class _OrganicFertilizers implements OrganicFertilizers {
  const factory _OrganicFertilizers(
      {required final String farmyardManure,
      required final String compost,
      required final String vermicompost,
      required final String greenManure,
      required final List<String> biofertilizers}) = _$OrganicFertilizersImpl;

  factory _OrganicFertilizers.fromJson(Map<String, dynamic> json) =
      _$OrganicFertilizersImpl.fromJson;

  @override
  String get farmyardManure;
  @override
  String get compost;
  @override
  String get vermicompost;
  @override
  String get greenManure;
  @override
  List<String> get biofertilizers;

  /// Create a copy of OrganicFertilizers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganicFertilizersImplCopyWith<_$OrganicFertilizersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PestManagement _$PestManagementFromJson(Map<String, dynamic> json) {
  return _PestManagement.fromJson(json);
}

/// @nodoc
mixin _$PestManagement {
  List<CommonPest> get pests => throw _privateConstructorUsedError;
  List<CommonDisease> get diseases => throw _privateConstructorUsedError;
  IntegratedPestManagement get ipm => throw _privateConstructorUsedError;
  List<String> get organicSolutions => throw _privateConstructorUsedError;
  List<String> get chemicalSolutions => throw _privateConstructorUsedError;

  /// Serializes this PestManagement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PestManagement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PestManagementCopyWith<PestManagement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PestManagementCopyWith<$Res> {
  factory $PestManagementCopyWith(
          PestManagement value, $Res Function(PestManagement) then) =
      _$PestManagementCopyWithImpl<$Res, PestManagement>;
  @useResult
  $Res call(
      {List<CommonPest> pests,
      List<CommonDisease> diseases,
      IntegratedPestManagement ipm,
      List<String> organicSolutions,
      List<String> chemicalSolutions});

  $IntegratedPestManagementCopyWith<$Res> get ipm;
}

/// @nodoc
class _$PestManagementCopyWithImpl<$Res, $Val extends PestManagement>
    implements $PestManagementCopyWith<$Res> {
  _$PestManagementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PestManagement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pests = null,
    Object? diseases = null,
    Object? ipm = null,
    Object? organicSolutions = null,
    Object? chemicalSolutions = null,
  }) {
    return _then(_value.copyWith(
      pests: null == pests
          ? _value.pests
          : pests // ignore: cast_nullable_to_non_nullable
              as List<CommonPest>,
      diseases: null == diseases
          ? _value.diseases
          : diseases // ignore: cast_nullable_to_non_nullable
              as List<CommonDisease>,
      ipm: null == ipm
          ? _value.ipm
          : ipm // ignore: cast_nullable_to_non_nullable
              as IntegratedPestManagement,
      organicSolutions: null == organicSolutions
          ? _value.organicSolutions
          : organicSolutions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      chemicalSolutions: null == chemicalSolutions
          ? _value.chemicalSolutions
          : chemicalSolutions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of PestManagement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IntegratedPestManagementCopyWith<$Res> get ipm {
    return $IntegratedPestManagementCopyWith<$Res>(_value.ipm, (value) {
      return _then(_value.copyWith(ipm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PestManagementImplCopyWith<$Res>
    implements $PestManagementCopyWith<$Res> {
  factory _$$PestManagementImplCopyWith(_$PestManagementImpl value,
          $Res Function(_$PestManagementImpl) then) =
      __$$PestManagementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CommonPest> pests,
      List<CommonDisease> diseases,
      IntegratedPestManagement ipm,
      List<String> organicSolutions,
      List<String> chemicalSolutions});

  @override
  $IntegratedPestManagementCopyWith<$Res> get ipm;
}

/// @nodoc
class __$$PestManagementImplCopyWithImpl<$Res>
    extends _$PestManagementCopyWithImpl<$Res, _$PestManagementImpl>
    implements _$$PestManagementImplCopyWith<$Res> {
  __$$PestManagementImplCopyWithImpl(
      _$PestManagementImpl _value, $Res Function(_$PestManagementImpl) _then)
      : super(_value, _then);

  /// Create a copy of PestManagement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pests = null,
    Object? diseases = null,
    Object? ipm = null,
    Object? organicSolutions = null,
    Object? chemicalSolutions = null,
  }) {
    return _then(_$PestManagementImpl(
      pests: null == pests
          ? _value._pests
          : pests // ignore: cast_nullable_to_non_nullable
              as List<CommonPest>,
      diseases: null == diseases
          ? _value._diseases
          : diseases // ignore: cast_nullable_to_non_nullable
              as List<CommonDisease>,
      ipm: null == ipm
          ? _value.ipm
          : ipm // ignore: cast_nullable_to_non_nullable
              as IntegratedPestManagement,
      organicSolutions: null == organicSolutions
          ? _value._organicSolutions
          : organicSolutions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      chemicalSolutions: null == chemicalSolutions
          ? _value._chemicalSolutions
          : chemicalSolutions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PestManagementImpl implements _PestManagement {
  const _$PestManagementImpl(
      {required final List<CommonPest> pests,
      required final List<CommonDisease> diseases,
      required this.ipm,
      required final List<String> organicSolutions,
      required final List<String> chemicalSolutions})
      : _pests = pests,
        _diseases = diseases,
        _organicSolutions = organicSolutions,
        _chemicalSolutions = chemicalSolutions;

  factory _$PestManagementImpl.fromJson(Map<String, dynamic> json) =>
      _$$PestManagementImplFromJson(json);

  final List<CommonPest> _pests;
  @override
  List<CommonPest> get pests {
    if (_pests is EqualUnmodifiableListView) return _pests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pests);
  }

  final List<CommonDisease> _diseases;
  @override
  List<CommonDisease> get diseases {
    if (_diseases is EqualUnmodifiableListView) return _diseases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseases);
  }

  @override
  final IntegratedPestManagement ipm;
  final List<String> _organicSolutions;
  @override
  List<String> get organicSolutions {
    if (_organicSolutions is EqualUnmodifiableListView)
      return _organicSolutions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organicSolutions);
  }

  final List<String> _chemicalSolutions;
  @override
  List<String> get chemicalSolutions {
    if (_chemicalSolutions is EqualUnmodifiableListView)
      return _chemicalSolutions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chemicalSolutions);
  }

  @override
  String toString() {
    return 'PestManagement(pests: $pests, diseases: $diseases, ipm: $ipm, organicSolutions: $organicSolutions, chemicalSolutions: $chemicalSolutions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PestManagementImpl &&
            const DeepCollectionEquality().equals(other._pests, _pests) &&
            const DeepCollectionEquality().equals(other._diseases, _diseases) &&
            (identical(other.ipm, ipm) || other.ipm == ipm) &&
            const DeepCollectionEquality()
                .equals(other._organicSolutions, _organicSolutions) &&
            const DeepCollectionEquality()
                .equals(other._chemicalSolutions, _chemicalSolutions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pests),
      const DeepCollectionEquality().hash(_diseases),
      ipm,
      const DeepCollectionEquality().hash(_organicSolutions),
      const DeepCollectionEquality().hash(_chemicalSolutions));

  /// Create a copy of PestManagement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PestManagementImplCopyWith<_$PestManagementImpl> get copyWith =>
      __$$PestManagementImplCopyWithImpl<_$PestManagementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PestManagementImplToJson(
      this,
    );
  }
}

abstract class _PestManagement implements PestManagement {
  const factory _PestManagement(
      {required final List<CommonPest> pests,
      required final List<CommonDisease> diseases,
      required final IntegratedPestManagement ipm,
      required final List<String> organicSolutions,
      required final List<String> chemicalSolutions}) = _$PestManagementImpl;

  factory _PestManagement.fromJson(Map<String, dynamic> json) =
      _$PestManagementImpl.fromJson;

  @override
  List<CommonPest> get pests;
  @override
  List<CommonDisease> get diseases;
  @override
  IntegratedPestManagement get ipm;
  @override
  List<String> get organicSolutions;
  @override
  List<String> get chemicalSolutions;

  /// Create a copy of PestManagement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PestManagementImplCopyWith<_$PestManagementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommonPest _$CommonPestFromJson(Map<String, dynamic> json) {
  return _CommonPest.fromJson(json);
}

/// @nodoc
mixin _$CommonPest {
  String get name => throw _privateConstructorUsedError;
  String get hindiName => throw _privateConstructorUsedError;
  String get scientificName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get symptoms => throw _privateConstructorUsedError;
  List<String> get control => throw _privateConstructorUsedError;
  String get severity => throw _privateConstructorUsedError;

  /// Serializes this CommonPest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommonPest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonPestCopyWith<CommonPest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonPestCopyWith<$Res> {
  factory $CommonPestCopyWith(
          CommonPest value, $Res Function(CommonPest) then) =
      _$CommonPestCopyWithImpl<$Res, CommonPest>;
  @useResult
  $Res call(
      {String name,
      String hindiName,
      String scientificName,
      String description,
      List<String> symptoms,
      List<String> control,
      String severity});
}

/// @nodoc
class _$CommonPestCopyWithImpl<$Res, $Val extends CommonPest>
    implements $CommonPestCopyWith<$Res> {
  _$CommonPestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonPest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hindiName = null,
    Object? scientificName = null,
    Object? description = null,
    Object? symptoms = null,
    Object? control = null,
    Object? severity = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      scientificName: null == scientificName
          ? _value.scientificName
          : scientificName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: null == symptoms
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      control: null == control
          ? _value.control
          : control // ignore: cast_nullable_to_non_nullable
              as List<String>,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonPestImplCopyWith<$Res>
    implements $CommonPestCopyWith<$Res> {
  factory _$$CommonPestImplCopyWith(
          _$CommonPestImpl value, $Res Function(_$CommonPestImpl) then) =
      __$$CommonPestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String hindiName,
      String scientificName,
      String description,
      List<String> symptoms,
      List<String> control,
      String severity});
}

/// @nodoc
class __$$CommonPestImplCopyWithImpl<$Res>
    extends _$CommonPestCopyWithImpl<$Res, _$CommonPestImpl>
    implements _$$CommonPestImplCopyWith<$Res> {
  __$$CommonPestImplCopyWithImpl(
      _$CommonPestImpl _value, $Res Function(_$CommonPestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommonPest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hindiName = null,
    Object? scientificName = null,
    Object? description = null,
    Object? symptoms = null,
    Object? control = null,
    Object? severity = null,
  }) {
    return _then(_$CommonPestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      scientificName: null == scientificName
          ? _value.scientificName
          : scientificName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: null == symptoms
          ? _value._symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      control: null == control
          ? _value._control
          : control // ignore: cast_nullable_to_non_nullable
              as List<String>,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonPestImpl implements _CommonPest {
  const _$CommonPestImpl(
      {required this.name,
      required this.hindiName,
      required this.scientificName,
      required this.description,
      required final List<String> symptoms,
      required final List<String> control,
      required this.severity})
      : _symptoms = symptoms,
        _control = control;

  factory _$CommonPestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonPestImplFromJson(json);

  @override
  final String name;
  @override
  final String hindiName;
  @override
  final String scientificName;
  @override
  final String description;
  final List<String> _symptoms;
  @override
  List<String> get symptoms {
    if (_symptoms is EqualUnmodifiableListView) return _symptoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptoms);
  }

  final List<String> _control;
  @override
  List<String> get control {
    if (_control is EqualUnmodifiableListView) return _control;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_control);
  }

  @override
  final String severity;

  @override
  String toString() {
    return 'CommonPest(name: $name, hindiName: $hindiName, scientificName: $scientificName, description: $description, symptoms: $symptoms, control: $control, severity: $severity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonPestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hindiName, hindiName) ||
                other.hindiName == hindiName) &&
            (identical(other.scientificName, scientificName) ||
                other.scientificName == scientificName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._symptoms, _symptoms) &&
            const DeepCollectionEquality().equals(other._control, _control) &&
            (identical(other.severity, severity) ||
                other.severity == severity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      hindiName,
      scientificName,
      description,
      const DeepCollectionEquality().hash(_symptoms),
      const DeepCollectionEquality().hash(_control),
      severity);

  /// Create a copy of CommonPest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonPestImplCopyWith<_$CommonPestImpl> get copyWith =>
      __$$CommonPestImplCopyWithImpl<_$CommonPestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonPestImplToJson(
      this,
    );
  }
}

abstract class _CommonPest implements CommonPest {
  const factory _CommonPest(
      {required final String name,
      required final String hindiName,
      required final String scientificName,
      required final String description,
      required final List<String> symptoms,
      required final List<String> control,
      required final String severity}) = _$CommonPestImpl;

  factory _CommonPest.fromJson(Map<String, dynamic> json) =
      _$CommonPestImpl.fromJson;

  @override
  String get name;
  @override
  String get hindiName;
  @override
  String get scientificName;
  @override
  String get description;
  @override
  List<String> get symptoms;
  @override
  List<String> get control;
  @override
  String get severity;

  /// Create a copy of CommonPest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonPestImplCopyWith<_$CommonPestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommonDisease _$CommonDiseaseFromJson(Map<String, dynamic> json) {
  return _CommonDisease.fromJson(json);
}

/// @nodoc
mixin _$CommonDisease {
  String get name => throw _privateConstructorUsedError;
  String get hindiName => throw _privateConstructorUsedError;
  String get scientificName => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<String> get symptoms => throw _privateConstructorUsedError;
  List<String> get prevention => throw _privateConstructorUsedError;
  List<String> get treatment => throw _privateConstructorUsedError;
  String get severity => throw _privateConstructorUsedError;

  /// Serializes this CommonDisease to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommonDisease
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonDiseaseCopyWith<CommonDisease> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonDiseaseCopyWith<$Res> {
  factory $CommonDiseaseCopyWith(
          CommonDisease value, $Res Function(CommonDisease) then) =
      _$CommonDiseaseCopyWithImpl<$Res, CommonDisease>;
  @useResult
  $Res call(
      {String name,
      String hindiName,
      String scientificName,
      String type,
      List<String> symptoms,
      List<String> prevention,
      List<String> treatment,
      String severity});
}

/// @nodoc
class _$CommonDiseaseCopyWithImpl<$Res, $Val extends CommonDisease>
    implements $CommonDiseaseCopyWith<$Res> {
  _$CommonDiseaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonDisease
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hindiName = null,
    Object? scientificName = null,
    Object? type = null,
    Object? symptoms = null,
    Object? prevention = null,
    Object? treatment = null,
    Object? severity = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      scientificName: null == scientificName
          ? _value.scientificName
          : scientificName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: null == symptoms
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prevention: null == prevention
          ? _value.prevention
          : prevention // ignore: cast_nullable_to_non_nullable
              as List<String>,
      treatment: null == treatment
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonDiseaseImplCopyWith<$Res>
    implements $CommonDiseaseCopyWith<$Res> {
  factory _$$CommonDiseaseImplCopyWith(
          _$CommonDiseaseImpl value, $Res Function(_$CommonDiseaseImpl) then) =
      __$$CommonDiseaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String hindiName,
      String scientificName,
      String type,
      List<String> symptoms,
      List<String> prevention,
      List<String> treatment,
      String severity});
}

/// @nodoc
class __$$CommonDiseaseImplCopyWithImpl<$Res>
    extends _$CommonDiseaseCopyWithImpl<$Res, _$CommonDiseaseImpl>
    implements _$$CommonDiseaseImplCopyWith<$Res> {
  __$$CommonDiseaseImplCopyWithImpl(
      _$CommonDiseaseImpl _value, $Res Function(_$CommonDiseaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommonDisease
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hindiName = null,
    Object? scientificName = null,
    Object? type = null,
    Object? symptoms = null,
    Object? prevention = null,
    Object? treatment = null,
    Object? severity = null,
  }) {
    return _then(_$CommonDiseaseImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      scientificName: null == scientificName
          ? _value.scientificName
          : scientificName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: null == symptoms
          ? _value._symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prevention: null == prevention
          ? _value._prevention
          : prevention // ignore: cast_nullable_to_non_nullable
              as List<String>,
      treatment: null == treatment
          ? _value._treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonDiseaseImpl implements _CommonDisease {
  const _$CommonDiseaseImpl(
      {required this.name,
      required this.hindiName,
      required this.scientificName,
      required this.type,
      required final List<String> symptoms,
      required final List<String> prevention,
      required final List<String> treatment,
      required this.severity})
      : _symptoms = symptoms,
        _prevention = prevention,
        _treatment = treatment;

  factory _$CommonDiseaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonDiseaseImplFromJson(json);

  @override
  final String name;
  @override
  final String hindiName;
  @override
  final String scientificName;
  @override
  final String type;
  final List<String> _symptoms;
  @override
  List<String> get symptoms {
    if (_symptoms is EqualUnmodifiableListView) return _symptoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptoms);
  }

  final List<String> _prevention;
  @override
  List<String> get prevention {
    if (_prevention is EqualUnmodifiableListView) return _prevention;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prevention);
  }

  final List<String> _treatment;
  @override
  List<String> get treatment {
    if (_treatment is EqualUnmodifiableListView) return _treatment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_treatment);
  }

  @override
  final String severity;

  @override
  String toString() {
    return 'CommonDisease(name: $name, hindiName: $hindiName, scientificName: $scientificName, type: $type, symptoms: $symptoms, prevention: $prevention, treatment: $treatment, severity: $severity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonDiseaseImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hindiName, hindiName) ||
                other.hindiName == hindiName) &&
            (identical(other.scientificName, scientificName) ||
                other.scientificName == scientificName) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._symptoms, _symptoms) &&
            const DeepCollectionEquality()
                .equals(other._prevention, _prevention) &&
            const DeepCollectionEquality()
                .equals(other._treatment, _treatment) &&
            (identical(other.severity, severity) ||
                other.severity == severity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      hindiName,
      scientificName,
      type,
      const DeepCollectionEquality().hash(_symptoms),
      const DeepCollectionEquality().hash(_prevention),
      const DeepCollectionEquality().hash(_treatment),
      severity);

  /// Create a copy of CommonDisease
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonDiseaseImplCopyWith<_$CommonDiseaseImpl> get copyWith =>
      __$$CommonDiseaseImplCopyWithImpl<_$CommonDiseaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonDiseaseImplToJson(
      this,
    );
  }
}

abstract class _CommonDisease implements CommonDisease {
  const factory _CommonDisease(
      {required final String name,
      required final String hindiName,
      required final String scientificName,
      required final String type,
      required final List<String> symptoms,
      required final List<String> prevention,
      required final List<String> treatment,
      required final String severity}) = _$CommonDiseaseImpl;

  factory _CommonDisease.fromJson(Map<String, dynamic> json) =
      _$CommonDiseaseImpl.fromJson;

  @override
  String get name;
  @override
  String get hindiName;
  @override
  String get scientificName;
  @override
  String get type;
  @override
  List<String> get symptoms;
  @override
  List<String> get prevention;
  @override
  List<String> get treatment;
  @override
  String get severity;

  /// Create a copy of CommonDisease
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonDiseaseImplCopyWith<_$CommonDiseaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IntegratedPestManagement _$IntegratedPestManagementFromJson(
    Map<String, dynamic> json) {
  return _IntegratedPestManagement.fromJson(json);
}

/// @nodoc
mixin _$IntegratedPestManagement {
  List<String> get cultural => throw _privateConstructorUsedError;
  List<String> get biological => throw _privateConstructorUsedError;
  List<String> get mechanical => throw _privateConstructorUsedError;
  List<String> get chemical => throw _privateConstructorUsedError;
  String get monitoring => throw _privateConstructorUsedError;

  /// Serializes this IntegratedPestManagement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IntegratedPestManagement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IntegratedPestManagementCopyWith<IntegratedPestManagement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntegratedPestManagementCopyWith<$Res> {
  factory $IntegratedPestManagementCopyWith(IntegratedPestManagement value,
          $Res Function(IntegratedPestManagement) then) =
      _$IntegratedPestManagementCopyWithImpl<$Res, IntegratedPestManagement>;
  @useResult
  $Res call(
      {List<String> cultural,
      List<String> biological,
      List<String> mechanical,
      List<String> chemical,
      String monitoring});
}

/// @nodoc
class _$IntegratedPestManagementCopyWithImpl<$Res,
        $Val extends IntegratedPestManagement>
    implements $IntegratedPestManagementCopyWith<$Res> {
  _$IntegratedPestManagementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IntegratedPestManagement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cultural = null,
    Object? biological = null,
    Object? mechanical = null,
    Object? chemical = null,
    Object? monitoring = null,
  }) {
    return _then(_value.copyWith(
      cultural: null == cultural
          ? _value.cultural
          : cultural // ignore: cast_nullable_to_non_nullable
              as List<String>,
      biological: null == biological
          ? _value.biological
          : biological // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mechanical: null == mechanical
          ? _value.mechanical
          : mechanical // ignore: cast_nullable_to_non_nullable
              as List<String>,
      chemical: null == chemical
          ? _value.chemical
          : chemical // ignore: cast_nullable_to_non_nullable
              as List<String>,
      monitoring: null == monitoring
          ? _value.monitoring
          : monitoring // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntegratedPestManagementImplCopyWith<$Res>
    implements $IntegratedPestManagementCopyWith<$Res> {
  factory _$$IntegratedPestManagementImplCopyWith(
          _$IntegratedPestManagementImpl value,
          $Res Function(_$IntegratedPestManagementImpl) then) =
      __$$IntegratedPestManagementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> cultural,
      List<String> biological,
      List<String> mechanical,
      List<String> chemical,
      String monitoring});
}

/// @nodoc
class __$$IntegratedPestManagementImplCopyWithImpl<$Res>
    extends _$IntegratedPestManagementCopyWithImpl<$Res,
        _$IntegratedPestManagementImpl>
    implements _$$IntegratedPestManagementImplCopyWith<$Res> {
  __$$IntegratedPestManagementImplCopyWithImpl(
      _$IntegratedPestManagementImpl _value,
      $Res Function(_$IntegratedPestManagementImpl) _then)
      : super(_value, _then);

  /// Create a copy of IntegratedPestManagement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cultural = null,
    Object? biological = null,
    Object? mechanical = null,
    Object? chemical = null,
    Object? monitoring = null,
  }) {
    return _then(_$IntegratedPestManagementImpl(
      cultural: null == cultural
          ? _value._cultural
          : cultural // ignore: cast_nullable_to_non_nullable
              as List<String>,
      biological: null == biological
          ? _value._biological
          : biological // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mechanical: null == mechanical
          ? _value._mechanical
          : mechanical // ignore: cast_nullable_to_non_nullable
              as List<String>,
      chemical: null == chemical
          ? _value._chemical
          : chemical // ignore: cast_nullable_to_non_nullable
              as List<String>,
      monitoring: null == monitoring
          ? _value.monitoring
          : monitoring // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IntegratedPestManagementImpl implements _IntegratedPestManagement {
  const _$IntegratedPestManagementImpl(
      {required final List<String> cultural,
      required final List<String> biological,
      required final List<String> mechanical,
      required final List<String> chemical,
      required this.monitoring})
      : _cultural = cultural,
        _biological = biological,
        _mechanical = mechanical,
        _chemical = chemical;

  factory _$IntegratedPestManagementImpl.fromJson(Map<String, dynamic> json) =>
      _$$IntegratedPestManagementImplFromJson(json);

  final List<String> _cultural;
  @override
  List<String> get cultural {
    if (_cultural is EqualUnmodifiableListView) return _cultural;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cultural);
  }

  final List<String> _biological;
  @override
  List<String> get biological {
    if (_biological is EqualUnmodifiableListView) return _biological;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_biological);
  }

  final List<String> _mechanical;
  @override
  List<String> get mechanical {
    if (_mechanical is EqualUnmodifiableListView) return _mechanical;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mechanical);
  }

  final List<String> _chemical;
  @override
  List<String> get chemical {
    if (_chemical is EqualUnmodifiableListView) return _chemical;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chemical);
  }

  @override
  final String monitoring;

  @override
  String toString() {
    return 'IntegratedPestManagement(cultural: $cultural, biological: $biological, mechanical: $mechanical, chemical: $chemical, monitoring: $monitoring)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntegratedPestManagementImpl &&
            const DeepCollectionEquality().equals(other._cultural, _cultural) &&
            const DeepCollectionEquality()
                .equals(other._biological, _biological) &&
            const DeepCollectionEquality()
                .equals(other._mechanical, _mechanical) &&
            const DeepCollectionEquality().equals(other._chemical, _chemical) &&
            (identical(other.monitoring, monitoring) ||
                other.monitoring == monitoring));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cultural),
      const DeepCollectionEquality().hash(_biological),
      const DeepCollectionEquality().hash(_mechanical),
      const DeepCollectionEquality().hash(_chemical),
      monitoring);

  /// Create a copy of IntegratedPestManagement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IntegratedPestManagementImplCopyWith<_$IntegratedPestManagementImpl>
      get copyWith => __$$IntegratedPestManagementImplCopyWithImpl<
          _$IntegratedPestManagementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IntegratedPestManagementImplToJson(
      this,
    );
  }
}

abstract class _IntegratedPestManagement implements IntegratedPestManagement {
  const factory _IntegratedPestManagement(
      {required final List<String> cultural,
      required final List<String> biological,
      required final List<String> mechanical,
      required final List<String> chemical,
      required final String monitoring}) = _$IntegratedPestManagementImpl;

  factory _IntegratedPestManagement.fromJson(Map<String, dynamic> json) =
      _$IntegratedPestManagementImpl.fromJson;

  @override
  List<String> get cultural;
  @override
  List<String> get biological;
  @override
  List<String> get mechanical;
  @override
  List<String> get chemical;
  @override
  String get monitoring;

  /// Create a copy of IntegratedPestManagement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IntegratedPestManagementImplCopyWith<_$IntegratedPestManagementImpl>
      get copyWith => throw _privateConstructorUsedError;
}

HarvestingInfo _$HarvestingInfoFromJson(Map<String, dynamic> json) {
  return _HarvestingInfo.fromJson(json);
}

/// @nodoc
mixin _$HarvestingInfo {
  List<String> get maturitySigns => throw _privateConstructorUsedError;
  String get harvestingMethod => throw _privateConstructorUsedError;
  String get bestTime => throw _privateConstructorUsedError;
  String get weatherConditions => throw _privateConstructorUsedError;
  String get tools => throw _privateConstructorUsedError;
  double get expectedYield => throw _privateConstructorUsedError;
  String get yieldUnit => throw _privateConstructorUsedError;

  /// Serializes this HarvestingInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HarvestingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HarvestingInfoCopyWith<HarvestingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HarvestingInfoCopyWith<$Res> {
  factory $HarvestingInfoCopyWith(
          HarvestingInfo value, $Res Function(HarvestingInfo) then) =
      _$HarvestingInfoCopyWithImpl<$Res, HarvestingInfo>;
  @useResult
  $Res call(
      {List<String> maturitySigns,
      String harvestingMethod,
      String bestTime,
      String weatherConditions,
      String tools,
      double expectedYield,
      String yieldUnit});
}

/// @nodoc
class _$HarvestingInfoCopyWithImpl<$Res, $Val extends HarvestingInfo>
    implements $HarvestingInfoCopyWith<$Res> {
  _$HarvestingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HarvestingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maturitySigns = null,
    Object? harvestingMethod = null,
    Object? bestTime = null,
    Object? weatherConditions = null,
    Object? tools = null,
    Object? expectedYield = null,
    Object? yieldUnit = null,
  }) {
    return _then(_value.copyWith(
      maturitySigns: null == maturitySigns
          ? _value.maturitySigns
          : maturitySigns // ignore: cast_nullable_to_non_nullable
              as List<String>,
      harvestingMethod: null == harvestingMethod
          ? _value.harvestingMethod
          : harvestingMethod // ignore: cast_nullable_to_non_nullable
              as String,
      bestTime: null == bestTime
          ? _value.bestTime
          : bestTime // ignore: cast_nullable_to_non_nullable
              as String,
      weatherConditions: null == weatherConditions
          ? _value.weatherConditions
          : weatherConditions // ignore: cast_nullable_to_non_nullable
              as String,
      tools: null == tools
          ? _value.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as String,
      expectedYield: null == expectedYield
          ? _value.expectedYield
          : expectedYield // ignore: cast_nullable_to_non_nullable
              as double,
      yieldUnit: null == yieldUnit
          ? _value.yieldUnit
          : yieldUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HarvestingInfoImplCopyWith<$Res>
    implements $HarvestingInfoCopyWith<$Res> {
  factory _$$HarvestingInfoImplCopyWith(_$HarvestingInfoImpl value,
          $Res Function(_$HarvestingInfoImpl) then) =
      __$$HarvestingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> maturitySigns,
      String harvestingMethod,
      String bestTime,
      String weatherConditions,
      String tools,
      double expectedYield,
      String yieldUnit});
}

/// @nodoc
class __$$HarvestingInfoImplCopyWithImpl<$Res>
    extends _$HarvestingInfoCopyWithImpl<$Res, _$HarvestingInfoImpl>
    implements _$$HarvestingInfoImplCopyWith<$Res> {
  __$$HarvestingInfoImplCopyWithImpl(
      _$HarvestingInfoImpl _value, $Res Function(_$HarvestingInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of HarvestingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maturitySigns = null,
    Object? harvestingMethod = null,
    Object? bestTime = null,
    Object? weatherConditions = null,
    Object? tools = null,
    Object? expectedYield = null,
    Object? yieldUnit = null,
  }) {
    return _then(_$HarvestingInfoImpl(
      maturitySigns: null == maturitySigns
          ? _value._maturitySigns
          : maturitySigns // ignore: cast_nullable_to_non_nullable
              as List<String>,
      harvestingMethod: null == harvestingMethod
          ? _value.harvestingMethod
          : harvestingMethod // ignore: cast_nullable_to_non_nullable
              as String,
      bestTime: null == bestTime
          ? _value.bestTime
          : bestTime // ignore: cast_nullable_to_non_nullable
              as String,
      weatherConditions: null == weatherConditions
          ? _value.weatherConditions
          : weatherConditions // ignore: cast_nullable_to_non_nullable
              as String,
      tools: null == tools
          ? _value.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as String,
      expectedYield: null == expectedYield
          ? _value.expectedYield
          : expectedYield // ignore: cast_nullable_to_non_nullable
              as double,
      yieldUnit: null == yieldUnit
          ? _value.yieldUnit
          : yieldUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HarvestingInfoImpl implements _HarvestingInfo {
  const _$HarvestingInfoImpl(
      {required final List<String> maturitySigns,
      required this.harvestingMethod,
      required this.bestTime,
      required this.weatherConditions,
      required this.tools,
      required this.expectedYield,
      required this.yieldUnit})
      : _maturitySigns = maturitySigns;

  factory _$HarvestingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HarvestingInfoImplFromJson(json);

  final List<String> _maturitySigns;
  @override
  List<String> get maturitySigns {
    if (_maturitySigns is EqualUnmodifiableListView) return _maturitySigns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_maturitySigns);
  }

  @override
  final String harvestingMethod;
  @override
  final String bestTime;
  @override
  final String weatherConditions;
  @override
  final String tools;
  @override
  final double expectedYield;
  @override
  final String yieldUnit;

  @override
  String toString() {
    return 'HarvestingInfo(maturitySigns: $maturitySigns, harvestingMethod: $harvestingMethod, bestTime: $bestTime, weatherConditions: $weatherConditions, tools: $tools, expectedYield: $expectedYield, yieldUnit: $yieldUnit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HarvestingInfoImpl &&
            const DeepCollectionEquality()
                .equals(other._maturitySigns, _maturitySigns) &&
            (identical(other.harvestingMethod, harvestingMethod) ||
                other.harvestingMethod == harvestingMethod) &&
            (identical(other.bestTime, bestTime) ||
                other.bestTime == bestTime) &&
            (identical(other.weatherConditions, weatherConditions) ||
                other.weatherConditions == weatherConditions) &&
            (identical(other.tools, tools) || other.tools == tools) &&
            (identical(other.expectedYield, expectedYield) ||
                other.expectedYield == expectedYield) &&
            (identical(other.yieldUnit, yieldUnit) ||
                other.yieldUnit == yieldUnit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_maturitySigns),
      harvestingMethod,
      bestTime,
      weatherConditions,
      tools,
      expectedYield,
      yieldUnit);

  /// Create a copy of HarvestingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HarvestingInfoImplCopyWith<_$HarvestingInfoImpl> get copyWith =>
      __$$HarvestingInfoImplCopyWithImpl<_$HarvestingInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HarvestingInfoImplToJson(
      this,
    );
  }
}

abstract class _HarvestingInfo implements HarvestingInfo {
  const factory _HarvestingInfo(
      {required final List<String> maturitySigns,
      required final String harvestingMethod,
      required final String bestTime,
      required final String weatherConditions,
      required final String tools,
      required final double expectedYield,
      required final String yieldUnit}) = _$HarvestingInfoImpl;

  factory _HarvestingInfo.fromJson(Map<String, dynamic> json) =
      _$HarvestingInfoImpl.fromJson;

  @override
  List<String> get maturitySigns;
  @override
  String get harvestingMethod;
  @override
  String get bestTime;
  @override
  String get weatherConditions;
  @override
  String get tools;
  @override
  double get expectedYield;
  @override
  String get yieldUnit;

  /// Create a copy of HarvestingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HarvestingInfoImplCopyWith<_$HarvestingInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostHarvestCare _$PostHarvestCareFromJson(Map<String, dynamic> json) {
  return _PostHarvestCare.fromJson(json);
}

/// @nodoc
mixin _$PostHarvestCare {
  List<String> get processing => throw _privateConstructorUsedError;
  StorageInfo get storage => throw _privateConstructorUsedError;
  List<String> get packaging => throw _privateConstructorUsedError;
  List<String> get transportation => throw _privateConstructorUsedError;
  QualityStandards get quality => throw _privateConstructorUsedError;

  /// Serializes this PostHarvestCare to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostHarvestCare
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostHarvestCareCopyWith<PostHarvestCare> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostHarvestCareCopyWith<$Res> {
  factory $PostHarvestCareCopyWith(
          PostHarvestCare value, $Res Function(PostHarvestCare) then) =
      _$PostHarvestCareCopyWithImpl<$Res, PostHarvestCare>;
  @useResult
  $Res call(
      {List<String> processing,
      StorageInfo storage,
      List<String> packaging,
      List<String> transportation,
      QualityStandards quality});

  $StorageInfoCopyWith<$Res> get storage;
  $QualityStandardsCopyWith<$Res> get quality;
}

/// @nodoc
class _$PostHarvestCareCopyWithImpl<$Res, $Val extends PostHarvestCare>
    implements $PostHarvestCareCopyWith<$Res> {
  _$PostHarvestCareCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostHarvestCare
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processing = null,
    Object? storage = null,
    Object? packaging = null,
    Object? transportation = null,
    Object? quality = null,
  }) {
    return _then(_value.copyWith(
      processing: null == processing
          ? _value.processing
          : processing // ignore: cast_nullable_to_non_nullable
              as List<String>,
      storage: null == storage
          ? _value.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as StorageInfo,
      packaging: null == packaging
          ? _value.packaging
          : packaging // ignore: cast_nullable_to_non_nullable
              as List<String>,
      transportation: null == transportation
          ? _value.transportation
          : transportation // ignore: cast_nullable_to_non_nullable
              as List<String>,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as QualityStandards,
    ) as $Val);
  }

  /// Create a copy of PostHarvestCare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StorageInfoCopyWith<$Res> get storage {
    return $StorageInfoCopyWith<$Res>(_value.storage, (value) {
      return _then(_value.copyWith(storage: value) as $Val);
    });
  }

  /// Create a copy of PostHarvestCare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QualityStandardsCopyWith<$Res> get quality {
    return $QualityStandardsCopyWith<$Res>(_value.quality, (value) {
      return _then(_value.copyWith(quality: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostHarvestCareImplCopyWith<$Res>
    implements $PostHarvestCareCopyWith<$Res> {
  factory _$$PostHarvestCareImplCopyWith(_$PostHarvestCareImpl value,
          $Res Function(_$PostHarvestCareImpl) then) =
      __$$PostHarvestCareImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> processing,
      StorageInfo storage,
      List<String> packaging,
      List<String> transportation,
      QualityStandards quality});

  @override
  $StorageInfoCopyWith<$Res> get storage;
  @override
  $QualityStandardsCopyWith<$Res> get quality;
}

/// @nodoc
class __$$PostHarvestCareImplCopyWithImpl<$Res>
    extends _$PostHarvestCareCopyWithImpl<$Res, _$PostHarvestCareImpl>
    implements _$$PostHarvestCareImplCopyWith<$Res> {
  __$$PostHarvestCareImplCopyWithImpl(
      _$PostHarvestCareImpl _value, $Res Function(_$PostHarvestCareImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostHarvestCare
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processing = null,
    Object? storage = null,
    Object? packaging = null,
    Object? transportation = null,
    Object? quality = null,
  }) {
    return _then(_$PostHarvestCareImpl(
      processing: null == processing
          ? _value._processing
          : processing // ignore: cast_nullable_to_non_nullable
              as List<String>,
      storage: null == storage
          ? _value.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as StorageInfo,
      packaging: null == packaging
          ? _value._packaging
          : packaging // ignore: cast_nullable_to_non_nullable
              as List<String>,
      transportation: null == transportation
          ? _value._transportation
          : transportation // ignore: cast_nullable_to_non_nullable
              as List<String>,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as QualityStandards,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostHarvestCareImpl implements _PostHarvestCare {
  const _$PostHarvestCareImpl(
      {required final List<String> processing,
      required this.storage,
      required final List<String> packaging,
      required final List<String> transportation,
      required this.quality})
      : _processing = processing,
        _packaging = packaging,
        _transportation = transportation;

  factory _$PostHarvestCareImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostHarvestCareImplFromJson(json);

  final List<String> _processing;
  @override
  List<String> get processing {
    if (_processing is EqualUnmodifiableListView) return _processing;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_processing);
  }

  @override
  final StorageInfo storage;
  final List<String> _packaging;
  @override
  List<String> get packaging {
    if (_packaging is EqualUnmodifiableListView) return _packaging;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packaging);
  }

  final List<String> _transportation;
  @override
  List<String> get transportation {
    if (_transportation is EqualUnmodifiableListView) return _transportation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transportation);
  }

  @override
  final QualityStandards quality;

  @override
  String toString() {
    return 'PostHarvestCare(processing: $processing, storage: $storage, packaging: $packaging, transportation: $transportation, quality: $quality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostHarvestCareImpl &&
            const DeepCollectionEquality()
                .equals(other._processing, _processing) &&
            (identical(other.storage, storage) || other.storage == storage) &&
            const DeepCollectionEquality()
                .equals(other._packaging, _packaging) &&
            const DeepCollectionEquality()
                .equals(other._transportation, _transportation) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_processing),
      storage,
      const DeepCollectionEquality().hash(_packaging),
      const DeepCollectionEquality().hash(_transportation),
      quality);

  /// Create a copy of PostHarvestCare
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostHarvestCareImplCopyWith<_$PostHarvestCareImpl> get copyWith =>
      __$$PostHarvestCareImplCopyWithImpl<_$PostHarvestCareImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostHarvestCareImplToJson(
      this,
    );
  }
}

abstract class _PostHarvestCare implements PostHarvestCare {
  const factory _PostHarvestCare(
      {required final List<String> processing,
      required final StorageInfo storage,
      required final List<String> packaging,
      required final List<String> transportation,
      required final QualityStandards quality}) = _$PostHarvestCareImpl;

  factory _PostHarvestCare.fromJson(Map<String, dynamic> json) =
      _$PostHarvestCareImpl.fromJson;

  @override
  List<String> get processing;
  @override
  StorageInfo get storage;
  @override
  List<String> get packaging;
  @override
  List<String> get transportation;
  @override
  QualityStandards get quality;

  /// Create a copy of PostHarvestCare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostHarvestCareImplCopyWith<_$PostHarvestCareImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StorageInfo _$StorageInfoFromJson(Map<String, dynamic> json) {
  return _StorageInfo.fromJson(json);
}

/// @nodoc
mixin _$StorageInfo {
  String get method => throw _privateConstructorUsedError;
  String get temperature => throw _privateConstructorUsedError;
  String get humidity => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;
  List<String> get precautions => throw _privateConstructorUsedError;

  /// Serializes this StorageInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StorageInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StorageInfoCopyWith<StorageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageInfoCopyWith<$Res> {
  factory $StorageInfoCopyWith(
          StorageInfo value, $Res Function(StorageInfo) then) =
      _$StorageInfoCopyWithImpl<$Res, StorageInfo>;
  @useResult
  $Res call(
      {String method,
      String temperature,
      String humidity,
      String duration,
      List<String> precautions});
}

/// @nodoc
class _$StorageInfoCopyWithImpl<$Res, $Val extends StorageInfo>
    implements $StorageInfoCopyWith<$Res> {
  _$StorageInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StorageInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? temperature = null,
    Object? humidity = null,
    Object? duration = null,
    Object? precautions = null,
  }) {
    return _then(_value.copyWith(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      precautions: null == precautions
          ? _value.precautions
          : precautions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StorageInfoImplCopyWith<$Res>
    implements $StorageInfoCopyWith<$Res> {
  factory _$$StorageInfoImplCopyWith(
          _$StorageInfoImpl value, $Res Function(_$StorageInfoImpl) then) =
      __$$StorageInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String method,
      String temperature,
      String humidity,
      String duration,
      List<String> precautions});
}

/// @nodoc
class __$$StorageInfoImplCopyWithImpl<$Res>
    extends _$StorageInfoCopyWithImpl<$Res, _$StorageInfoImpl>
    implements _$$StorageInfoImplCopyWith<$Res> {
  __$$StorageInfoImplCopyWithImpl(
      _$StorageInfoImpl _value, $Res Function(_$StorageInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of StorageInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? temperature = null,
    Object? humidity = null,
    Object? duration = null,
    Object? precautions = null,
  }) {
    return _then(_$StorageInfoImpl(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      precautions: null == precautions
          ? _value._precautions
          : precautions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StorageInfoImpl implements _StorageInfo {
  const _$StorageInfoImpl(
      {required this.method,
      required this.temperature,
      required this.humidity,
      required this.duration,
      required final List<String> precautions})
      : _precautions = precautions;

  factory _$StorageInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StorageInfoImplFromJson(json);

  @override
  final String method;
  @override
  final String temperature;
  @override
  final String humidity;
  @override
  final String duration;
  final List<String> _precautions;
  @override
  List<String> get precautions {
    if (_precautions is EqualUnmodifiableListView) return _precautions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_precautions);
  }

  @override
  String toString() {
    return 'StorageInfo(method: $method, temperature: $temperature, humidity: $humidity, duration: $duration, precautions: $precautions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageInfoImpl &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality()
                .equals(other._precautions, _precautions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, method, temperature, humidity,
      duration, const DeepCollectionEquality().hash(_precautions));

  /// Create a copy of StorageInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageInfoImplCopyWith<_$StorageInfoImpl> get copyWith =>
      __$$StorageInfoImplCopyWithImpl<_$StorageInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StorageInfoImplToJson(
      this,
    );
  }
}

abstract class _StorageInfo implements StorageInfo {
  const factory _StorageInfo(
      {required final String method,
      required final String temperature,
      required final String humidity,
      required final String duration,
      required final List<String> precautions}) = _$StorageInfoImpl;

  factory _StorageInfo.fromJson(Map<String, dynamic> json) =
      _$StorageInfoImpl.fromJson;

  @override
  String get method;
  @override
  String get temperature;
  @override
  String get humidity;
  @override
  String get duration;
  @override
  List<String> get precautions;

  /// Create a copy of StorageInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StorageInfoImplCopyWith<_$StorageInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QualityStandards _$QualityStandardsFromJson(Map<String, dynamic> json) {
  return _QualityStandards.fromJson(json);
}

/// @nodoc
mixin _$QualityStandards {
  List<String> get grades => throw _privateConstructorUsedError;
  List<String> get specifications => throw _privateConstructorUsedError;
  String get certification => throw _privateConstructorUsedError;
  List<String> get export => throw _privateConstructorUsedError;

  /// Serializes this QualityStandards to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QualityStandards
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QualityStandardsCopyWith<QualityStandards> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QualityStandardsCopyWith<$Res> {
  factory $QualityStandardsCopyWith(
          QualityStandards value, $Res Function(QualityStandards) then) =
      _$QualityStandardsCopyWithImpl<$Res, QualityStandards>;
  @useResult
  $Res call(
      {List<String> grades,
      List<String> specifications,
      String certification,
      List<String> export});
}

/// @nodoc
class _$QualityStandardsCopyWithImpl<$Res, $Val extends QualityStandards>
    implements $QualityStandardsCopyWith<$Res> {
  _$QualityStandardsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QualityStandards
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grades = null,
    Object? specifications = null,
    Object? certification = null,
    Object? export = null,
  }) {
    return _then(_value.copyWith(
      grades: null == grades
          ? _value.grades
          : grades // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specifications: null == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      certification: null == certification
          ? _value.certification
          : certification // ignore: cast_nullable_to_non_nullable
              as String,
      export: null == export
          ? _value.export
          : export // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QualityStandardsImplCopyWith<$Res>
    implements $QualityStandardsCopyWith<$Res> {
  factory _$$QualityStandardsImplCopyWith(_$QualityStandardsImpl value,
          $Res Function(_$QualityStandardsImpl) then) =
      __$$QualityStandardsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> grades,
      List<String> specifications,
      String certification,
      List<String> export});
}

/// @nodoc
class __$$QualityStandardsImplCopyWithImpl<$Res>
    extends _$QualityStandardsCopyWithImpl<$Res, _$QualityStandardsImpl>
    implements _$$QualityStandardsImplCopyWith<$Res> {
  __$$QualityStandardsImplCopyWithImpl(_$QualityStandardsImpl _value,
      $Res Function(_$QualityStandardsImpl) _then)
      : super(_value, _then);

  /// Create a copy of QualityStandards
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grades = null,
    Object? specifications = null,
    Object? certification = null,
    Object? export = null,
  }) {
    return _then(_$QualityStandardsImpl(
      grades: null == grades
          ? _value._grades
          : grades // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specifications: null == specifications
          ? _value._specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      certification: null == certification
          ? _value.certification
          : certification // ignore: cast_nullable_to_non_nullable
              as String,
      export: null == export
          ? _value._export
          : export // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QualityStandardsImpl implements _QualityStandards {
  const _$QualityStandardsImpl(
      {required final List<String> grades,
      required final List<String> specifications,
      required this.certification,
      required final List<String> export})
      : _grades = grades,
        _specifications = specifications,
        _export = export;

  factory _$QualityStandardsImpl.fromJson(Map<String, dynamic> json) =>
      _$$QualityStandardsImplFromJson(json);

  final List<String> _grades;
  @override
  List<String> get grades {
    if (_grades is EqualUnmodifiableListView) return _grades;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_grades);
  }

  final List<String> _specifications;
  @override
  List<String> get specifications {
    if (_specifications is EqualUnmodifiableListView) return _specifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specifications);
  }

  @override
  final String certification;
  final List<String> _export;
  @override
  List<String> get export {
    if (_export is EqualUnmodifiableListView) return _export;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_export);
  }

  @override
  String toString() {
    return 'QualityStandards(grades: $grades, specifications: $specifications, certification: $certification, export: $export)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QualityStandardsImpl &&
            const DeepCollectionEquality().equals(other._grades, _grades) &&
            const DeepCollectionEquality()
                .equals(other._specifications, _specifications) &&
            (identical(other.certification, certification) ||
                other.certification == certification) &&
            const DeepCollectionEquality().equals(other._export, _export));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_grades),
      const DeepCollectionEquality().hash(_specifications),
      certification,
      const DeepCollectionEquality().hash(_export));

  /// Create a copy of QualityStandards
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QualityStandardsImplCopyWith<_$QualityStandardsImpl> get copyWith =>
      __$$QualityStandardsImplCopyWithImpl<_$QualityStandardsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QualityStandardsImplToJson(
      this,
    );
  }
}

abstract class _QualityStandards implements QualityStandards {
  const factory _QualityStandards(
      {required final List<String> grades,
      required final List<String> specifications,
      required final String certification,
      required final List<String> export}) = _$QualityStandardsImpl;

  factory _QualityStandards.fromJson(Map<String, dynamic> json) =
      _$QualityStandardsImpl.fromJson;

  @override
  List<String> get grades;
  @override
  List<String> get specifications;
  @override
  String get certification;
  @override
  List<String> get export;

  /// Create a copy of QualityStandards
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QualityStandardsImplCopyWith<_$QualityStandardsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarketInfo _$MarketInfoFromJson(Map<String, dynamic> json) {
  return _MarketInfo.fromJson(json);
}

/// @nodoc
mixin _$MarketInfo {
  double get currentPrice => throw _privateConstructorUsedError;
  String get priceUnit => throw _privateConstructorUsedError;
  List<String> get majorMarkets => throw _privateConstructorUsedError;
  String get demand => throw _privateConstructorUsedError;
  String get exportPotential => throw _privateConstructorUsedError;
  List<String> get buyers => throw _privateConstructorUsedError;
  String get priceRange => throw _privateConstructorUsedError;

  /// Serializes this MarketInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MarketInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarketInfoCopyWith<MarketInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketInfoCopyWith<$Res> {
  factory $MarketInfoCopyWith(
          MarketInfo value, $Res Function(MarketInfo) then) =
      _$MarketInfoCopyWithImpl<$Res, MarketInfo>;
  @useResult
  $Res call(
      {double currentPrice,
      String priceUnit,
      List<String> majorMarkets,
      String demand,
      String exportPotential,
      List<String> buyers,
      String priceRange});
}

/// @nodoc
class _$MarketInfoCopyWithImpl<$Res, $Val extends MarketInfo>
    implements $MarketInfoCopyWith<$Res> {
  _$MarketInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarketInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPrice = null,
    Object? priceUnit = null,
    Object? majorMarkets = null,
    Object? demand = null,
    Object? exportPotential = null,
    Object? buyers = null,
    Object? priceRange = null,
  }) {
    return _then(_value.copyWith(
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      priceUnit: null == priceUnit
          ? _value.priceUnit
          : priceUnit // ignore: cast_nullable_to_non_nullable
              as String,
      majorMarkets: null == majorMarkets
          ? _value.majorMarkets
          : majorMarkets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      demand: null == demand
          ? _value.demand
          : demand // ignore: cast_nullable_to_non_nullable
              as String,
      exportPotential: null == exportPotential
          ? _value.exportPotential
          : exportPotential // ignore: cast_nullable_to_non_nullable
              as String,
      buyers: null == buyers
          ? _value.buyers
          : buyers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priceRange: null == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketInfoImplCopyWith<$Res>
    implements $MarketInfoCopyWith<$Res> {
  factory _$$MarketInfoImplCopyWith(
          _$MarketInfoImpl value, $Res Function(_$MarketInfoImpl) then) =
      __$$MarketInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double currentPrice,
      String priceUnit,
      List<String> majorMarkets,
      String demand,
      String exportPotential,
      List<String> buyers,
      String priceRange});
}

/// @nodoc
class __$$MarketInfoImplCopyWithImpl<$Res>
    extends _$MarketInfoCopyWithImpl<$Res, _$MarketInfoImpl>
    implements _$$MarketInfoImplCopyWith<$Res> {
  __$$MarketInfoImplCopyWithImpl(
      _$MarketInfoImpl _value, $Res Function(_$MarketInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MarketInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPrice = null,
    Object? priceUnit = null,
    Object? majorMarkets = null,
    Object? demand = null,
    Object? exportPotential = null,
    Object? buyers = null,
    Object? priceRange = null,
  }) {
    return _then(_$MarketInfoImpl(
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      priceUnit: null == priceUnit
          ? _value.priceUnit
          : priceUnit // ignore: cast_nullable_to_non_nullable
              as String,
      majorMarkets: null == majorMarkets
          ? _value._majorMarkets
          : majorMarkets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      demand: null == demand
          ? _value.demand
          : demand // ignore: cast_nullable_to_non_nullable
              as String,
      exportPotential: null == exportPotential
          ? _value.exportPotential
          : exportPotential // ignore: cast_nullable_to_non_nullable
              as String,
      buyers: null == buyers
          ? _value._buyers
          : buyers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priceRange: null == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketInfoImpl implements _MarketInfo {
  const _$MarketInfoImpl(
      {required this.currentPrice,
      required this.priceUnit,
      required final List<String> majorMarkets,
      required this.demand,
      required this.exportPotential,
      required final List<String> buyers,
      required this.priceRange})
      : _majorMarkets = majorMarkets,
        _buyers = buyers;

  factory _$MarketInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketInfoImplFromJson(json);

  @override
  final double currentPrice;
  @override
  final String priceUnit;
  final List<String> _majorMarkets;
  @override
  List<String> get majorMarkets {
    if (_majorMarkets is EqualUnmodifiableListView) return _majorMarkets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_majorMarkets);
  }

  @override
  final String demand;
  @override
  final String exportPotential;
  final List<String> _buyers;
  @override
  List<String> get buyers {
    if (_buyers is EqualUnmodifiableListView) return _buyers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_buyers);
  }

  @override
  final String priceRange;

  @override
  String toString() {
    return 'MarketInfo(currentPrice: $currentPrice, priceUnit: $priceUnit, majorMarkets: $majorMarkets, demand: $demand, exportPotential: $exportPotential, buyers: $buyers, priceRange: $priceRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketInfoImpl &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.priceUnit, priceUnit) ||
                other.priceUnit == priceUnit) &&
            const DeepCollectionEquality()
                .equals(other._majorMarkets, _majorMarkets) &&
            (identical(other.demand, demand) || other.demand == demand) &&
            (identical(other.exportPotential, exportPotential) ||
                other.exportPotential == exportPotential) &&
            const DeepCollectionEquality().equals(other._buyers, _buyers) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPrice,
      priceUnit,
      const DeepCollectionEquality().hash(_majorMarkets),
      demand,
      exportPotential,
      const DeepCollectionEquality().hash(_buyers),
      priceRange);

  /// Create a copy of MarketInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketInfoImplCopyWith<_$MarketInfoImpl> get copyWith =>
      __$$MarketInfoImplCopyWithImpl<_$MarketInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketInfoImplToJson(
      this,
    );
  }
}

abstract class _MarketInfo implements MarketInfo {
  const factory _MarketInfo(
      {required final double currentPrice,
      required final String priceUnit,
      required final List<String> majorMarkets,
      required final String demand,
      required final String exportPotential,
      required final List<String> buyers,
      required final String priceRange}) = _$MarketInfoImpl;

  factory _MarketInfo.fromJson(Map<String, dynamic> json) =
      _$MarketInfoImpl.fromJson;

  @override
  double get currentPrice;
  @override
  String get priceUnit;
  @override
  List<String> get majorMarkets;
  @override
  String get demand;
  @override
  String get exportPotential;
  @override
  List<String> get buyers;
  @override
  String get priceRange;

  /// Create a copy of MarketInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarketInfoImplCopyWith<_$MarketInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GovernmentScheme _$GovernmentSchemeFromJson(Map<String, dynamic> json) {
  return _GovernmentScheme.fromJson(json);
}

/// @nodoc
mixin _$GovernmentScheme {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get hindiName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get ministry => throw _privateConstructorUsedError;
  List<String> get benefits => throw _privateConstructorUsedError;
  EligibilityCriteria get eligibility => throw _privateConstructorUsedError;
  ApplicationProcess get application => throw _privateConstructorUsedError;
  List<String> get documents => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;
  String get helpline => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  List<IndianState> get applicableStates => throw _privateConstructorUsedError;

  /// Serializes this GovernmentScheme to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GovernmentScheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GovernmentSchemeCopyWith<GovernmentScheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GovernmentSchemeCopyWith<$Res> {
  factory $GovernmentSchemeCopyWith(
          GovernmentScheme value, $Res Function(GovernmentScheme) then) =
      _$GovernmentSchemeCopyWithImpl<$Res, GovernmentScheme>;
  @useResult
  $Res call(
      {String id,
      String name,
      String hindiName,
      String description,
      String ministry,
      List<String> benefits,
      EligibilityCriteria eligibility,
      ApplicationProcess application,
      List<String> documents,
      String website,
      String helpline,
      bool isActive,
      DateTime lastUpdated,
      List<IndianState> applicableStates});

  $EligibilityCriteriaCopyWith<$Res> get eligibility;
  $ApplicationProcessCopyWith<$Res> get application;
}

/// @nodoc
class _$GovernmentSchemeCopyWithImpl<$Res, $Val extends GovernmentScheme>
    implements $GovernmentSchemeCopyWith<$Res> {
  _$GovernmentSchemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GovernmentScheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hindiName = null,
    Object? description = null,
    Object? ministry = null,
    Object? benefits = null,
    Object? eligibility = null,
    Object? application = null,
    Object? documents = null,
    Object? website = null,
    Object? helpline = null,
    Object? isActive = null,
    Object? lastUpdated = null,
    Object? applicableStates = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ministry: null == ministry
          ? _value.ministry
          : ministry // ignore: cast_nullable_to_non_nullable
              as String,
      benefits: null == benefits
          ? _value.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eligibility: null == eligibility
          ? _value.eligibility
          : eligibility // ignore: cast_nullable_to_non_nullable
              as EligibilityCriteria,
      application: null == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationProcess,
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String>,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      helpline: null == helpline
          ? _value.helpline
          : helpline // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      applicableStates: null == applicableStates
          ? _value.applicableStates
          : applicableStates // ignore: cast_nullable_to_non_nullable
              as List<IndianState>,
    ) as $Val);
  }

  /// Create a copy of GovernmentScheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EligibilityCriteriaCopyWith<$Res> get eligibility {
    return $EligibilityCriteriaCopyWith<$Res>(_value.eligibility, (value) {
      return _then(_value.copyWith(eligibility: value) as $Val);
    });
  }

  /// Create a copy of GovernmentScheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApplicationProcessCopyWith<$Res> get application {
    return $ApplicationProcessCopyWith<$Res>(_value.application, (value) {
      return _then(_value.copyWith(application: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GovernmentSchemeImplCopyWith<$Res>
    implements $GovernmentSchemeCopyWith<$Res> {
  factory _$$GovernmentSchemeImplCopyWith(_$GovernmentSchemeImpl value,
          $Res Function(_$GovernmentSchemeImpl) then) =
      __$$GovernmentSchemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String hindiName,
      String description,
      String ministry,
      List<String> benefits,
      EligibilityCriteria eligibility,
      ApplicationProcess application,
      List<String> documents,
      String website,
      String helpline,
      bool isActive,
      DateTime lastUpdated,
      List<IndianState> applicableStates});

  @override
  $EligibilityCriteriaCopyWith<$Res> get eligibility;
  @override
  $ApplicationProcessCopyWith<$Res> get application;
}

/// @nodoc
class __$$GovernmentSchemeImplCopyWithImpl<$Res>
    extends _$GovernmentSchemeCopyWithImpl<$Res, _$GovernmentSchemeImpl>
    implements _$$GovernmentSchemeImplCopyWith<$Res> {
  __$$GovernmentSchemeImplCopyWithImpl(_$GovernmentSchemeImpl _value,
      $Res Function(_$GovernmentSchemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of GovernmentScheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hindiName = null,
    Object? description = null,
    Object? ministry = null,
    Object? benefits = null,
    Object? eligibility = null,
    Object? application = null,
    Object? documents = null,
    Object? website = null,
    Object? helpline = null,
    Object? isActive = null,
    Object? lastUpdated = null,
    Object? applicableStates = null,
  }) {
    return _then(_$GovernmentSchemeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ministry: null == ministry
          ? _value.ministry
          : ministry // ignore: cast_nullable_to_non_nullable
              as String,
      benefits: null == benefits
          ? _value._benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eligibility: null == eligibility
          ? _value.eligibility
          : eligibility // ignore: cast_nullable_to_non_nullable
              as EligibilityCriteria,
      application: null == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationProcess,
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String>,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      helpline: null == helpline
          ? _value.helpline
          : helpline // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      applicableStates: null == applicableStates
          ? _value._applicableStates
          : applicableStates // ignore: cast_nullable_to_non_nullable
              as List<IndianState>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GovernmentSchemeImpl implements _GovernmentScheme {
  const _$GovernmentSchemeImpl(
      {required this.id,
      required this.name,
      required this.hindiName,
      required this.description,
      required this.ministry,
      required final List<String> benefits,
      required this.eligibility,
      required this.application,
      required final List<String> documents,
      required this.website,
      required this.helpline,
      required this.isActive,
      required this.lastUpdated,
      final List<IndianState> applicableStates = const []})
      : _benefits = benefits,
        _documents = documents,
        _applicableStates = applicableStates;

  factory _$GovernmentSchemeImpl.fromJson(Map<String, dynamic> json) =>
      _$$GovernmentSchemeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String hindiName;
  @override
  final String description;
  @override
  final String ministry;
  final List<String> _benefits;
  @override
  List<String> get benefits {
    if (_benefits is EqualUnmodifiableListView) return _benefits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_benefits);
  }

  @override
  final EligibilityCriteria eligibility;
  @override
  final ApplicationProcess application;
  final List<String> _documents;
  @override
  List<String> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  final String website;
  @override
  final String helpline;
  @override
  final bool isActive;
  @override
  final DateTime lastUpdated;
  final List<IndianState> _applicableStates;
  @override
  @JsonKey()
  List<IndianState> get applicableStates {
    if (_applicableStates is EqualUnmodifiableListView)
      return _applicableStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicableStates);
  }

  @override
  String toString() {
    return 'GovernmentScheme(id: $id, name: $name, hindiName: $hindiName, description: $description, ministry: $ministry, benefits: $benefits, eligibility: $eligibility, application: $application, documents: $documents, website: $website, helpline: $helpline, isActive: $isActive, lastUpdated: $lastUpdated, applicableStates: $applicableStates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GovernmentSchemeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hindiName, hindiName) ||
                other.hindiName == hindiName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ministry, ministry) ||
                other.ministry == ministry) &&
            const DeepCollectionEquality().equals(other._benefits, _benefits) &&
            (identical(other.eligibility, eligibility) ||
                other.eligibility == eligibility) &&
            (identical(other.application, application) ||
                other.application == application) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.helpline, helpline) ||
                other.helpline == helpline) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            const DeepCollectionEquality()
                .equals(other._applicableStates, _applicableStates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      hindiName,
      description,
      ministry,
      const DeepCollectionEquality().hash(_benefits),
      eligibility,
      application,
      const DeepCollectionEquality().hash(_documents),
      website,
      helpline,
      isActive,
      lastUpdated,
      const DeepCollectionEquality().hash(_applicableStates));

  /// Create a copy of GovernmentScheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GovernmentSchemeImplCopyWith<_$GovernmentSchemeImpl> get copyWith =>
      __$$GovernmentSchemeImplCopyWithImpl<_$GovernmentSchemeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GovernmentSchemeImplToJson(
      this,
    );
  }
}

abstract class _GovernmentScheme implements GovernmentScheme {
  const factory _GovernmentScheme(
      {required final String id,
      required final String name,
      required final String hindiName,
      required final String description,
      required final String ministry,
      required final List<String> benefits,
      required final EligibilityCriteria eligibility,
      required final ApplicationProcess application,
      required final List<String> documents,
      required final String website,
      required final String helpline,
      required final bool isActive,
      required final DateTime lastUpdated,
      final List<IndianState> applicableStates}) = _$GovernmentSchemeImpl;

  factory _GovernmentScheme.fromJson(Map<String, dynamic> json) =
      _$GovernmentSchemeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get hindiName;
  @override
  String get description;
  @override
  String get ministry;
  @override
  List<String> get benefits;
  @override
  EligibilityCriteria get eligibility;
  @override
  ApplicationProcess get application;
  @override
  List<String> get documents;
  @override
  String get website;
  @override
  String get helpline;
  @override
  bool get isActive;
  @override
  DateTime get lastUpdated;
  @override
  List<IndianState> get applicableStates;

  /// Create a copy of GovernmentScheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GovernmentSchemeImplCopyWith<_$GovernmentSchemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EligibilityCriteria _$EligibilityCriteriaFromJson(Map<String, dynamic> json) {
  return _EligibilityCriteria.fromJson(json);
}

/// @nodoc
mixin _$EligibilityCriteria {
  String get landSize => throw _privateConstructorUsedError;
  String get farmerCategory => throw _privateConstructorUsedError;
  String get income => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  List<String> get other => throw _privateConstructorUsedError;

  /// Serializes this EligibilityCriteria to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EligibilityCriteria
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EligibilityCriteriaCopyWith<EligibilityCriteria> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EligibilityCriteriaCopyWith<$Res> {
  factory $EligibilityCriteriaCopyWith(
          EligibilityCriteria value, $Res Function(EligibilityCriteria) then) =
      _$EligibilityCriteriaCopyWithImpl<$Res, EligibilityCriteria>;
  @useResult
  $Res call(
      {String landSize,
      String farmerCategory,
      String income,
      String age,
      List<String> other});
}

/// @nodoc
class _$EligibilityCriteriaCopyWithImpl<$Res, $Val extends EligibilityCriteria>
    implements $EligibilityCriteriaCopyWith<$Res> {
  _$EligibilityCriteriaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EligibilityCriteria
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? landSize = null,
    Object? farmerCategory = null,
    Object? income = null,
    Object? age = null,
    Object? other = null,
  }) {
    return _then(_value.copyWith(
      landSize: null == landSize
          ? _value.landSize
          : landSize // ignore: cast_nullable_to_non_nullable
              as String,
      farmerCategory: null == farmerCategory
          ? _value.farmerCategory
          : farmerCategory // ignore: cast_nullable_to_non_nullable
              as String,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EligibilityCriteriaImplCopyWith<$Res>
    implements $EligibilityCriteriaCopyWith<$Res> {
  factory _$$EligibilityCriteriaImplCopyWith(_$EligibilityCriteriaImpl value,
          $Res Function(_$EligibilityCriteriaImpl) then) =
      __$$EligibilityCriteriaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String landSize,
      String farmerCategory,
      String income,
      String age,
      List<String> other});
}

/// @nodoc
class __$$EligibilityCriteriaImplCopyWithImpl<$Res>
    extends _$EligibilityCriteriaCopyWithImpl<$Res, _$EligibilityCriteriaImpl>
    implements _$$EligibilityCriteriaImplCopyWith<$Res> {
  __$$EligibilityCriteriaImplCopyWithImpl(_$EligibilityCriteriaImpl _value,
      $Res Function(_$EligibilityCriteriaImpl) _then)
      : super(_value, _then);

  /// Create a copy of EligibilityCriteria
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? landSize = null,
    Object? farmerCategory = null,
    Object? income = null,
    Object? age = null,
    Object? other = null,
  }) {
    return _then(_$EligibilityCriteriaImpl(
      landSize: null == landSize
          ? _value.landSize
          : landSize // ignore: cast_nullable_to_non_nullable
              as String,
      farmerCategory: null == farmerCategory
          ? _value.farmerCategory
          : farmerCategory // ignore: cast_nullable_to_non_nullable
              as String,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      other: null == other
          ? _value._other
          : other // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EligibilityCriteriaImpl implements _EligibilityCriteria {
  const _$EligibilityCriteriaImpl(
      {required this.landSize,
      required this.farmerCategory,
      required this.income,
      required this.age,
      required final List<String> other})
      : _other = other;

  factory _$EligibilityCriteriaImpl.fromJson(Map<String, dynamic> json) =>
      _$$EligibilityCriteriaImplFromJson(json);

  @override
  final String landSize;
  @override
  final String farmerCategory;
  @override
  final String income;
  @override
  final String age;
  final List<String> _other;
  @override
  List<String> get other {
    if (_other is EqualUnmodifiableListView) return _other;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_other);
  }

  @override
  String toString() {
    return 'EligibilityCriteria(landSize: $landSize, farmerCategory: $farmerCategory, income: $income, age: $age, other: $other)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EligibilityCriteriaImpl &&
            (identical(other.landSize, landSize) ||
                other.landSize == landSize) &&
            (identical(other.farmerCategory, farmerCategory) ||
                other.farmerCategory == farmerCategory) &&
            (identical(other.income, income) || other.income == income) &&
            (identical(other.age, age) || other.age == age) &&
            const DeepCollectionEquality().equals(other._other, this._other));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, landSize, farmerCategory, income,
      age, const DeepCollectionEquality().hash(_other));

  /// Create a copy of EligibilityCriteria
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EligibilityCriteriaImplCopyWith<_$EligibilityCriteriaImpl> get copyWith =>
      __$$EligibilityCriteriaImplCopyWithImpl<_$EligibilityCriteriaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EligibilityCriteriaImplToJson(
      this,
    );
  }
}

abstract class _EligibilityCriteria implements EligibilityCriteria {
  const factory _EligibilityCriteria(
      {required final String landSize,
      required final String farmerCategory,
      required final String income,
      required final String age,
      required final List<String> other}) = _$EligibilityCriteriaImpl;

  factory _EligibilityCriteria.fromJson(Map<String, dynamic> json) =
      _$EligibilityCriteriaImpl.fromJson;

  @override
  String get landSize;
  @override
  String get farmerCategory;
  @override
  String get income;
  @override
  String get age;
  @override
  List<String> get other;

  /// Create a copy of EligibilityCriteria
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EligibilityCriteriaImplCopyWith<_$EligibilityCriteriaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApplicationProcess _$ApplicationProcessFromJson(Map<String, dynamic> json) {
  return _ApplicationProcess.fromJson(json);
}

/// @nodoc
mixin _$ApplicationProcess {
  List<String> get steps => throw _privateConstructorUsedError;
  String get mode => throw _privateConstructorUsedError;
  String get timeline => throw _privateConstructorUsedError;
  String get fee => throw _privateConstructorUsedError;
  List<String> get offices => throw _privateConstructorUsedError;

  /// Serializes this ApplicationProcess to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApplicationProcess
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplicationProcessCopyWith<ApplicationProcess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationProcessCopyWith<$Res> {
  factory $ApplicationProcessCopyWith(
          ApplicationProcess value, $Res Function(ApplicationProcess) then) =
      _$ApplicationProcessCopyWithImpl<$Res, ApplicationProcess>;
  @useResult
  $Res call(
      {List<String> steps,
      String mode,
      String timeline,
      String fee,
      List<String> offices});
}

/// @nodoc
class _$ApplicationProcessCopyWithImpl<$Res, $Val extends ApplicationProcess>
    implements $ApplicationProcessCopyWith<$Res> {
  _$ApplicationProcessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplicationProcess
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? mode = null,
    Object? timeline = null,
    Object? fee = null,
    Object? offices = null,
  }) {
    return _then(_value.copyWith(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      timeline: null == timeline
          ? _value.timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as String,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String,
      offices: null == offices
          ? _value.offices
          : offices // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationProcessImplCopyWith<$Res>
    implements $ApplicationProcessCopyWith<$Res> {
  factory _$$ApplicationProcessImplCopyWith(_$ApplicationProcessImpl value,
          $Res Function(_$ApplicationProcessImpl) then) =
      __$$ApplicationProcessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> steps,
      String mode,
      String timeline,
      String fee,
      List<String> offices});
}

/// @nodoc
class __$$ApplicationProcessImplCopyWithImpl<$Res>
    extends _$ApplicationProcessCopyWithImpl<$Res, _$ApplicationProcessImpl>
    implements _$$ApplicationProcessImplCopyWith<$Res> {
  __$$ApplicationProcessImplCopyWithImpl(_$ApplicationProcessImpl _value,
      $Res Function(_$ApplicationProcessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApplicationProcess
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? mode = null,
    Object? timeline = null,
    Object? fee = null,
    Object? offices = null,
  }) {
    return _then(_$ApplicationProcessImpl(
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      timeline: null == timeline
          ? _value.timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as String,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String,
      offices: null == offices
          ? _value._offices
          : offices // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationProcessImpl implements _ApplicationProcess {
  const _$ApplicationProcessImpl(
      {required final List<String> steps,
      required this.mode,
      required this.timeline,
      required this.fee,
      required final List<String> offices})
      : _steps = steps,
        _offices = offices;

  factory _$ApplicationProcessImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationProcessImplFromJson(json);

  final List<String> _steps;
  @override
  List<String> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final String mode;
  @override
  final String timeline;
  @override
  final String fee;
  final List<String> _offices;
  @override
  List<String> get offices {
    if (_offices is EqualUnmodifiableListView) return _offices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_offices);
  }

  @override
  String toString() {
    return 'ApplicationProcess(steps: $steps, mode: $mode, timeline: $timeline, fee: $fee, offices: $offices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationProcessImpl &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.timeline, timeline) ||
                other.timeline == timeline) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            const DeepCollectionEquality().equals(other._offices, _offices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_steps),
      mode,
      timeline,
      fee,
      const DeepCollectionEquality().hash(_offices));

  /// Create a copy of ApplicationProcess
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationProcessImplCopyWith<_$ApplicationProcessImpl> get copyWith =>
      __$$ApplicationProcessImplCopyWithImpl<_$ApplicationProcessImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationProcessImplToJson(
      this,
    );
  }
}

abstract class _ApplicationProcess implements ApplicationProcess {
  const factory _ApplicationProcess(
      {required final List<String> steps,
      required final String mode,
      required final String timeline,
      required final String fee,
      required final List<String> offices}) = _$ApplicationProcessImpl;

  factory _ApplicationProcess.fromJson(Map<String, dynamic> json) =
      _$ApplicationProcessImpl.fromJson;

  @override
  List<String> get steps;
  @override
  String get mode;
  @override
  String get timeline;
  @override
  String get fee;
  @override
  List<String> get offices;

  /// Create a copy of ApplicationProcess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplicationProcessImplCopyWith<_$ApplicationProcessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FarmingNews _$FarmingNewsFromJson(Map<String, dynamic> json) {
  return _FarmingNews.fromJson(json);
}

/// @nodoc
mixin _$FarmingNews {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get hindiTitle => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  DateTime get publishedAt => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;

  /// Serializes this FarmingNews to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FarmingNews
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FarmingNewsCopyWith<FarmingNews> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmingNewsCopyWith<$Res> {
  factory $FarmingNewsCopyWith(
          FarmingNews value, $Res Function(FarmingNews) then) =
      _$FarmingNewsCopyWithImpl<$Res, FarmingNews>;
  @useResult
  $Res call(
      {String id,
      String title,
      String hindiTitle,
      String content,
      String summary,
      String category,
      String source,
      DateTime publishedAt,
      List<String> tags,
      String imageUrl,
      bool isPinned,
      int priority});
}

/// @nodoc
class _$FarmingNewsCopyWithImpl<$Res, $Val extends FarmingNews>
    implements $FarmingNewsCopyWith<$Res> {
  _$FarmingNewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FarmingNews
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? hindiTitle = null,
    Object? content = null,
    Object? summary = null,
    Object? category = null,
    Object? source = null,
    Object? publishedAt = null,
    Object? tags = null,
    Object? imageUrl = null,
    Object? isPinned = null,
    Object? priority = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hindiTitle: null == hindiTitle
          ? _value.hindiTitle
          : hindiTitle // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FarmingNewsImplCopyWith<$Res>
    implements $FarmingNewsCopyWith<$Res> {
  factory _$$FarmingNewsImplCopyWith(
          _$FarmingNewsImpl value, $Res Function(_$FarmingNewsImpl) then) =
      __$$FarmingNewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String hindiTitle,
      String content,
      String summary,
      String category,
      String source,
      DateTime publishedAt,
      List<String> tags,
      String imageUrl,
      bool isPinned,
      int priority});
}

/// @nodoc
class __$$FarmingNewsImplCopyWithImpl<$Res>
    extends _$FarmingNewsCopyWithImpl<$Res, _$FarmingNewsImpl>
    implements _$$FarmingNewsImplCopyWith<$Res> {
  __$$FarmingNewsImplCopyWithImpl(
      _$FarmingNewsImpl _value, $Res Function(_$FarmingNewsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FarmingNews
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? hindiTitle = null,
    Object? content = null,
    Object? summary = null,
    Object? category = null,
    Object? source = null,
    Object? publishedAt = null,
    Object? tags = null,
    Object? imageUrl = null,
    Object? isPinned = null,
    Object? priority = null,
  }) {
    return _then(_$FarmingNewsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hindiTitle: null == hindiTitle
          ? _value.hindiTitle
          : hindiTitle // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FarmingNewsImpl implements _FarmingNews {
  const _$FarmingNewsImpl(
      {required this.id,
      required this.title,
      required this.hindiTitle,
      required this.content,
      required this.summary,
      required this.category,
      required this.source,
      required this.publishedAt,
      required final List<String> tags,
      required this.imageUrl,
      required this.isPinned,
      required this.priority})
      : _tags = tags;

  factory _$FarmingNewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FarmingNewsImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String hindiTitle;
  @override
  final String content;
  @override
  final String summary;
  @override
  final String category;
  @override
  final String source;
  @override
  final DateTime publishedAt;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String imageUrl;
  @override
  final bool isPinned;
  @override
  final int priority;

  @override
  String toString() {
    return 'FarmingNews(id: $id, title: $title, hindiTitle: $hindiTitle, content: $content, summary: $summary, category: $category, source: $source, publishedAt: $publishedAt, tags: $tags, imageUrl: $imageUrl, isPinned: $isPinned, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FarmingNewsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.hindiTitle, hindiTitle) ||
                other.hindiTitle == hindiTitle) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      hindiTitle,
      content,
      summary,
      category,
      source,
      publishedAt,
      const DeepCollectionEquality().hash(_tags),
      imageUrl,
      isPinned,
      priority);

  /// Create a copy of FarmingNews
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FarmingNewsImplCopyWith<_$FarmingNewsImpl> get copyWith =>
      __$$FarmingNewsImplCopyWithImpl<_$FarmingNewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FarmingNewsImplToJson(
      this,
    );
  }
}

abstract class _FarmingNews implements FarmingNews {
  const factory _FarmingNews(
      {required final String id,
      required final String title,
      required final String hindiTitle,
      required final String content,
      required final String summary,
      required final String category,
      required final String source,
      required final DateTime publishedAt,
      required final List<String> tags,
      required final String imageUrl,
      required final bool isPinned,
      required final int priority}) = _$FarmingNewsImpl;

  factory _FarmingNews.fromJson(Map<String, dynamic> json) =
      _$FarmingNewsImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get hindiTitle;
  @override
  String get content;
  @override
  String get summary;
  @override
  String get category;
  @override
  String get source;
  @override
  DateTime get publishedAt;
  @override
  List<String> get tags;
  @override
  String get imageUrl;
  @override
  bool get isPinned;
  @override
  int get priority;

  /// Create a copy of FarmingNews
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FarmingNewsImplCopyWith<_$FarmingNewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FarmerProfile _$FarmerProfileFromJson(Map<String, dynamic> json) {
  return _FarmerProfile.fromJson(json);
}

/// @nodoc
mixin _$FarmerProfile {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  IndianState get state => throw _privateConstructorUsedError;
  String get district => throw _privateConstructorUsedError;
  String get village => throw _privateConstructorUsedError;
  FarmDetails get farmDetails => throw _privateConstructorUsedError;
  List<String> get preferredCrops => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get lastLogin => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;

  /// Serializes this FarmerProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FarmerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FarmerProfileCopyWith<FarmerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmerProfileCopyWith<$Res> {
  factory $FarmerProfileCopyWith(
          FarmerProfile value, $Res Function(FarmerProfile) then) =
      _$FarmerProfileCopyWithImpl<$Res, FarmerProfile>;
  @useResult
  $Res call(
      {String id,
      String name,
      String phoneNumber,
      String email,
      IndianState state,
      String district,
      String village,
      FarmDetails farmDetails,
      List<String> preferredCrops,
      String language,
      DateTime createdAt,
      DateTime lastLogin,
      bool isVerified});

  $FarmDetailsCopyWith<$Res> get farmDetails;
}

/// @nodoc
class _$FarmerProfileCopyWithImpl<$Res, $Val extends FarmerProfile>
    implements $FarmerProfileCopyWith<$Res> {
  _$FarmerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FarmerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? state = null,
    Object? district = null,
    Object? village = null,
    Object? farmDetails = null,
    Object? preferredCrops = null,
    Object? language = null,
    Object? createdAt = null,
    Object? lastLogin = null,
    Object? isVerified = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as IndianState,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      village: null == village
          ? _value.village
          : village // ignore: cast_nullable_to_non_nullable
              as String,
      farmDetails: null == farmDetails
          ? _value.farmDetails
          : farmDetails // ignore: cast_nullable_to_non_nullable
              as FarmDetails,
      preferredCrops: null == preferredCrops
          ? _value.preferredCrops
          : preferredCrops // ignore: cast_nullable_to_non_nullable
              as List<String>,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastLogin: null == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of FarmerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FarmDetailsCopyWith<$Res> get farmDetails {
    return $FarmDetailsCopyWith<$Res>(_value.farmDetails, (value) {
      return _then(_value.copyWith(farmDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FarmerProfileImplCopyWith<$Res>
    implements $FarmerProfileCopyWith<$Res> {
  factory _$$FarmerProfileImplCopyWith(
          _$FarmerProfileImpl value, $Res Function(_$FarmerProfileImpl) then) =
      __$$FarmerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String phoneNumber,
      String email,
      IndianState state,
      String district,
      String village,
      FarmDetails farmDetails,
      List<String> preferredCrops,
      String language,
      DateTime createdAt,
      DateTime lastLogin,
      bool isVerified});

  @override
  $FarmDetailsCopyWith<$Res> get farmDetails;
}

/// @nodoc
class __$$FarmerProfileImplCopyWithImpl<$Res>
    extends _$FarmerProfileCopyWithImpl<$Res, _$FarmerProfileImpl>
    implements _$$FarmerProfileImplCopyWith<$Res> {
  __$$FarmerProfileImplCopyWithImpl(
      _$FarmerProfileImpl _value, $Res Function(_$FarmerProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of FarmerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? state = null,
    Object? district = null,
    Object? village = null,
    Object? farmDetails = null,
    Object? preferredCrops = null,
    Object? language = null,
    Object? createdAt = null,
    Object? lastLogin = null,
    Object? isVerified = null,
  }) {
    return _then(_$FarmerProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as IndianState,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      village: null == village
          ? _value.village
          : village // ignore: cast_nullable_to_non_nullable
              as String,
      farmDetails: null == farmDetails
          ? _value.farmDetails
          : farmDetails // ignore: cast_nullable_to_non_nullable
              as FarmDetails,
      preferredCrops: null == preferredCrops
          ? _value._preferredCrops
          : preferredCrops // ignore: cast_nullable_to_non_nullable
              as List<String>,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastLogin: null == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FarmerProfileImpl implements _FarmerProfile {
  const _$FarmerProfileImpl(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.state,
      required this.district,
      required this.village,
      required this.farmDetails,
      required final List<String> preferredCrops,
      required this.language,
      required this.createdAt,
      required this.lastLogin,
      this.isVerified = false})
      : _preferredCrops = preferredCrops;

  factory _$FarmerProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$FarmerProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String email;
  @override
  final IndianState state;
  @override
  final String district;
  @override
  final String village;
  @override
  final FarmDetails farmDetails;
  final List<String> _preferredCrops;
  @override
  List<String> get preferredCrops {
    if (_preferredCrops is EqualUnmodifiableListView) return _preferredCrops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredCrops);
  }

  @override
  final String language;
  @override
  final DateTime createdAt;
  @override
  final DateTime lastLogin;
  @override
  @JsonKey()
  final bool isVerified;

  @override
  String toString() {
    return 'FarmerProfile(id: $id, name: $name, phoneNumber: $phoneNumber, email: $email, state: $state, district: $district, village: $village, farmDetails: $farmDetails, preferredCrops: $preferredCrops, language: $language, createdAt: $createdAt, lastLogin: $lastLogin, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FarmerProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.village, village) || other.village == village) &&
            (identical(other.farmDetails, farmDetails) ||
                other.farmDetails == farmDetails) &&
            const DeepCollectionEquality()
                .equals(other._preferredCrops, _preferredCrops) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      phoneNumber,
      email,
      state,
      district,
      village,
      farmDetails,
      const DeepCollectionEquality().hash(_preferredCrops),
      language,
      createdAt,
      lastLogin,
      isVerified);

  /// Create a copy of FarmerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FarmerProfileImplCopyWith<_$FarmerProfileImpl> get copyWith =>
      __$$FarmerProfileImplCopyWithImpl<_$FarmerProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FarmerProfileImplToJson(
      this,
    );
  }
}

abstract class _FarmerProfile implements FarmerProfile {
  const factory _FarmerProfile(
      {required final String id,
      required final String name,
      required final String phoneNumber,
      required final String email,
      required final IndianState state,
      required final String district,
      required final String village,
      required final FarmDetails farmDetails,
      required final List<String> preferredCrops,
      required final String language,
      required final DateTime createdAt,
      required final DateTime lastLogin,
      final bool isVerified}) = _$FarmerProfileImpl;

  factory _FarmerProfile.fromJson(Map<String, dynamic> json) =
      _$FarmerProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String get email;
  @override
  IndianState get state;
  @override
  String get district;
  @override
  String get village;
  @override
  FarmDetails get farmDetails;
  @override
  List<String> get preferredCrops;
  @override
  String get language;
  @override
  DateTime get createdAt;
  @override
  DateTime get lastLogin;
  @override
  bool get isVerified;

  /// Create a copy of FarmerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FarmerProfileImplCopyWith<_$FarmerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FarmDetails _$FarmDetailsFromJson(Map<String, dynamic> json) {
  return _FarmDetails.fromJson(json);
}

/// @nodoc
mixin _$FarmDetails {
  double get totalArea => throw _privateConstructorUsedError;
  String get areaUnit => throw _privateConstructorUsedError;
  List<SoilType> get soilTypes => throw _privateConstructorUsedError;
  ClimateZone get climateZone => throw _privateConstructorUsedError;
  String get waterSource => throw _privateConstructorUsedError;
  String get irrigationType => throw _privateConstructorUsedError;
  List<CropField> get fields => throw _privateConstructorUsedError;
  List<String> get equipment => throw _privateConstructorUsedError;
  String get farmingType => throw _privateConstructorUsedError;

  /// Serializes this FarmDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FarmDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FarmDetailsCopyWith<FarmDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmDetailsCopyWith<$Res> {
  factory $FarmDetailsCopyWith(
          FarmDetails value, $Res Function(FarmDetails) then) =
      _$FarmDetailsCopyWithImpl<$Res, FarmDetails>;
  @useResult
  $Res call(
      {double totalArea,
      String areaUnit,
      List<SoilType> soilTypes,
      ClimateZone climateZone,
      String waterSource,
      String irrigationType,
      List<CropField> fields,
      List<String> equipment,
      String farmingType});
}

/// @nodoc
class _$FarmDetailsCopyWithImpl<$Res, $Val extends FarmDetails>
    implements $FarmDetailsCopyWith<$Res> {
  _$FarmDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FarmDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalArea = null,
    Object? areaUnit = null,
    Object? soilTypes = null,
    Object? climateZone = null,
    Object? waterSource = null,
    Object? irrigationType = null,
    Object? fields = null,
    Object? equipment = null,
    Object? farmingType = null,
  }) {
    return _then(_value.copyWith(
      totalArea: null == totalArea
          ? _value.totalArea
          : totalArea // ignore: cast_nullable_to_non_nullable
              as double,
      areaUnit: null == areaUnit
          ? _value.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String,
      soilTypes: null == soilTypes
          ? _value.soilTypes
          : soilTypes // ignore: cast_nullable_to_non_nullable
              as List<SoilType>,
      climateZone: null == climateZone
          ? _value.climateZone
          : climateZone // ignore: cast_nullable_to_non_nullable
              as ClimateZone,
      waterSource: null == waterSource
          ? _value.waterSource
          : waterSource // ignore: cast_nullable_to_non_nullable
              as String,
      irrigationType: null == irrigationType
          ? _value.irrigationType
          : irrigationType // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<CropField>,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      farmingType: null == farmingType
          ? _value.farmingType
          : farmingType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FarmDetailsImplCopyWith<$Res>
    implements $FarmDetailsCopyWith<$Res> {
  factory _$$FarmDetailsImplCopyWith(
          _$FarmDetailsImpl value, $Res Function(_$FarmDetailsImpl) then) =
      __$$FarmDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalArea,
      String areaUnit,
      List<SoilType> soilTypes,
      ClimateZone climateZone,
      String waterSource,
      String irrigationType,
      List<CropField> fields,
      List<String> equipment,
      String farmingType});
}

/// @nodoc
class __$$FarmDetailsImplCopyWithImpl<$Res>
    extends _$FarmDetailsCopyWithImpl<$Res, _$FarmDetailsImpl>
    implements _$$FarmDetailsImplCopyWith<$Res> {
  __$$FarmDetailsImplCopyWithImpl(
      _$FarmDetailsImpl _value, $Res Function(_$FarmDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FarmDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalArea = null,
    Object? areaUnit = null,
    Object? soilTypes = null,
    Object? climateZone = null,
    Object? waterSource = null,
    Object? irrigationType = null,
    Object? fields = null,
    Object? equipment = null,
    Object? farmingType = null,
  }) {
    return _then(_$FarmDetailsImpl(
      totalArea: null == totalArea
          ? _value.totalArea
          : totalArea // ignore: cast_nullable_to_non_nullable
              as double,
      areaUnit: null == areaUnit
          ? _value.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String,
      soilTypes: null == soilTypes
          ? _value._soilTypes
          : soilTypes // ignore: cast_nullable_to_non_nullable
              as List<SoilType>,
      climateZone: null == climateZone
          ? _value.climateZone
          : climateZone // ignore: cast_nullable_to_non_nullable
              as ClimateZone,
      waterSource: null == waterSource
          ? _value.waterSource
          : waterSource // ignore: cast_nullable_to_non_nullable
              as String,
      irrigationType: null == irrigationType
          ? _value.irrigationType
          : irrigationType // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<CropField>,
      equipment: null == equipment
          ? _value._equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      farmingType: null == farmingType
          ? _value.farmingType
          : farmingType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FarmDetailsImpl implements _FarmDetails {
  const _$FarmDetailsImpl(
      {required this.totalArea,
      required this.areaUnit,
      required final List<SoilType> soilTypes,
      required this.climateZone,
      required this.waterSource,
      required this.irrigationType,
      required final List<CropField> fields,
      required final List<String> equipment,
      required this.farmingType})
      : _soilTypes = soilTypes,
        _fields = fields,
        _equipment = equipment;

  factory _$FarmDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FarmDetailsImplFromJson(json);

  @override
  final double totalArea;
  @override
  final String areaUnit;
  final List<SoilType> _soilTypes;
  @override
  List<SoilType> get soilTypes {
    if (_soilTypes is EqualUnmodifiableListView) return _soilTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_soilTypes);
  }

  @override
  final ClimateZone climateZone;
  @override
  final String waterSource;
  @override
  final String irrigationType;
  final List<CropField> _fields;
  @override
  List<CropField> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  final List<String> _equipment;
  @override
  List<String> get equipment {
    if (_equipment is EqualUnmodifiableListView) return _equipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equipment);
  }

  @override
  final String farmingType;

  @override
  String toString() {
    return 'FarmDetails(totalArea: $totalArea, areaUnit: $areaUnit, soilTypes: $soilTypes, climateZone: $climateZone, waterSource: $waterSource, irrigationType: $irrigationType, fields: $fields, equipment: $equipment, farmingType: $farmingType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FarmDetailsImpl &&
            (identical(other.totalArea, totalArea) ||
                other.totalArea == totalArea) &&
            (identical(other.areaUnit, areaUnit) ||
                other.areaUnit == areaUnit) &&
            const DeepCollectionEquality()
                .equals(other._soilTypes, _soilTypes) &&
            (identical(other.climateZone, climateZone) ||
                other.climateZone == climateZone) &&
            (identical(other.waterSource, waterSource) ||
                other.waterSource == waterSource) &&
            (identical(other.irrigationType, irrigationType) ||
                other.irrigationType == irrigationType) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            const DeepCollectionEquality()
                .equals(other._equipment, _equipment) &&
            (identical(other.farmingType, farmingType) ||
                other.farmingType == farmingType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalArea,
      areaUnit,
      const DeepCollectionEquality().hash(_soilTypes),
      climateZone,
      waterSource,
      irrigationType,
      const DeepCollectionEquality().hash(_fields),
      const DeepCollectionEquality().hash(_equipment),
      farmingType);

  /// Create a copy of FarmDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FarmDetailsImplCopyWith<_$FarmDetailsImpl> get copyWith =>
      __$$FarmDetailsImplCopyWithImpl<_$FarmDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FarmDetailsImplToJson(
      this,
    );
  }
}

abstract class _FarmDetails implements FarmDetails {
  const factory _FarmDetails(
      {required final double totalArea,
      required final String areaUnit,
      required final List<SoilType> soilTypes,
      required final ClimateZone climateZone,
      required final String waterSource,
      required final String irrigationType,
      required final List<CropField> fields,
      required final List<String> equipment,
      required final String farmingType}) = _$FarmDetailsImpl;

  factory _FarmDetails.fromJson(Map<String, dynamic> json) =
      _$FarmDetailsImpl.fromJson;

  @override
  double get totalArea;
  @override
  String get areaUnit;
  @override
  List<SoilType> get soilTypes;
  @override
  ClimateZone get climateZone;
  @override
  String get waterSource;
  @override
  String get irrigationType;
  @override
  List<CropField> get fields;
  @override
  List<String> get equipment;
  @override
  String get farmingType;

  /// Create a copy of FarmDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FarmDetailsImplCopyWith<_$FarmDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CropField _$CropFieldFromJson(Map<String, dynamic> json) {
  return _CropField.fromJson(json);
}

/// @nodoc
mixin _$CropField {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get area => throw _privateConstructorUsedError;
  SoilType get soilType => throw _privateConstructorUsedError;
  String get currentCrop => throw _privateConstructorUsedError;
  CropSeason get season => throw _privateConstructorUsedError;
  DateTime get plantingDate => throw _privateConstructorUsedError;
  DateTime get expectedHarvest => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<String> get notes => throw _privateConstructorUsedError;
  List<FieldExpense> get expenses => throw _privateConstructorUsedError;
  List<FieldActivity> get activities => throw _privateConstructorUsedError;

  /// Serializes this CropField to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CropField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CropFieldCopyWith<CropField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropFieldCopyWith<$Res> {
  factory $CropFieldCopyWith(CropField value, $Res Function(CropField) then) =
      _$CropFieldCopyWithImpl<$Res, CropField>;
  @useResult
  $Res call(
      {String id,
      String name,
      double area,
      SoilType soilType,
      String currentCrop,
      CropSeason season,
      DateTime plantingDate,
      DateTime expectedHarvest,
      String status,
      List<String> notes,
      List<FieldExpense> expenses,
      List<FieldActivity> activities});
}

/// @nodoc
class _$CropFieldCopyWithImpl<$Res, $Val extends CropField>
    implements $CropFieldCopyWith<$Res> {
  _$CropFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CropField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? area = null,
    Object? soilType = null,
    Object? currentCrop = null,
    Object? season = null,
    Object? plantingDate = null,
    Object? expectedHarvest = null,
    Object? status = null,
    Object? notes = null,
    Object? expenses = null,
    Object? activities = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double,
      soilType: null == soilType
          ? _value.soilType
          : soilType // ignore: cast_nullable_to_non_nullable
              as SoilType,
      currentCrop: null == currentCrop
          ? _value.currentCrop
          : currentCrop // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as CropSeason,
      plantingDate: null == plantingDate
          ? _value.plantingDate
          : plantingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedHarvest: null == expectedHarvest
          ? _value.expectedHarvest
          : expectedHarvest // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<FieldExpense>,
      activities: null == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<FieldActivity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CropFieldImplCopyWith<$Res>
    implements $CropFieldCopyWith<$Res> {
  factory _$$CropFieldImplCopyWith(
          _$CropFieldImpl value, $Res Function(_$CropFieldImpl) then) =
      __$$CropFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double area,
      SoilType soilType,
      String currentCrop,
      CropSeason season,
      DateTime plantingDate,
      DateTime expectedHarvest,
      String status,
      List<String> notes,
      List<FieldExpense> expenses,
      List<FieldActivity> activities});
}

/// @nodoc
class __$$CropFieldImplCopyWithImpl<$Res>
    extends _$CropFieldCopyWithImpl<$Res, _$CropFieldImpl>
    implements _$$CropFieldImplCopyWith<$Res> {
  __$$CropFieldImplCopyWithImpl(
      _$CropFieldImpl _value, $Res Function(_$CropFieldImpl) _then)
      : super(_value, _then);

  /// Create a copy of CropField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? area = null,
    Object? soilType = null,
    Object? currentCrop = null,
    Object? season = null,
    Object? plantingDate = null,
    Object? expectedHarvest = null,
    Object? status = null,
    Object? notes = null,
    Object? expenses = null,
    Object? activities = null,
  }) {
    return _then(_$CropFieldImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double,
      soilType: null == soilType
          ? _value.soilType
          : soilType // ignore: cast_nullable_to_non_nullable
              as SoilType,
      currentCrop: null == currentCrop
          ? _value.currentCrop
          : currentCrop // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as CropSeason,
      plantingDate: null == plantingDate
          ? _value.plantingDate
          : plantingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedHarvest: null == expectedHarvest
          ? _value.expectedHarvest
          : expectedHarvest // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expenses: null == expenses
          ? _value._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<FieldExpense>,
      activities: null == activities
          ? _value._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<FieldActivity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CropFieldImpl implements _CropField {
  const _$CropFieldImpl(
      {required this.id,
      required this.name,
      required this.area,
      required this.soilType,
      required this.currentCrop,
      required this.season,
      required this.plantingDate,
      required this.expectedHarvest,
      required this.status,
      final List<String> notes = const [],
      final List<FieldExpense> expenses = const [],
      final List<FieldActivity> activities = const []})
      : _notes = notes,
        _expenses = expenses,
        _activities = activities;

  factory _$CropFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$CropFieldImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double area;
  @override
  final SoilType soilType;
  @override
  final String currentCrop;
  @override
  final CropSeason season;
  @override
  final DateTime plantingDate;
  @override
  final DateTime expectedHarvest;
  @override
  final String status;
  final List<String> _notes;
  @override
  @JsonKey()
  List<String> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  final List<FieldExpense> _expenses;
  @override
  @JsonKey()
  List<FieldExpense> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  final List<FieldActivity> _activities;
  @override
  @JsonKey()
  List<FieldActivity> get activities {
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activities);
  }

  @override
  String toString() {
    return 'CropField(id: $id, name: $name, area: $area, soilType: $soilType, currentCrop: $currentCrop, season: $season, plantingDate: $plantingDate, expectedHarvest: $expectedHarvest, status: $status, notes: $notes, expenses: $expenses, activities: $activities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CropFieldImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.soilType, soilType) ||
                other.soilType == soilType) &&
            (identical(other.currentCrop, currentCrop) ||
                other.currentCrop == currentCrop) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.plantingDate, plantingDate) ||
                other.plantingDate == plantingDate) &&
            (identical(other.expectedHarvest, expectedHarvest) ||
                other.expectedHarvest == expectedHarvest) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      area,
      soilType,
      currentCrop,
      season,
      plantingDate,
      expectedHarvest,
      status,
      const DeepCollectionEquality().hash(_notes),
      const DeepCollectionEquality().hash(_expenses),
      const DeepCollectionEquality().hash(_activities));

  /// Create a copy of CropField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CropFieldImplCopyWith<_$CropFieldImpl> get copyWith =>
      __$$CropFieldImplCopyWithImpl<_$CropFieldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CropFieldImplToJson(
      this,
    );
  }
}

abstract class _CropField implements CropField {
  const factory _CropField(
      {required final String id,
      required final String name,
      required final double area,
      required final SoilType soilType,
      required final String currentCrop,
      required final CropSeason season,
      required final DateTime plantingDate,
      required final DateTime expectedHarvest,
      required final String status,
      final List<String> notes,
      final List<FieldExpense> expenses,
      final List<FieldActivity> activities}) = _$CropFieldImpl;

  factory _CropField.fromJson(Map<String, dynamic> json) =
      _$CropFieldImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get area;
  @override
  SoilType get soilType;
  @override
  String get currentCrop;
  @override
  CropSeason get season;
  @override
  DateTime get plantingDate;
  @override
  DateTime get expectedHarvest;
  @override
  String get status;
  @override
  List<String> get notes;
  @override
  List<FieldExpense> get expenses;
  @override
  List<FieldActivity> get activities;

  /// Create a copy of CropField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CropFieldImplCopyWith<_$CropFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FarmInstrumentDetail _$FarmInstrumentDetailFromJson(Map<String, dynamic> json) {
  return _FarmInstrumentDetail.fromJson(json);
}

/// @nodoc
mixin _$FarmInstrumentDetail {
  String get id => throw _privateConstructorUsedError;
  FarmInstrument get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get hindiName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  double get purchasePrice => throw _privateConstructorUsedError;
  DateTime get purchaseDate => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;
  MaintenanceInfo get maintenance => throw _privateConstructorUsedError;
  List<String> get suitableCrops => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  String get powerSource => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  List<MaintenanceRecord> get maintenanceHistory =>
      throw _privateConstructorUsedError;
  List<UsageRecord> get usageHistory => throw _privateConstructorUsedError;

  /// Serializes this FarmInstrumentDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FarmInstrumentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FarmInstrumentDetailCopyWith<FarmInstrumentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmInstrumentDetailCopyWith<$Res> {
  factory $FarmInstrumentDetailCopyWith(FarmInstrumentDetail value,
          $Res Function(FarmInstrumentDetail) then) =
      _$FarmInstrumentDetailCopyWithImpl<$Res, FarmInstrumentDetail>;
  @useResult
  $Res call(
      {String id,
      FarmInstrument type,
      String name,
      String hindiName,
      String description,
      String brand,
      String model,
      double purchasePrice,
      DateTime purchaseDate,
      String condition,
      MaintenanceInfo maintenance,
      List<String> suitableCrops,
      List<String> features,
      String powerSource,
      String size,
      List<MaintenanceRecord> maintenanceHistory,
      List<UsageRecord> usageHistory});

  $MaintenanceInfoCopyWith<$Res> get maintenance;
}

/// @nodoc
class _$FarmInstrumentDetailCopyWithImpl<$Res,
        $Val extends FarmInstrumentDetail>
    implements $FarmInstrumentDetailCopyWith<$Res> {
  _$FarmInstrumentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FarmInstrumentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? hindiName = null,
    Object? description = null,
    Object? brand = null,
    Object? model = null,
    Object? purchasePrice = null,
    Object? purchaseDate = null,
    Object? condition = null,
    Object? maintenance = null,
    Object? suitableCrops = null,
    Object? features = null,
    Object? powerSource = null,
    Object? size = null,
    Object? maintenanceHistory = null,
    Object? usageHistory = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FarmInstrument,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      purchasePrice: null == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      maintenance: null == maintenance
          ? _value.maintenance
          : maintenance // ignore: cast_nullable_to_non_nullable
              as MaintenanceInfo,
      suitableCrops: null == suitableCrops
          ? _value.suitableCrops
          : suitableCrops // ignore: cast_nullable_to_non_nullable
              as List<String>,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      powerSource: null == powerSource
          ? _value.powerSource
          : powerSource // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      maintenanceHistory: null == maintenanceHistory
          ? _value.maintenanceHistory
          : maintenanceHistory // ignore: cast_nullable_to_non_nullable
              as List<MaintenanceRecord>,
      usageHistory: null == usageHistory
          ? _value.usageHistory
          : usageHistory // ignore: cast_nullable_to_non_nullable
              as List<UsageRecord>,
    ) as $Val);
  }

  /// Create a copy of FarmInstrumentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaintenanceInfoCopyWith<$Res> get maintenance {
    return $MaintenanceInfoCopyWith<$Res>(_value.maintenance, (value) {
      return _then(_value.copyWith(maintenance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FarmInstrumentDetailImplCopyWith<$Res>
    implements $FarmInstrumentDetailCopyWith<$Res> {
  factory _$$FarmInstrumentDetailImplCopyWith(_$FarmInstrumentDetailImpl value,
          $Res Function(_$FarmInstrumentDetailImpl) then) =
      __$$FarmInstrumentDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      FarmInstrument type,
      String name,
      String hindiName,
      String description,
      String brand,
      String model,
      double purchasePrice,
      DateTime purchaseDate,
      String condition,
      MaintenanceInfo maintenance,
      List<String> suitableCrops,
      List<String> features,
      String powerSource,
      String size,
      List<MaintenanceRecord> maintenanceHistory,
      List<UsageRecord> usageHistory});

  @override
  $MaintenanceInfoCopyWith<$Res> get maintenance;
}

/// @nodoc
class __$$FarmInstrumentDetailImplCopyWithImpl<$Res>
    extends _$FarmInstrumentDetailCopyWithImpl<$Res, _$FarmInstrumentDetailImpl>
    implements _$$FarmInstrumentDetailImplCopyWith<$Res> {
  __$$FarmInstrumentDetailImplCopyWithImpl(_$FarmInstrumentDetailImpl _value,
      $Res Function(_$FarmInstrumentDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of FarmInstrumentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? hindiName = null,
    Object? description = null,
    Object? brand = null,
    Object? model = null,
    Object? purchasePrice = null,
    Object? purchaseDate = null,
    Object? condition = null,
    Object? maintenance = null,
    Object? suitableCrops = null,
    Object? features = null,
    Object? powerSource = null,
    Object? size = null,
    Object? maintenanceHistory = null,
    Object? usageHistory = null,
  }) {
    return _then(_$FarmInstrumentDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FarmInstrument,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      purchasePrice: null == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      maintenance: null == maintenance
          ? _value.maintenance
          : maintenance // ignore: cast_nullable_to_non_nullable
              as MaintenanceInfo,
      suitableCrops: null == suitableCrops
          ? _value._suitableCrops
          : suitableCrops // ignore: cast_nullable_to_non_nullable
              as List<String>,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      powerSource: null == powerSource
          ? _value.powerSource
          : powerSource // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      maintenanceHistory: null == maintenanceHistory
          ? _value._maintenanceHistory
          : maintenanceHistory // ignore: cast_nullable_to_non_nullable
              as List<MaintenanceRecord>,
      usageHistory: null == usageHistory
          ? _value._usageHistory
          : usageHistory // ignore: cast_nullable_to_non_nullable
              as List<UsageRecord>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FarmInstrumentDetailImpl implements _FarmInstrumentDetail {
  const _$FarmInstrumentDetailImpl(
      {required this.id,
      required this.type,
      required this.name,
      required this.hindiName,
      required this.description,
      required this.brand,
      required this.model,
      required this.purchasePrice,
      required this.purchaseDate,
      required this.condition,
      required this.maintenance,
      required final List<String> suitableCrops,
      required final List<String> features,
      required this.powerSource,
      required this.size,
      final List<MaintenanceRecord> maintenanceHistory = const [],
      final List<UsageRecord> usageHistory = const []})
      : _suitableCrops = suitableCrops,
        _features = features,
        _maintenanceHistory = maintenanceHistory,
        _usageHistory = usageHistory;

  factory _$FarmInstrumentDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$FarmInstrumentDetailImplFromJson(json);

  @override
  final String id;
  @override
  final FarmInstrument type;
  @override
  final String name;
  @override
  final String hindiName;
  @override
  final String description;
  @override
  final String brand;
  @override
  final String model;
  @override
  final double purchasePrice;
  @override
  final DateTime purchaseDate;
  @override
  final String condition;
  @override
  final MaintenanceInfo maintenance;
  final List<String> _suitableCrops;
  @override
  List<String> get suitableCrops {
    if (_suitableCrops is EqualUnmodifiableListView) return _suitableCrops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suitableCrops);
  }

  final List<String> _features;
  @override
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  final String powerSource;
  @override
  final String size;
  final List<MaintenanceRecord> _maintenanceHistory;
  @override
  @JsonKey()
  List<MaintenanceRecord> get maintenanceHistory {
    if (_maintenanceHistory is EqualUnmodifiableListView)
      return _maintenanceHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_maintenanceHistory);
  }

  final List<UsageRecord> _usageHistory;
  @override
  @JsonKey()
  List<UsageRecord> get usageHistory {
    if (_usageHistory is EqualUnmodifiableListView) return _usageHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usageHistory);
  }

  @override
  String toString() {
    return 'FarmInstrumentDetail(id: $id, type: $type, name: $name, hindiName: $hindiName, description: $description, brand: $brand, model: $model, purchasePrice: $purchasePrice, purchaseDate: $purchaseDate, condition: $condition, maintenance: $maintenance, suitableCrops: $suitableCrops, features: $features, powerSource: $powerSource, size: $size, maintenanceHistory: $maintenanceHistory, usageHistory: $usageHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FarmInstrumentDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hindiName, hindiName) ||
                other.hindiName == hindiName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.maintenance, maintenance) ||
                other.maintenance == maintenance) &&
            const DeepCollectionEquality()
                .equals(other._suitableCrops, _suitableCrops) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.powerSource, powerSource) ||
                other.powerSource == powerSource) &&
            (identical(other.size, size) || other.size == size) &&
            const DeepCollectionEquality()
                .equals(other._maintenanceHistory, _maintenanceHistory) &&
            const DeepCollectionEquality()
                .equals(other._usageHistory, _usageHistory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      name,
      hindiName,
      description,
      brand,
      model,
      purchasePrice,
      purchaseDate,
      condition,
      maintenance,
      const DeepCollectionEquality().hash(_suitableCrops),
      const DeepCollectionEquality().hash(_features),
      powerSource,
      size,
      const DeepCollectionEquality().hash(_maintenanceHistory),
      const DeepCollectionEquality().hash(_usageHistory));

  /// Create a copy of FarmInstrumentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FarmInstrumentDetailImplCopyWith<_$FarmInstrumentDetailImpl>
      get copyWith =>
          __$$FarmInstrumentDetailImplCopyWithImpl<_$FarmInstrumentDetailImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FarmInstrumentDetailImplToJson(
      this,
    );
  }
}

abstract class _FarmInstrumentDetail implements FarmInstrumentDetail {
  const factory _FarmInstrumentDetail(
      {required final String id,
      required final FarmInstrument type,
      required final String name,
      required final String hindiName,
      required final String description,
      required final String brand,
      required final String model,
      required final double purchasePrice,
      required final DateTime purchaseDate,
      required final String condition,
      required final MaintenanceInfo maintenance,
      required final List<String> suitableCrops,
      required final List<String> features,
      required final String powerSource,
      required final String size,
      final List<MaintenanceRecord> maintenanceHistory,
      final List<UsageRecord> usageHistory}) = _$FarmInstrumentDetailImpl;

  factory _FarmInstrumentDetail.fromJson(Map<String, dynamic> json) =
      _$FarmInstrumentDetailImpl.fromJson;

  @override
  String get id;
  @override
  FarmInstrument get type;
  @override
  String get name;
  @override
  String get hindiName;
  @override
  String get description;
  @override
  String get brand;
  @override
  String get model;
  @override
  double get purchasePrice;
  @override
  DateTime get purchaseDate;
  @override
  String get condition;
  @override
  MaintenanceInfo get maintenance;
  @override
  List<String> get suitableCrops;
  @override
  List<String> get features;
  @override
  String get powerSource;
  @override
  String get size;
  @override
  List<MaintenanceRecord> get maintenanceHistory;
  @override
  List<UsageRecord> get usageHistory;

  /// Create a copy of FarmInstrumentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FarmInstrumentDetailImplCopyWith<_$FarmInstrumentDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MaintenanceInfo _$MaintenanceInfoFromJson(Map<String, dynamic> json) {
  return _MaintenanceInfo.fromJson(json);
}

/// @nodoc
mixin _$MaintenanceInfo {
  String get frequency => throw _privateConstructorUsedError;
  List<String> get checklist => throw _privateConstructorUsedError;
  double get estimatedCost => throw _privateConstructorUsedError;
  DateTime get lastMaintenance => throw _privateConstructorUsedError;
  DateTime get nextMaintenance => throw _privateConstructorUsedError;
  List<String> get commonIssues => throw _privateConstructorUsedError;
  List<String> get spareParts => throw _privateConstructorUsedError;

  /// Serializes this MaintenanceInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaintenanceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaintenanceInfoCopyWith<MaintenanceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceInfoCopyWith<$Res> {
  factory $MaintenanceInfoCopyWith(
          MaintenanceInfo value, $Res Function(MaintenanceInfo) then) =
      _$MaintenanceInfoCopyWithImpl<$Res, MaintenanceInfo>;
  @useResult
  $Res call(
      {String frequency,
      List<String> checklist,
      double estimatedCost,
      DateTime lastMaintenance,
      DateTime nextMaintenance,
      List<String> commonIssues,
      List<String> spareParts});
}

/// @nodoc
class _$MaintenanceInfoCopyWithImpl<$Res, $Val extends MaintenanceInfo>
    implements $MaintenanceInfoCopyWith<$Res> {
  _$MaintenanceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaintenanceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frequency = null,
    Object? checklist = null,
    Object? estimatedCost = null,
    Object? lastMaintenance = null,
    Object? nextMaintenance = null,
    Object? commonIssues = null,
    Object? spareParts = null,
  }) {
    return _then(_value.copyWith(
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      checklist: null == checklist
          ? _value.checklist
          : checklist // ignore: cast_nullable_to_non_nullable
              as List<String>,
      estimatedCost: null == estimatedCost
          ? _value.estimatedCost
          : estimatedCost // ignore: cast_nullable_to_non_nullable
              as double,
      lastMaintenance: null == lastMaintenance
          ? _value.lastMaintenance
          : lastMaintenance // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextMaintenance: null == nextMaintenance
          ? _value.nextMaintenance
          : nextMaintenance // ignore: cast_nullable_to_non_nullable
              as DateTime,
      commonIssues: null == commonIssues
          ? _value.commonIssues
          : commonIssues // ignore: cast_nullable_to_non_nullable
              as List<String>,
      spareParts: null == spareParts
          ? _value.spareParts
          : spareParts // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaintenanceInfoImplCopyWith<$Res>
    implements $MaintenanceInfoCopyWith<$Res> {
  factory _$$MaintenanceInfoImplCopyWith(_$MaintenanceInfoImpl value,
          $Res Function(_$MaintenanceInfoImpl) then) =
      __$$MaintenanceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String frequency,
      List<String> checklist,
      double estimatedCost,
      DateTime lastMaintenance,
      DateTime nextMaintenance,
      List<String> commonIssues,
      List<String> spareParts});
}

/// @nodoc
class __$$MaintenanceInfoImplCopyWithImpl<$Res>
    extends _$MaintenanceInfoCopyWithImpl<$Res, _$MaintenanceInfoImpl>
    implements _$$MaintenanceInfoImplCopyWith<$Res> {
  __$$MaintenanceInfoImplCopyWithImpl(
      _$MaintenanceInfoImpl _value, $Res Function(_$MaintenanceInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaintenanceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frequency = null,
    Object? checklist = null,
    Object? estimatedCost = null,
    Object? lastMaintenance = null,
    Object? nextMaintenance = null,
    Object? commonIssues = null,
    Object? spareParts = null,
  }) {
    return _then(_$MaintenanceInfoImpl(
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      checklist: null == checklist
          ? _value._checklist
          : checklist // ignore: cast_nullable_to_non_nullable
              as List<String>,
      estimatedCost: null == estimatedCost
          ? _value.estimatedCost
          : estimatedCost // ignore: cast_nullable_to_non_nullable
              as double,
      lastMaintenance: null == lastMaintenance
          ? _value.lastMaintenance
          : lastMaintenance // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextMaintenance: null == nextMaintenance
          ? _value.nextMaintenance
          : nextMaintenance // ignore: cast_nullable_to_non_nullable
              as DateTime,
      commonIssues: null == commonIssues
          ? _value._commonIssues
          : commonIssues // ignore: cast_nullable_to_non_nullable
              as List<String>,
      spareParts: null == spareParts
          ? _value._spareParts
          : spareParts // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaintenanceInfoImpl implements _MaintenanceInfo {
  const _$MaintenanceInfoImpl(
      {required this.frequency,
      required final List<String> checklist,
      required this.estimatedCost,
      required this.lastMaintenance,
      required this.nextMaintenance,
      required final List<String> commonIssues,
      required final List<String> spareParts})
      : _checklist = checklist,
        _commonIssues = commonIssues,
        _spareParts = spareParts;

  factory _$MaintenanceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaintenanceInfoImplFromJson(json);

  @override
  final String frequency;
  final List<String> _checklist;
  @override
  List<String> get checklist {
    if (_checklist is EqualUnmodifiableListView) return _checklist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checklist);
  }

  @override
  final double estimatedCost;
  @override
  final DateTime lastMaintenance;
  @override
  final DateTime nextMaintenance;
  final List<String> _commonIssues;
  @override
  List<String> get commonIssues {
    if (_commonIssues is EqualUnmodifiableListView) return _commonIssues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commonIssues);
  }

  final List<String> _spareParts;
  @override
  List<String> get spareParts {
    if (_spareParts is EqualUnmodifiableListView) return _spareParts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spareParts);
  }

  @override
  String toString() {
    return 'MaintenanceInfo(frequency: $frequency, checklist: $checklist, estimatedCost: $estimatedCost, lastMaintenance: $lastMaintenance, nextMaintenance: $nextMaintenance, commonIssues: $commonIssues, spareParts: $spareParts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceInfoImpl &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            const DeepCollectionEquality()
                .equals(other._checklist, _checklist) &&
            (identical(other.estimatedCost, estimatedCost) ||
                other.estimatedCost == estimatedCost) &&
            (identical(other.lastMaintenance, lastMaintenance) ||
                other.lastMaintenance == lastMaintenance) &&
            (identical(other.nextMaintenance, nextMaintenance) ||
                other.nextMaintenance == nextMaintenance) &&
            const DeepCollectionEquality()
                .equals(other._commonIssues, _commonIssues) &&
            const DeepCollectionEquality()
                .equals(other._spareParts, _spareParts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      frequency,
      const DeepCollectionEquality().hash(_checklist),
      estimatedCost,
      lastMaintenance,
      nextMaintenance,
      const DeepCollectionEquality().hash(_commonIssues),
      const DeepCollectionEquality().hash(_spareParts));

  /// Create a copy of MaintenanceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceInfoImplCopyWith<_$MaintenanceInfoImpl> get copyWith =>
      __$$MaintenanceInfoImplCopyWithImpl<_$MaintenanceInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaintenanceInfoImplToJson(
      this,
    );
  }
}

abstract class _MaintenanceInfo implements MaintenanceInfo {
  const factory _MaintenanceInfo(
      {required final String frequency,
      required final List<String> checklist,
      required final double estimatedCost,
      required final DateTime lastMaintenance,
      required final DateTime nextMaintenance,
      required final List<String> commonIssues,
      required final List<String> spareParts}) = _$MaintenanceInfoImpl;

  factory _MaintenanceInfo.fromJson(Map<String, dynamic> json) =
      _$MaintenanceInfoImpl.fromJson;

  @override
  String get frequency;
  @override
  List<String> get checklist;
  @override
  double get estimatedCost;
  @override
  DateTime get lastMaintenance;
  @override
  DateTime get nextMaintenance;
  @override
  List<String> get commonIssues;
  @override
  List<String> get spareParts;

  /// Create a copy of MaintenanceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaintenanceInfoImplCopyWith<_$MaintenanceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MaintenanceRecord _$MaintenanceRecordFromJson(Map<String, dynamic> json) {
  return _MaintenanceRecord.fromJson(json);
}

/// @nodoc
mixin _$MaintenanceRecord {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get serviceProvider => throw _privateConstructorUsedError;
  List<String> get partsReplaced => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this MaintenanceRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaintenanceRecordCopyWith<MaintenanceRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceRecordCopyWith<$Res> {
  factory $MaintenanceRecordCopyWith(
          MaintenanceRecord value, $Res Function(MaintenanceRecord) then) =
      _$MaintenanceRecordCopyWithImpl<$Res, MaintenanceRecord>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String type,
      String description,
      double cost,
      String serviceProvider,
      List<String> partsReplaced,
      String notes});
}

/// @nodoc
class _$MaintenanceRecordCopyWithImpl<$Res, $Val extends MaintenanceRecord>
    implements $MaintenanceRecordCopyWith<$Res> {
  _$MaintenanceRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? type = null,
    Object? description = null,
    Object? cost = null,
    Object? serviceProvider = null,
    Object? partsReplaced = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      serviceProvider: null == serviceProvider
          ? _value.serviceProvider
          : serviceProvider // ignore: cast_nullable_to_non_nullable
              as String,
      partsReplaced: null == partsReplaced
          ? _value.partsReplaced
          : partsReplaced // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaintenanceRecordImplCopyWith<$Res>
    implements $MaintenanceRecordCopyWith<$Res> {
  factory _$$MaintenanceRecordImplCopyWith(_$MaintenanceRecordImpl value,
          $Res Function(_$MaintenanceRecordImpl) then) =
      __$$MaintenanceRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String type,
      String description,
      double cost,
      String serviceProvider,
      List<String> partsReplaced,
      String notes});
}

/// @nodoc
class __$$MaintenanceRecordImplCopyWithImpl<$Res>
    extends _$MaintenanceRecordCopyWithImpl<$Res, _$MaintenanceRecordImpl>
    implements _$$MaintenanceRecordImplCopyWith<$Res> {
  __$$MaintenanceRecordImplCopyWithImpl(_$MaintenanceRecordImpl _value,
      $Res Function(_$MaintenanceRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? type = null,
    Object? description = null,
    Object? cost = null,
    Object? serviceProvider = null,
    Object? partsReplaced = null,
    Object? notes = null,
  }) {
    return _then(_$MaintenanceRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      serviceProvider: null == serviceProvider
          ? _value.serviceProvider
          : serviceProvider // ignore: cast_nullable_to_non_nullable
              as String,
      partsReplaced: null == partsReplaced
          ? _value._partsReplaced
          : partsReplaced // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaintenanceRecordImpl implements _MaintenanceRecord {
  const _$MaintenanceRecordImpl(
      {required this.id,
      required this.date,
      required this.type,
      required this.description,
      required this.cost,
      required this.serviceProvider,
      required final List<String> partsReplaced,
      required this.notes})
      : _partsReplaced = partsReplaced;

  factory _$MaintenanceRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaintenanceRecordImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String type;
  @override
  final String description;
  @override
  final double cost;
  @override
  final String serviceProvider;
  final List<String> _partsReplaced;
  @override
  List<String> get partsReplaced {
    if (_partsReplaced is EqualUnmodifiableListView) return _partsReplaced;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partsReplaced);
  }

  @override
  final String notes;

  @override
  String toString() {
    return 'MaintenanceRecord(id: $id, date: $date, type: $type, description: $description, cost: $cost, serviceProvider: $serviceProvider, partsReplaced: $partsReplaced, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.serviceProvider, serviceProvider) ||
                other.serviceProvider == serviceProvider) &&
            const DeepCollectionEquality()
                .equals(other._partsReplaced, _partsReplaced) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      type,
      description,
      cost,
      serviceProvider,
      const DeepCollectionEquality().hash(_partsReplaced),
      notes);

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceRecordImplCopyWith<_$MaintenanceRecordImpl> get copyWith =>
      __$$MaintenanceRecordImplCopyWithImpl<_$MaintenanceRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaintenanceRecordImplToJson(
      this,
    );
  }
}

abstract class _MaintenanceRecord implements MaintenanceRecord {
  const factory _MaintenanceRecord(
      {required final String id,
      required final DateTime date,
      required final String type,
      required final String description,
      required final double cost,
      required final String serviceProvider,
      required final List<String> partsReplaced,
      required final String notes}) = _$MaintenanceRecordImpl;

  factory _MaintenanceRecord.fromJson(Map<String, dynamic> json) =
      _$MaintenanceRecordImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get type;
  @override
  String get description;
  @override
  double get cost;
  @override
  String get serviceProvider;
  @override
  List<String> get partsReplaced;
  @override
  String get notes;

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaintenanceRecordImplCopyWith<_$MaintenanceRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UsageRecord _$UsageRecordFromJson(Map<String, dynamic> json) {
  return _UsageRecord.fromJson(json);
}

/// @nodoc
mixin _$UsageRecord {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get fieldId => throw _privateConstructorUsedError;
  String get operation => throw _privateConstructorUsedError;
  double get hoursUsed => throw _privateConstructorUsedError;
  double get fuelConsumed => throw _privateConstructorUsedError;
  String get operator => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this UsageRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsageRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsageRecordCopyWith<UsageRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageRecordCopyWith<$Res> {
  factory $UsageRecordCopyWith(
          UsageRecord value, $Res Function(UsageRecord) then) =
      _$UsageRecordCopyWithImpl<$Res, UsageRecord>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String fieldId,
      String operation,
      double hoursUsed,
      double fuelConsumed,
      String operator,
      String notes});
}

/// @nodoc
class _$UsageRecordCopyWithImpl<$Res, $Val extends UsageRecord>
    implements $UsageRecordCopyWith<$Res> {
  _$UsageRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsageRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? fieldId = null,
    Object? operation = null,
    Object? hoursUsed = null,
    Object? fuelConsumed = null,
    Object? operator = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fieldId: null == fieldId
          ? _value.fieldId
          : fieldId // ignore: cast_nullable_to_non_nullable
              as String,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      hoursUsed: null == hoursUsed
          ? _value.hoursUsed
          : hoursUsed // ignore: cast_nullable_to_non_nullable
              as double,
      fuelConsumed: null == fuelConsumed
          ? _value.fuelConsumed
          : fuelConsumed // ignore: cast_nullable_to_non_nullable
              as double,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsageRecordImplCopyWith<$Res>
    implements $UsageRecordCopyWith<$Res> {
  factory _$$UsageRecordImplCopyWith(
          _$UsageRecordImpl value, $Res Function(_$UsageRecordImpl) then) =
      __$$UsageRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String fieldId,
      String operation,
      double hoursUsed,
      double fuelConsumed,
      String operator,
      String notes});
}

/// @nodoc
class __$$UsageRecordImplCopyWithImpl<$Res>
    extends _$UsageRecordCopyWithImpl<$Res, _$UsageRecordImpl>
    implements _$$UsageRecordImplCopyWith<$Res> {
  __$$UsageRecordImplCopyWithImpl(
      _$UsageRecordImpl _value, $Res Function(_$UsageRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsageRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? fieldId = null,
    Object? operation = null,
    Object? hoursUsed = null,
    Object? fuelConsumed = null,
    Object? operator = null,
    Object? notes = null,
  }) {
    return _then(_$UsageRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fieldId: null == fieldId
          ? _value.fieldId
          : fieldId // ignore: cast_nullable_to_non_nullable
              as String,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      hoursUsed: null == hoursUsed
          ? _value.hoursUsed
          : hoursUsed // ignore: cast_nullable_to_non_nullable
              as double,
      fuelConsumed: null == fuelConsumed
          ? _value.fuelConsumed
          : fuelConsumed // ignore: cast_nullable_to_non_nullable
              as double,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsageRecordImpl implements _UsageRecord {
  const _$UsageRecordImpl(
      {required this.id,
      required this.date,
      required this.fieldId,
      required this.operation,
      required this.hoursUsed,
      required this.fuelConsumed,
      required this.operator,
      required this.notes});

  factory _$UsageRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsageRecordImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String fieldId;
  @override
  final String operation;
  @override
  final double hoursUsed;
  @override
  final double fuelConsumed;
  @override
  final String operator;
  @override
  final String notes;

  @override
  String toString() {
    return 'UsageRecord(id: $id, date: $date, fieldId: $fieldId, operation: $operation, hoursUsed: $hoursUsed, fuelConsumed: $fuelConsumed, operator: $operator, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsageRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.fieldId, fieldId) || other.fieldId == fieldId) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.hoursUsed, hoursUsed) ||
                other.hoursUsed == hoursUsed) &&
            (identical(other.fuelConsumed, fuelConsumed) ||
                other.fuelConsumed == fuelConsumed) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, fieldId, operation,
      hoursUsed, fuelConsumed, operator, notes);

  /// Create a copy of UsageRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsageRecordImplCopyWith<_$UsageRecordImpl> get copyWith =>
      __$$UsageRecordImplCopyWithImpl<_$UsageRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsageRecordImplToJson(
      this,
    );
  }
}

abstract class _UsageRecord implements UsageRecord {
  const factory _UsageRecord(
      {required final String id,
      required final DateTime date,
      required final String fieldId,
      required final String operation,
      required final double hoursUsed,
      required final double fuelConsumed,
      required final String operator,
      required final String notes}) = _$UsageRecordImpl;

  factory _UsageRecord.fromJson(Map<String, dynamic> json) =
      _$UsageRecordImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get fieldId;
  @override
  String get operation;
  @override
  double get hoursUsed;
  @override
  double get fuelConsumed;
  @override
  String get operator;
  @override
  String get notes;

  /// Create a copy of UsageRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsageRecordImplCopyWith<_$UsageRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FertilizerDetail _$FertilizerDetailFromJson(Map<String, dynamic> json) {
  return _FertilizerDetail.fromJson(json);
}

/// @nodoc
mixin _$FertilizerDetail {
  String get id => throw _privateConstructorUsedError;
  FertilizerType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get hindiName => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get composition => throw _privateConstructorUsedError;
  double get pricePerKg => throw _privateConstructorUsedError;
  String get packagingSize => throw _privateConstructorUsedError;
  ApplicationMethod get application => throw _privateConstructorUsedError;
  List<String> get suitableCrops => throw _privateConstructorUsedError;
  List<CropSeason> get suitableSeasons => throw _privateConstructorUsedError;
  String get storageInstructions => throw _privateConstructorUsedError;
  String get safetyPrecautions => throw _privateConstructorUsedError;
  String get manufacturer => throw _privateConstructorUsedError;
  DateTime get expiryDate => throw _privateConstructorUsedError;
  List<String> get benefits => throw _privateConstructorUsedError;
  List<String> get sideEffects => throw _privateConstructorUsedError;

  /// Serializes this FertilizerDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FertilizerDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FertilizerDetailCopyWith<FertilizerDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FertilizerDetailCopyWith<$Res> {
  factory $FertilizerDetailCopyWith(
          FertilizerDetail value, $Res Function(FertilizerDetail) then) =
      _$FertilizerDetailCopyWithImpl<$Res, FertilizerDetail>;
  @useResult
  $Res call(
      {String id,
      FertilizerType type,
      String name,
      String hindiName,
      String brand,
      String composition,
      double pricePerKg,
      String packagingSize,
      ApplicationMethod application,
      List<String> suitableCrops,
      List<CropSeason> suitableSeasons,
      String storageInstructions,
      String safetyPrecautions,
      String manufacturer,
      DateTime expiryDate,
      List<String> benefits,
      List<String> sideEffects});

  $ApplicationMethodCopyWith<$Res> get application;
}

/// @nodoc
class _$FertilizerDetailCopyWithImpl<$Res, $Val extends FertilizerDetail>
    implements $FertilizerDetailCopyWith<$Res> {
  _$FertilizerDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FertilizerDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? hindiName = null,
    Object? brand = null,
    Object? composition = null,
    Object? pricePerKg = null,
    Object? packagingSize = null,
    Object? application = null,
    Object? suitableCrops = null,
    Object? suitableSeasons = null,
    Object? storageInstructions = null,
    Object? safetyPrecautions = null,
    Object? manufacturer = null,
    Object? expiryDate = null,
    Object? benefits = null,
    Object? sideEffects = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FertilizerType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      composition: null == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerKg: null == pricePerKg
          ? _value.pricePerKg
          : pricePerKg // ignore: cast_nullable_to_non_nullable
              as double,
      packagingSize: null == packagingSize
          ? _value.packagingSize
          : packagingSize // ignore: cast_nullable_to_non_nullable
              as String,
      application: null == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationMethod,
      suitableCrops: null == suitableCrops
          ? _value.suitableCrops
          : suitableCrops // ignore: cast_nullable_to_non_nullable
              as List<String>,
      suitableSeasons: null == suitableSeasons
          ? _value.suitableSeasons
          : suitableSeasons // ignore: cast_nullable_to_non_nullable
              as List<CropSeason>,
      storageInstructions: null == storageInstructions
          ? _value.storageInstructions
          : storageInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      safetyPrecautions: null == safetyPrecautions
          ? _value.safetyPrecautions
          : safetyPrecautions // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      benefits: null == benefits
          ? _value.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sideEffects: null == sideEffects
          ? _value.sideEffects
          : sideEffects // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of FertilizerDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApplicationMethodCopyWith<$Res> get application {
    return $ApplicationMethodCopyWith<$Res>(_value.application, (value) {
      return _then(_value.copyWith(application: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FertilizerDetailImplCopyWith<$Res>
    implements $FertilizerDetailCopyWith<$Res> {
  factory _$$FertilizerDetailImplCopyWith(_$FertilizerDetailImpl value,
          $Res Function(_$FertilizerDetailImpl) then) =
      __$$FertilizerDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      FertilizerType type,
      String name,
      String hindiName,
      String brand,
      String composition,
      double pricePerKg,
      String packagingSize,
      ApplicationMethod application,
      List<String> suitableCrops,
      List<CropSeason> suitableSeasons,
      String storageInstructions,
      String safetyPrecautions,
      String manufacturer,
      DateTime expiryDate,
      List<String> benefits,
      List<String> sideEffects});

  @override
  $ApplicationMethodCopyWith<$Res> get application;
}

/// @nodoc
class __$$FertilizerDetailImplCopyWithImpl<$Res>
    extends _$FertilizerDetailCopyWithImpl<$Res, _$FertilizerDetailImpl>
    implements _$$FertilizerDetailImplCopyWith<$Res> {
  __$$FertilizerDetailImplCopyWithImpl(_$FertilizerDetailImpl _value,
      $Res Function(_$FertilizerDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of FertilizerDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? hindiName = null,
    Object? brand = null,
    Object? composition = null,
    Object? pricePerKg = null,
    Object? packagingSize = null,
    Object? application = null,
    Object? suitableCrops = null,
    Object? suitableSeasons = null,
    Object? storageInstructions = null,
    Object? safetyPrecautions = null,
    Object? manufacturer = null,
    Object? expiryDate = null,
    Object? benefits = null,
    Object? sideEffects = null,
  }) {
    return _then(_$FertilizerDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FertilizerType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      composition: null == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerKg: null == pricePerKg
          ? _value.pricePerKg
          : pricePerKg // ignore: cast_nullable_to_non_nullable
              as double,
      packagingSize: null == packagingSize
          ? _value.packagingSize
          : packagingSize // ignore: cast_nullable_to_non_nullable
              as String,
      application: null == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationMethod,
      suitableCrops: null == suitableCrops
          ? _value._suitableCrops
          : suitableCrops // ignore: cast_nullable_to_non_nullable
              as List<String>,
      suitableSeasons: null == suitableSeasons
          ? _value._suitableSeasons
          : suitableSeasons // ignore: cast_nullable_to_non_nullable
              as List<CropSeason>,
      storageInstructions: null == storageInstructions
          ? _value.storageInstructions
          : storageInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      safetyPrecautions: null == safetyPrecautions
          ? _value.safetyPrecautions
          : safetyPrecautions // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      benefits: null == benefits
          ? _value._benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sideEffects: null == sideEffects
          ? _value._sideEffects
          : sideEffects // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FertilizerDetailImpl implements _FertilizerDetail {
  const _$FertilizerDetailImpl(
      {required this.id,
      required this.type,
      required this.name,
      required this.hindiName,
      required this.brand,
      required this.composition,
      required this.pricePerKg,
      required this.packagingSize,
      required this.application,
      required final List<String> suitableCrops,
      required final List<CropSeason> suitableSeasons,
      required this.storageInstructions,
      required this.safetyPrecautions,
      required this.manufacturer,
      required this.expiryDate,
      final List<String> benefits = const [],
      final List<String> sideEffects = const []})
      : _suitableCrops = suitableCrops,
        _suitableSeasons = suitableSeasons,
        _benefits = benefits,
        _sideEffects = sideEffects;

  factory _$FertilizerDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$FertilizerDetailImplFromJson(json);

  @override
  final String id;
  @override
  final FertilizerType type;
  @override
  final String name;
  @override
  final String hindiName;
  @override
  final String brand;
  @override
  final String composition;
  @override
  final double pricePerKg;
  @override
  final String packagingSize;
  @override
  final ApplicationMethod application;
  final List<String> _suitableCrops;
  @override
  List<String> get suitableCrops {
    if (_suitableCrops is EqualUnmodifiableListView) return _suitableCrops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suitableCrops);
  }

  final List<CropSeason> _suitableSeasons;
  @override
  List<CropSeason> get suitableSeasons {
    if (_suitableSeasons is EqualUnmodifiableListView) return _suitableSeasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suitableSeasons);
  }

  @override
  final String storageInstructions;
  @override
  final String safetyPrecautions;
  @override
  final String manufacturer;
  @override
  final DateTime expiryDate;
  final List<String> _benefits;
  @override
  @JsonKey()
  List<String> get benefits {
    if (_benefits is EqualUnmodifiableListView) return _benefits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_benefits);
  }

  final List<String> _sideEffects;
  @override
  @JsonKey()
  List<String> get sideEffects {
    if (_sideEffects is EqualUnmodifiableListView) return _sideEffects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sideEffects);
  }

  @override
  String toString() {
    return 'FertilizerDetail(id: $id, type: $type, name: $name, hindiName: $hindiName, brand: $brand, composition: $composition, pricePerKg: $pricePerKg, packagingSize: $packagingSize, application: $application, suitableCrops: $suitableCrops, suitableSeasons: $suitableSeasons, storageInstructions: $storageInstructions, safetyPrecautions: $safetyPrecautions, manufacturer: $manufacturer, expiryDate: $expiryDate, benefits: $benefits, sideEffects: $sideEffects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FertilizerDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hindiName, hindiName) ||
                other.hindiName == hindiName) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.composition, composition) ||
                other.composition == composition) &&
            (identical(other.pricePerKg, pricePerKg) ||
                other.pricePerKg == pricePerKg) &&
            (identical(other.packagingSize, packagingSize) ||
                other.packagingSize == packagingSize) &&
            (identical(other.application, application) ||
                other.application == application) &&
            const DeepCollectionEquality()
                .equals(other._suitableCrops, _suitableCrops) &&
            const DeepCollectionEquality()
                .equals(other._suitableSeasons, _suitableSeasons) &&
            (identical(other.storageInstructions, storageInstructions) ||
                other.storageInstructions == storageInstructions) &&
            (identical(other.safetyPrecautions, safetyPrecautions) ||
                other.safetyPrecautions == safetyPrecautions) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            const DeepCollectionEquality().equals(other._benefits, _benefits) &&
            const DeepCollectionEquality()
                .equals(other._sideEffects, _sideEffects));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      name,
      hindiName,
      brand,
      composition,
      pricePerKg,
      packagingSize,
      application,
      const DeepCollectionEquality().hash(_suitableCrops),
      const DeepCollectionEquality().hash(_suitableSeasons),
      storageInstructions,
      safetyPrecautions,
      manufacturer,
      expiryDate,
      const DeepCollectionEquality().hash(_benefits),
      const DeepCollectionEquality().hash(_sideEffects));

  /// Create a copy of FertilizerDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FertilizerDetailImplCopyWith<_$FertilizerDetailImpl> get copyWith =>
      __$$FertilizerDetailImplCopyWithImpl<_$FertilizerDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FertilizerDetailImplToJson(
      this,
    );
  }
}

abstract class _FertilizerDetail implements FertilizerDetail {
  const factory _FertilizerDetail(
      {required final String id,
      required final FertilizerType type,
      required final String name,
      required final String hindiName,
      required final String brand,
      required final String composition,
      required final double pricePerKg,
      required final String packagingSize,
      required final ApplicationMethod application,
      required final List<String> suitableCrops,
      required final List<CropSeason> suitableSeasons,
      required final String storageInstructions,
      required final String safetyPrecautions,
      required final String manufacturer,
      required final DateTime expiryDate,
      final List<String> benefits,
      final List<String> sideEffects}) = _$FertilizerDetailImpl;

  factory _FertilizerDetail.fromJson(Map<String, dynamic> json) =
      _$FertilizerDetailImpl.fromJson;

  @override
  String get id;
  @override
  FertilizerType get type;
  @override
  String get name;
  @override
  String get hindiName;
  @override
  String get brand;
  @override
  String get composition;
  @override
  double get pricePerKg;
  @override
  String get packagingSize;
  @override
  ApplicationMethod get application;
  @override
  List<String> get suitableCrops;
  @override
  List<CropSeason> get suitableSeasons;
  @override
  String get storageInstructions;
  @override
  String get safetyPrecautions;
  @override
  String get manufacturer;
  @override
  DateTime get expiryDate;
  @override
  List<String> get benefits;
  @override
  List<String> get sideEffects;

  /// Create a copy of FertilizerDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FertilizerDetailImplCopyWith<_$FertilizerDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApplicationMethod _$ApplicationMethodFromJson(Map<String, dynamic> json) {
  return _ApplicationMethod.fromJson(json);
}

/// @nodoc
mixin _$ApplicationMethod {
  String get method => throw _privateConstructorUsedError;
  String get dosage => throw _privateConstructorUsedError;
  String get timing => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;
  List<String> get mixingInstructions => throw _privateConstructorUsedError;
  String get equipment => throw _privateConstructorUsedError;
  String get waterRequirement => throw _privateConstructorUsedError;

  /// Serializes this ApplicationMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApplicationMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplicationMethodCopyWith<ApplicationMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationMethodCopyWith<$Res> {
  factory $ApplicationMethodCopyWith(
          ApplicationMethod value, $Res Function(ApplicationMethod) then) =
      _$ApplicationMethodCopyWithImpl<$Res, ApplicationMethod>;
  @useResult
  $Res call(
      {String method,
      String dosage,
      String timing,
      String frequency,
      List<String> mixingInstructions,
      String equipment,
      String waterRequirement});
}

/// @nodoc
class _$ApplicationMethodCopyWithImpl<$Res, $Val extends ApplicationMethod>
    implements $ApplicationMethodCopyWith<$Res> {
  _$ApplicationMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplicationMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? dosage = null,
    Object? timing = null,
    Object? frequency = null,
    Object? mixingInstructions = null,
    Object? equipment = null,
    Object? waterRequirement = null,
  }) {
    return _then(_value.copyWith(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      timing: null == timing
          ? _value.timing
          : timing // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      mixingInstructions: null == mixingInstructions
          ? _value.mixingInstructions
          : mixingInstructions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      waterRequirement: null == waterRequirement
          ? _value.waterRequirement
          : waterRequirement // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationMethodImplCopyWith<$Res>
    implements $ApplicationMethodCopyWith<$Res> {
  factory _$$ApplicationMethodImplCopyWith(_$ApplicationMethodImpl value,
          $Res Function(_$ApplicationMethodImpl) then) =
      __$$ApplicationMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String method,
      String dosage,
      String timing,
      String frequency,
      List<String> mixingInstructions,
      String equipment,
      String waterRequirement});
}

/// @nodoc
class __$$ApplicationMethodImplCopyWithImpl<$Res>
    extends _$ApplicationMethodCopyWithImpl<$Res, _$ApplicationMethodImpl>
    implements _$$ApplicationMethodImplCopyWith<$Res> {
  __$$ApplicationMethodImplCopyWithImpl(_$ApplicationMethodImpl _value,
      $Res Function(_$ApplicationMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApplicationMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? dosage = null,
    Object? timing = null,
    Object? frequency = null,
    Object? mixingInstructions = null,
    Object? equipment = null,
    Object? waterRequirement = null,
  }) {
    return _then(_$ApplicationMethodImpl(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      timing: null == timing
          ? _value.timing
          : timing // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      mixingInstructions: null == mixingInstructions
          ? _value._mixingInstructions
          : mixingInstructions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      waterRequirement: null == waterRequirement
          ? _value.waterRequirement
          : waterRequirement // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationMethodImpl implements _ApplicationMethod {
  const _$ApplicationMethodImpl(
      {required this.method,
      required this.dosage,
      required this.timing,
      required this.frequency,
      required final List<String> mixingInstructions,
      required this.equipment,
      required this.waterRequirement})
      : _mixingInstructions = mixingInstructions;

  factory _$ApplicationMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationMethodImplFromJson(json);

  @override
  final String method;
  @override
  final String dosage;
  @override
  final String timing;
  @override
  final String frequency;
  final List<String> _mixingInstructions;
  @override
  List<String> get mixingInstructions {
    if (_mixingInstructions is EqualUnmodifiableListView)
      return _mixingInstructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mixingInstructions);
  }

  @override
  final String equipment;
  @override
  final String waterRequirement;

  @override
  String toString() {
    return 'ApplicationMethod(method: $method, dosage: $dosage, timing: $timing, frequency: $frequency, mixingInstructions: $mixingInstructions, equipment: $equipment, waterRequirement: $waterRequirement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationMethodImpl &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.timing, timing) || other.timing == timing) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            const DeepCollectionEquality()
                .equals(other._mixingInstructions, _mixingInstructions) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.waterRequirement, waterRequirement) ||
                other.waterRequirement == waterRequirement));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      method,
      dosage,
      timing,
      frequency,
      const DeepCollectionEquality().hash(_mixingInstructions),
      equipment,
      waterRequirement);

  /// Create a copy of ApplicationMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationMethodImplCopyWith<_$ApplicationMethodImpl> get copyWith =>
      __$$ApplicationMethodImplCopyWithImpl<_$ApplicationMethodImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationMethodImplToJson(
      this,
    );
  }
}

abstract class _ApplicationMethod implements ApplicationMethod {
  const factory _ApplicationMethod(
      {required final String method,
      required final String dosage,
      required final String timing,
      required final String frequency,
      required final List<String> mixingInstructions,
      required final String equipment,
      required final String waterRequirement}) = _$ApplicationMethodImpl;

  factory _ApplicationMethod.fromJson(Map<String, dynamic> json) =
      _$ApplicationMethodImpl.fromJson;

  @override
  String get method;
  @override
  String get dosage;
  @override
  String get timing;
  @override
  String get frequency;
  @override
  List<String> get mixingInstructions;
  @override
  String get equipment;
  @override
  String get waterRequirement;

  /// Create a copy of ApplicationMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplicationMethodImplCopyWith<_$ApplicationMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PesticideDetail _$PesticideDetailFromJson(Map<String, dynamic> json) {
  return _PesticideDetail.fromJson(json);
}

/// @nodoc
mixin _$PesticideDetail {
  String get id => throw _privateConstructorUsedError;
  PesticideType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get hindiName => throw _privateConstructorUsedError;
  String get activeIngredient => throw _privateConstructorUsedError;
  String get concentration => throw _privateConstructorUsedError;
  double get pricePerLiter => throw _privateConstructorUsedError;
  String get targetPests => throw _privateConstructorUsedError;
  List<String> get targetCrops => throw _privateConstructorUsedError;
  ApplicationMethod get application => throw _privateConstructorUsedError;
  SafetyInfo get safety => throw _privateConstructorUsedError;
  String get manufacturer => throw _privateConstructorUsedError;
  DateTime get expiryDate => throw _privateConstructorUsedError;
  String get registrationNumber => throw _privateConstructorUsedError;
  List<String> get restrictions => throw _privateConstructorUsedError;

  /// Serializes this PesticideDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PesticideDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PesticideDetailCopyWith<PesticideDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PesticideDetailCopyWith<$Res> {
  factory $PesticideDetailCopyWith(
          PesticideDetail value, $Res Function(PesticideDetail) then) =
      _$PesticideDetailCopyWithImpl<$Res, PesticideDetail>;
  @useResult
  $Res call(
      {String id,
      PesticideType type,
      String name,
      String hindiName,
      String activeIngredient,
      String concentration,
      double pricePerLiter,
      String targetPests,
      List<String> targetCrops,
      ApplicationMethod application,
      SafetyInfo safety,
      String manufacturer,
      DateTime expiryDate,
      String registrationNumber,
      List<String> restrictions});

  $ApplicationMethodCopyWith<$Res> get application;
  $SafetyInfoCopyWith<$Res> get safety;
}

/// @nodoc
class _$PesticideDetailCopyWithImpl<$Res, $Val extends PesticideDetail>
    implements $PesticideDetailCopyWith<$Res> {
  _$PesticideDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PesticideDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? hindiName = null,
    Object? activeIngredient = null,
    Object? concentration = null,
    Object? pricePerLiter = null,
    Object? targetPests = null,
    Object? targetCrops = null,
    Object? application = null,
    Object? safety = null,
    Object? manufacturer = null,
    Object? expiryDate = null,
    Object? registrationNumber = null,
    Object? restrictions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PesticideType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      activeIngredient: null == activeIngredient
          ? _value.activeIngredient
          : activeIngredient // ignore: cast_nullable_to_non_nullable
              as String,
      concentration: null == concentration
          ? _value.concentration
          : concentration // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerLiter: null == pricePerLiter
          ? _value.pricePerLiter
          : pricePerLiter // ignore: cast_nullable_to_non_nullable
              as double,
      targetPests: null == targetPests
          ? _value.targetPests
          : targetPests // ignore: cast_nullable_to_non_nullable
              as String,
      targetCrops: null == targetCrops
          ? _value.targetCrops
          : targetCrops // ignore: cast_nullable_to_non_nullable
              as List<String>,
      application: null == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationMethod,
      safety: null == safety
          ? _value.safety
          : safety // ignore: cast_nullable_to_non_nullable
              as SafetyInfo,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      registrationNumber: null == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      restrictions: null == restrictions
          ? _value.restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of PesticideDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApplicationMethodCopyWith<$Res> get application {
    return $ApplicationMethodCopyWith<$Res>(_value.application, (value) {
      return _then(_value.copyWith(application: value) as $Val);
    });
  }

  /// Create a copy of PesticideDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SafetyInfoCopyWith<$Res> get safety {
    return $SafetyInfoCopyWith<$Res>(_value.safety, (value) {
      return _then(_value.copyWith(safety: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PesticideDetailImplCopyWith<$Res>
    implements $PesticideDetailCopyWith<$Res> {
  factory _$$PesticideDetailImplCopyWith(_$PesticideDetailImpl value,
          $Res Function(_$PesticideDetailImpl) then) =
      __$$PesticideDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      PesticideType type,
      String name,
      String hindiName,
      String activeIngredient,
      String concentration,
      double pricePerLiter,
      String targetPests,
      List<String> targetCrops,
      ApplicationMethod application,
      SafetyInfo safety,
      String manufacturer,
      DateTime expiryDate,
      String registrationNumber,
      List<String> restrictions});

  @override
  $ApplicationMethodCopyWith<$Res> get application;
  @override
  $SafetyInfoCopyWith<$Res> get safety;
}

/// @nodoc
class __$$PesticideDetailImplCopyWithImpl<$Res>
    extends _$PesticideDetailCopyWithImpl<$Res, _$PesticideDetailImpl>
    implements _$$PesticideDetailImplCopyWith<$Res> {
  __$$PesticideDetailImplCopyWithImpl(
      _$PesticideDetailImpl _value, $Res Function(_$PesticideDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PesticideDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? hindiName = null,
    Object? activeIngredient = null,
    Object? concentration = null,
    Object? pricePerLiter = null,
    Object? targetPests = null,
    Object? targetCrops = null,
    Object? application = null,
    Object? safety = null,
    Object? manufacturer = null,
    Object? expiryDate = null,
    Object? registrationNumber = null,
    Object? restrictions = null,
  }) {
    return _then(_$PesticideDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PesticideType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      activeIngredient: null == activeIngredient
          ? _value.activeIngredient
          : activeIngredient // ignore: cast_nullable_to_non_nullable
              as String,
      concentration: null == concentration
          ? _value.concentration
          : concentration // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerLiter: null == pricePerLiter
          ? _value.pricePerLiter
          : pricePerLiter // ignore: cast_nullable_to_non_nullable
              as double,
      targetPests: null == targetPests
          ? _value.targetPests
          : targetPests // ignore: cast_nullable_to_non_nullable
              as String,
      targetCrops: null == targetCrops
          ? _value._targetCrops
          : targetCrops // ignore: cast_nullable_to_non_nullable
              as List<String>,
      application: null == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationMethod,
      safety: null == safety
          ? _value.safety
          : safety // ignore: cast_nullable_to_non_nullable
              as SafetyInfo,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      registrationNumber: null == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      restrictions: null == restrictions
          ? _value._restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PesticideDetailImpl implements _PesticideDetail {
  const _$PesticideDetailImpl(
      {required this.id,
      required this.type,
      required this.name,
      required this.hindiName,
      required this.activeIngredient,
      required this.concentration,
      required this.pricePerLiter,
      required this.targetPests,
      required final List<String> targetCrops,
      required this.application,
      required this.safety,
      required this.manufacturer,
      required this.expiryDate,
      required this.registrationNumber,
      final List<String> restrictions = const []})
      : _targetCrops = targetCrops,
        _restrictions = restrictions;

  factory _$PesticideDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PesticideDetailImplFromJson(json);

  @override
  final String id;
  @override
  final PesticideType type;
  @override
  final String name;
  @override
  final String hindiName;
  @override
  final String activeIngredient;
  @override
  final String concentration;
  @override
  final double pricePerLiter;
  @override
  final String targetPests;
  final List<String> _targetCrops;
  @override
  List<String> get targetCrops {
    if (_targetCrops is EqualUnmodifiableListView) return _targetCrops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetCrops);
  }

  @override
  final ApplicationMethod application;
  @override
  final SafetyInfo safety;
  @override
  final String manufacturer;
  @override
  final DateTime expiryDate;
  @override
  final String registrationNumber;
  final List<String> _restrictions;
  @override
  @JsonKey()
  List<String> get restrictions {
    if (_restrictions is EqualUnmodifiableListView) return _restrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restrictions);
  }

  @override
  String toString() {
    return 'PesticideDetail(id: $id, type: $type, name: $name, hindiName: $hindiName, activeIngredient: $activeIngredient, concentration: $concentration, pricePerLiter: $pricePerLiter, targetPests: $targetPests, targetCrops: $targetCrops, application: $application, safety: $safety, manufacturer: $manufacturer, expiryDate: $expiryDate, registrationNumber: $registrationNumber, restrictions: $restrictions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PesticideDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hindiName, hindiName) ||
                other.hindiName == hindiName) &&
            (identical(other.activeIngredient, activeIngredient) ||
                other.activeIngredient == activeIngredient) &&
            (identical(other.concentration, concentration) ||
                other.concentration == concentration) &&
            (identical(other.pricePerLiter, pricePerLiter) ||
                other.pricePerLiter == pricePerLiter) &&
            (identical(other.targetPests, targetPests) ||
                other.targetPests == targetPests) &&
            const DeepCollectionEquality()
                .equals(other._targetCrops, _targetCrops) &&
            (identical(other.application, application) ||
                other.application == application) &&
            (identical(other.safety, safety) || other.safety == safety) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.registrationNumber, registrationNumber) ||
                other.registrationNumber == registrationNumber) &&
            const DeepCollectionEquality()
                .equals(other._restrictions, _restrictions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      name,
      hindiName,
      activeIngredient,
      concentration,
      pricePerLiter,
      targetPests,
      const DeepCollectionEquality().hash(_targetCrops),
      application,
      safety,
      manufacturer,
      expiryDate,
      registrationNumber,
      const DeepCollectionEquality().hash(_restrictions));

  /// Create a copy of PesticideDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PesticideDetailImplCopyWith<_$PesticideDetailImpl> get copyWith =>
      __$$PesticideDetailImplCopyWithImpl<_$PesticideDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PesticideDetailImplToJson(
      this,
    );
  }
}

abstract class _PesticideDetail implements PesticideDetail {
  const factory _PesticideDetail(
      {required final String id,
      required final PesticideType type,
      required final String name,
      required final String hindiName,
      required final String activeIngredient,
      required final String concentration,
      required final double pricePerLiter,
      required final String targetPests,
      required final List<String> targetCrops,
      required final ApplicationMethod application,
      required final SafetyInfo safety,
      required final String manufacturer,
      required final DateTime expiryDate,
      required final String registrationNumber,
      final List<String> restrictions}) = _$PesticideDetailImpl;

  factory _PesticideDetail.fromJson(Map<String, dynamic> json) =
      _$PesticideDetailImpl.fromJson;

  @override
  String get id;
  @override
  PesticideType get type;
  @override
  String get name;
  @override
  String get hindiName;
  @override
  String get activeIngredient;
  @override
  String get concentration;
  @override
  double get pricePerLiter;
  @override
  String get targetPests;
  @override
  List<String> get targetCrops;
  @override
  ApplicationMethod get application;
  @override
  SafetyInfo get safety;
  @override
  String get manufacturer;
  @override
  DateTime get expiryDate;
  @override
  String get registrationNumber;
  @override
  List<String> get restrictions;

  /// Create a copy of PesticideDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PesticideDetailImplCopyWith<_$PesticideDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SafetyInfo _$SafetyInfoFromJson(Map<String, dynamic> json) {
  return _SafetyInfo.fromJson(json);
}

/// @nodoc
mixin _$SafetyInfo {
  String get toxicityClass => throw _privateConstructorUsedError;
  List<String> get precautions => throw _privateConstructorUsedError;
  String get protectiveEquipment => throw _privateConstructorUsedError;
  String get firstAid => throw _privateConstructorUsedError;
  String get environmentalImpact => throw _privateConstructorUsedError;
  int get preHarvestInterval => throw _privateConstructorUsedError;
  String get disposal => throw _privateConstructorUsedError;

  /// Serializes this SafetyInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SafetyInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SafetyInfoCopyWith<SafetyInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SafetyInfoCopyWith<$Res> {
  factory $SafetyInfoCopyWith(
          SafetyInfo value, $Res Function(SafetyInfo) then) =
      _$SafetyInfoCopyWithImpl<$Res, SafetyInfo>;
  @useResult
  $Res call(
      {String toxicityClass,
      List<String> precautions,
      String protectiveEquipment,
      String firstAid,
      String environmentalImpact,
      int preHarvestInterval,
      String disposal});
}

/// @nodoc
class _$SafetyInfoCopyWithImpl<$Res, $Val extends SafetyInfo>
    implements $SafetyInfoCopyWith<$Res> {
  _$SafetyInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SafetyInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toxicityClass = null,
    Object? precautions = null,
    Object? protectiveEquipment = null,
    Object? firstAid = null,
    Object? environmentalImpact = null,
    Object? preHarvestInterval = null,
    Object? disposal = null,
  }) {
    return _then(_value.copyWith(
      toxicityClass: null == toxicityClass
          ? _value.toxicityClass
          : toxicityClass // ignore: cast_nullable_to_non_nullable
              as String,
      precautions: null == precautions
          ? _value.precautions
          : precautions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      protectiveEquipment: null == protectiveEquipment
          ? _value.protectiveEquipment
          : protectiveEquipment // ignore: cast_nullable_to_non_nullable
              as String,
      firstAid: null == firstAid
          ? _value.firstAid
          : firstAid // ignore: cast_nullable_to_non_nullable
              as String,
      environmentalImpact: null == environmentalImpact
          ? _value.environmentalImpact
          : environmentalImpact // ignore: cast_nullable_to_non_nullable
              as String,
      preHarvestInterval: null == preHarvestInterval
          ? _value.preHarvestInterval
          : preHarvestInterval // ignore: cast_nullable_to_non_nullable
              as int,
      disposal: null == disposal
          ? _value.disposal
          : disposal // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SafetyInfoImplCopyWith<$Res>
    implements $SafetyInfoCopyWith<$Res> {
  factory _$$SafetyInfoImplCopyWith(
          _$SafetyInfoImpl value, $Res Function(_$SafetyInfoImpl) then) =
      __$$SafetyInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String toxicityClass,
      List<String> precautions,
      String protectiveEquipment,
      String firstAid,
      String environmentalImpact,
      int preHarvestInterval,
      String disposal});
}

/// @nodoc
class __$$SafetyInfoImplCopyWithImpl<$Res>
    extends _$SafetyInfoCopyWithImpl<$Res, _$SafetyInfoImpl>
    implements _$$SafetyInfoImplCopyWith<$Res> {
  __$$SafetyInfoImplCopyWithImpl(
      _$SafetyInfoImpl _value, $Res Function(_$SafetyInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SafetyInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toxicityClass = null,
    Object? precautions = null,
    Object? protectiveEquipment = null,
    Object? firstAid = null,
    Object? environmentalImpact = null,
    Object? preHarvestInterval = null,
    Object? disposal = null,
  }) {
    return _then(_$SafetyInfoImpl(
      toxicityClass: null == toxicityClass
          ? _value.toxicityClass
          : toxicityClass // ignore: cast_nullable_to_non_nullable
              as String,
      precautions: null == precautions
          ? _value._precautions
          : precautions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      protectiveEquipment: null == protectiveEquipment
          ? _value.protectiveEquipment
          : protectiveEquipment // ignore: cast_nullable_to_non_nullable
              as String,
      firstAid: null == firstAid
          ? _value.firstAid
          : firstAid // ignore: cast_nullable_to_non_nullable
              as String,
      environmentalImpact: null == environmentalImpact
          ? _value.environmentalImpact
          : environmentalImpact // ignore: cast_nullable_to_non_nullable
              as String,
      preHarvestInterval: null == preHarvestInterval
          ? _value.preHarvestInterval
          : preHarvestInterval // ignore: cast_nullable_to_non_nullable
              as int,
      disposal: null == disposal
          ? _value.disposal
          : disposal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SafetyInfoImpl implements _SafetyInfo {
  const _$SafetyInfoImpl(
      {required this.toxicityClass,
      required final List<String> precautions,
      required this.protectiveEquipment,
      required this.firstAid,
      required this.environmentalImpact,
      required this.preHarvestInterval,
      required this.disposal})
      : _precautions = precautions;

  factory _$SafetyInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SafetyInfoImplFromJson(json);

  @override
  final String toxicityClass;
  final List<String> _precautions;
  @override
  List<String> get precautions {
    if (_precautions is EqualUnmodifiableListView) return _precautions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_precautions);
  }

  @override
  final String protectiveEquipment;
  @override
  final String firstAid;
  @override
  final String environmentalImpact;
  @override
  final int preHarvestInterval;
  @override
  final String disposal;

  @override
  String toString() {
    return 'SafetyInfo(toxicityClass: $toxicityClass, precautions: $precautions, protectiveEquipment: $protectiveEquipment, firstAid: $firstAid, environmentalImpact: $environmentalImpact, preHarvestInterval: $preHarvestInterval, disposal: $disposal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SafetyInfoImpl &&
            (identical(other.toxicityClass, toxicityClass) ||
                other.toxicityClass == toxicityClass) &&
            const DeepCollectionEquality()
                .equals(other._precautions, _precautions) &&
            (identical(other.protectiveEquipment, protectiveEquipment) ||
                other.protectiveEquipment == protectiveEquipment) &&
            (identical(other.firstAid, firstAid) ||
                other.firstAid == firstAid) &&
            (identical(other.environmentalImpact, environmentalImpact) ||
                other.environmentalImpact == environmentalImpact) &&
            (identical(other.preHarvestInterval, preHarvestInterval) ||
                other.preHarvestInterval == preHarvestInterval) &&
            (identical(other.disposal, disposal) ||
                other.disposal == disposal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      toxicityClass,
      const DeepCollectionEquality().hash(_precautions),
      protectiveEquipment,
      firstAid,
      environmentalImpact,
      preHarvestInterval,
      disposal);

  /// Create a copy of SafetyInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SafetyInfoImplCopyWith<_$SafetyInfoImpl> get copyWith =>
      __$$SafetyInfoImplCopyWithImpl<_$SafetyInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SafetyInfoImplToJson(
      this,
    );
  }
}

abstract class _SafetyInfo implements SafetyInfo {
  const factory _SafetyInfo(
      {required final String toxicityClass,
      required final List<String> precautions,
      required final String protectiveEquipment,
      required final String firstAid,
      required final String environmentalImpact,
      required final int preHarvestInterval,
      required final String disposal}) = _$SafetyInfoImpl;

  factory _SafetyInfo.fromJson(Map<String, dynamic> json) =
      _$SafetyInfoImpl.fromJson;

  @override
  String get toxicityClass;
  @override
  List<String> get precautions;
  @override
  String get protectiveEquipment;
  @override
  String get firstAid;
  @override
  String get environmentalImpact;
  @override
  int get preHarvestInterval;
  @override
  String get disposal;

  /// Create a copy of SafetyInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SafetyInfoImplCopyWith<_$SafetyInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SeedDetail _$SeedDetailFromJson(Map<String, dynamic> json) {
  return _SeedDetail.fromJson(json);
}

/// @nodoc
mixin _$SeedDetail {
  String get id => throw _privateConstructorUsedError;
  SeedType get type => throw _privateConstructorUsedError;
  String get varietyName => throw _privateConstructorUsedError;
  String get hindiName => throw _privateConstructorUsedError;
  String get cropName => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  double get pricePerKg => throw _privateConstructorUsedError;
  String get packagingSize => throw _privateConstructorUsedError;
  SeedSpecifications get specifications => throw _privateConstructorUsedError;
  List<IndianState> get suitableStates => throw _privateConstructorUsedError;
  List<CropSeason> get suitableSeasons => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get productionDate => throw _privateConstructorUsedError;
  DateTime get expiryDate => throw _privateConstructorUsedError;
  List<String> get features => throw _privateConstructorUsedError;
  List<String> get benefits => throw _privateConstructorUsedError;

  /// Serializes this SeedDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeedDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeedDetailCopyWith<SeedDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeedDetailCopyWith<$Res> {
  factory $SeedDetailCopyWith(
          SeedDetail value, $Res Function(SeedDetail) then) =
      _$SeedDetailCopyWithImpl<$Res, SeedDetail>;
  @useResult
  $Res call(
      {String id,
      SeedType type,
      String varietyName,
      String hindiName,
      String cropName,
      String company,
      double pricePerKg,
      String packagingSize,
      SeedSpecifications specifications,
      List<IndianState> suitableStates,
      List<CropSeason> suitableSeasons,
      String description,
      DateTime productionDate,
      DateTime expiryDate,
      List<String> features,
      List<String> benefits});

  $SeedSpecificationsCopyWith<$Res> get specifications;
}

/// @nodoc
class _$SeedDetailCopyWithImpl<$Res, $Val extends SeedDetail>
    implements $SeedDetailCopyWith<$Res> {
  _$SeedDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeedDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? varietyName = null,
    Object? hindiName = null,
    Object? cropName = null,
    Object? company = null,
    Object? pricePerKg = null,
    Object? packagingSize = null,
    Object? specifications = null,
    Object? suitableStates = null,
    Object? suitableSeasons = null,
    Object? description = null,
    Object? productionDate = null,
    Object? expiryDate = null,
    Object? features = null,
    Object? benefits = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SeedType,
      varietyName: null == varietyName
          ? _value.varietyName
          : varietyName // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      cropName: null == cropName
          ? _value.cropName
          : cropName // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerKg: null == pricePerKg
          ? _value.pricePerKg
          : pricePerKg // ignore: cast_nullable_to_non_nullable
              as double,
      packagingSize: null == packagingSize
          ? _value.packagingSize
          : packagingSize // ignore: cast_nullable_to_non_nullable
              as String,
      specifications: null == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as SeedSpecifications,
      suitableStates: null == suitableStates
          ? _value.suitableStates
          : suitableStates // ignore: cast_nullable_to_non_nullable
              as List<IndianState>,
      suitableSeasons: null == suitableSeasons
          ? _value.suitableSeasons
          : suitableSeasons // ignore: cast_nullable_to_non_nullable
              as List<CropSeason>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      productionDate: null == productionDate
          ? _value.productionDate
          : productionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      benefits: null == benefits
          ? _value.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of SeedDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeedSpecificationsCopyWith<$Res> get specifications {
    return $SeedSpecificationsCopyWith<$Res>(_value.specifications, (value) {
      return _then(_value.copyWith(specifications: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SeedDetailImplCopyWith<$Res>
    implements $SeedDetailCopyWith<$Res> {
  factory _$$SeedDetailImplCopyWith(
          _$SeedDetailImpl value, $Res Function(_$SeedDetailImpl) then) =
      __$$SeedDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      SeedType type,
      String varietyName,
      String hindiName,
      String cropName,
      String company,
      double pricePerKg,
      String packagingSize,
      SeedSpecifications specifications,
      List<IndianState> suitableStates,
      List<CropSeason> suitableSeasons,
      String description,
      DateTime productionDate,
      DateTime expiryDate,
      List<String> features,
      List<String> benefits});

  @override
  $SeedSpecificationsCopyWith<$Res> get specifications;
}

/// @nodoc
class __$$SeedDetailImplCopyWithImpl<$Res>
    extends _$SeedDetailCopyWithImpl<$Res, _$SeedDetailImpl>
    implements _$$SeedDetailImplCopyWith<$Res> {
  __$$SeedDetailImplCopyWithImpl(
      _$SeedDetailImpl _value, $Res Function(_$SeedDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeedDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? varietyName = null,
    Object? hindiName = null,
    Object? cropName = null,
    Object? company = null,
    Object? pricePerKg = null,
    Object? packagingSize = null,
    Object? specifications = null,
    Object? suitableStates = null,
    Object? suitableSeasons = null,
    Object? description = null,
    Object? productionDate = null,
    Object? expiryDate = null,
    Object? features = null,
    Object? benefits = null,
  }) {
    return _then(_$SeedDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SeedType,
      varietyName: null == varietyName
          ? _value.varietyName
          : varietyName // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      cropName: null == cropName
          ? _value.cropName
          : cropName // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerKg: null == pricePerKg
          ? _value.pricePerKg
          : pricePerKg // ignore: cast_nullable_to_non_nullable
              as double,
      packagingSize: null == packagingSize
          ? _value.packagingSize
          : packagingSize // ignore: cast_nullable_to_non_nullable
              as String,
      specifications: null == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as SeedSpecifications,
      suitableStates: null == suitableStates
          ? _value._suitableStates
          : suitableStates // ignore: cast_nullable_to_non_nullable
              as List<IndianState>,
      suitableSeasons: null == suitableSeasons
          ? _value._suitableSeasons
          : suitableSeasons // ignore: cast_nullable_to_non_nullable
              as List<CropSeason>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      productionDate: null == productionDate
          ? _value.productionDate
          : productionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      benefits: null == benefits
          ? _value._benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeedDetailImpl implements _SeedDetail {
  const _$SeedDetailImpl(
      {required this.id,
      required this.type,
      required this.varietyName,
      required this.hindiName,
      required this.cropName,
      required this.company,
      required this.pricePerKg,
      required this.packagingSize,
      required this.specifications,
      required final List<IndianState> suitableStates,
      required final List<CropSeason> suitableSeasons,
      required this.description,
      required this.productionDate,
      required this.expiryDate,
      final List<String> features = const [],
      final List<String> benefits = const []})
      : _suitableStates = suitableStates,
        _suitableSeasons = suitableSeasons,
        _features = features,
        _benefits = benefits;

  factory _$SeedDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeedDetailImplFromJson(json);

  @override
  final String id;
  @override
  final SeedType type;
  @override
  final String varietyName;
  @override
  final String hindiName;
  @override
  final String cropName;
  @override
  final String company;
  @override
  final double pricePerKg;
  @override
  final String packagingSize;
  @override
  final SeedSpecifications specifications;
  final List<IndianState> _suitableStates;
  @override
  List<IndianState> get suitableStates {
    if (_suitableStates is EqualUnmodifiableListView) return _suitableStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suitableStates);
  }

  final List<CropSeason> _suitableSeasons;
  @override
  List<CropSeason> get suitableSeasons {
    if (_suitableSeasons is EqualUnmodifiableListView) return _suitableSeasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suitableSeasons);
  }

  @override
  final String description;
  @override
  final DateTime productionDate;
  @override
  final DateTime expiryDate;
  final List<String> _features;
  @override
  @JsonKey()
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  final List<String> _benefits;
  @override
  @JsonKey()
  List<String> get benefits {
    if (_benefits is EqualUnmodifiableListView) return _benefits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_benefits);
  }

  @override
  String toString() {
    return 'SeedDetail(id: $id, type: $type, varietyName: $varietyName, hindiName: $hindiName, cropName: $cropName, company: $company, pricePerKg: $pricePerKg, packagingSize: $packagingSize, specifications: $specifications, suitableStates: $suitableStates, suitableSeasons: $suitableSeasons, description: $description, productionDate: $productionDate, expiryDate: $expiryDate, features: $features, benefits: $benefits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeedDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.varietyName, varietyName) ||
                other.varietyName == varietyName) &&
            (identical(other.hindiName, hindiName) ||
                other.hindiName == hindiName) &&
            (identical(other.cropName, cropName) ||
                other.cropName == cropName) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.pricePerKg, pricePerKg) ||
                other.pricePerKg == pricePerKg) &&
            (identical(other.packagingSize, packagingSize) ||
                other.packagingSize == packagingSize) &&
            (identical(other.specifications, specifications) ||
                other.specifications == specifications) &&
            const DeepCollectionEquality()
                .equals(other._suitableStates, _suitableStates) &&
            const DeepCollectionEquality()
                .equals(other._suitableSeasons, _suitableSeasons) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.productionDate, productionDate) ||
                other.productionDate == productionDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            const DeepCollectionEquality().equals(other._benefits, _benefits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      varietyName,
      hindiName,
      cropName,
      company,
      pricePerKg,
      packagingSize,
      specifications,
      const DeepCollectionEquality().hash(_suitableStates),
      const DeepCollectionEquality().hash(_suitableSeasons),
      description,
      productionDate,
      expiryDate,
      const DeepCollectionEquality().hash(_features),
      const DeepCollectionEquality().hash(_benefits));

  /// Create a copy of SeedDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeedDetailImplCopyWith<_$SeedDetailImpl> get copyWith =>
      __$$SeedDetailImplCopyWithImpl<_$SeedDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeedDetailImplToJson(
      this,
    );
  }
}

abstract class _SeedDetail implements SeedDetail {
  const factory _SeedDetail(
      {required final String id,
      required final SeedType type,
      required final String varietyName,
      required final String hindiName,
      required final String cropName,
      required final String company,
      required final double pricePerKg,
      required final String packagingSize,
      required final SeedSpecifications specifications,
      required final List<IndianState> suitableStates,
      required final List<CropSeason> suitableSeasons,
      required final String description,
      required final DateTime productionDate,
      required final DateTime expiryDate,
      final List<String> features,
      final List<String> benefits}) = _$SeedDetailImpl;

  factory _SeedDetail.fromJson(Map<String, dynamic> json) =
      _$SeedDetailImpl.fromJson;

  @override
  String get id;
  @override
  SeedType get type;
  @override
  String get varietyName;
  @override
  String get hindiName;
  @override
  String get cropName;
  @override
  String get company;
  @override
  double get pricePerKg;
  @override
  String get packagingSize;
  @override
  SeedSpecifications get specifications;
  @override
  List<IndianState> get suitableStates;
  @override
  List<CropSeason> get suitableSeasons;
  @override
  String get description;
  @override
  DateTime get productionDate;
  @override
  DateTime get expiryDate;
  @override
  List<String> get features;
  @override
  List<String> get benefits;

  /// Create a copy of SeedDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeedDetailImplCopyWith<_$SeedDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SeedSpecifications _$SeedSpecificationsFromJson(Map<String, dynamic> json) {
  return _SeedSpecifications.fromJson(json);
}

/// @nodoc
mixin _$SeedSpecifications {
  double get germination => throw _privateConstructorUsedError;
  double get purity => throw _privateConstructorUsedError;
  double get moisture => throw _privateConstructorUsedError;
  int get maturityDays => throw _privateConstructorUsedError;
  double get yieldPotential => throw _privateConstructorUsedError;
  String get resistance => throw _privateConstructorUsedError;
  String get plantHeight => throw _privateConstructorUsedError;
  String get fruitSize => throw _privateConstructorUsedError;
  String get specialFeatures => throw _privateConstructorUsedError;

  /// Serializes this SeedSpecifications to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeedSpecifications
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeedSpecificationsCopyWith<SeedSpecifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeedSpecificationsCopyWith<$Res> {
  factory $SeedSpecificationsCopyWith(
          SeedSpecifications value, $Res Function(SeedSpecifications) then) =
      _$SeedSpecificationsCopyWithImpl<$Res, SeedSpecifications>;
  @useResult
  $Res call(
      {double germination,
      double purity,
      double moisture,
      int maturityDays,
      double yieldPotential,
      String resistance,
      String plantHeight,
      String fruitSize,
      String specialFeatures});
}

/// @nodoc
class _$SeedSpecificationsCopyWithImpl<$Res, $Val extends SeedSpecifications>
    implements $SeedSpecificationsCopyWith<$Res> {
  _$SeedSpecificationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeedSpecifications
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? germination = null,
    Object? purity = null,
    Object? moisture = null,
    Object? maturityDays = null,
    Object? yieldPotential = null,
    Object? resistance = null,
    Object? plantHeight = null,
    Object? fruitSize = null,
    Object? specialFeatures = null,
  }) {
    return _then(_value.copyWith(
      germination: null == germination
          ? _value.germination
          : germination // ignore: cast_nullable_to_non_nullable
              as double,
      purity: null == purity
          ? _value.purity
          : purity // ignore: cast_nullable_to_non_nullable
              as double,
      moisture: null == moisture
          ? _value.moisture
          : moisture // ignore: cast_nullable_to_non_nullable
              as double,
      maturityDays: null == maturityDays
          ? _value.maturityDays
          : maturityDays // ignore: cast_nullable_to_non_nullable
              as int,
      yieldPotential: null == yieldPotential
          ? _value.yieldPotential
          : yieldPotential // ignore: cast_nullable_to_non_nullable
              as double,
      resistance: null == resistance
          ? _value.resistance
          : resistance // ignore: cast_nullable_to_non_nullable
              as String,
      plantHeight: null == plantHeight
          ? _value.plantHeight
          : plantHeight // ignore: cast_nullable_to_non_nullable
              as String,
      fruitSize: null == fruitSize
          ? _value.fruitSize
          : fruitSize // ignore: cast_nullable_to_non_nullable
              as String,
      specialFeatures: null == specialFeatures
          ? _value.specialFeatures
          : specialFeatures // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeedSpecificationsImplCopyWith<$Res>
    implements $SeedSpecificationsCopyWith<$Res> {
  factory _$$SeedSpecificationsImplCopyWith(_$SeedSpecificationsImpl value,
          $Res Function(_$SeedSpecificationsImpl) then) =
      __$$SeedSpecificationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double germination,
      double purity,
      double moisture,
      int maturityDays,
      double yieldPotential,
      String resistance,
      String plantHeight,
      String fruitSize,
      String specialFeatures});
}

/// @nodoc
class __$$SeedSpecificationsImplCopyWithImpl<$Res>
    extends _$SeedSpecificationsCopyWithImpl<$Res, _$SeedSpecificationsImpl>
    implements _$$SeedSpecificationsImplCopyWith<$Res> {
  __$$SeedSpecificationsImplCopyWithImpl(_$SeedSpecificationsImpl _value,
      $Res Function(_$SeedSpecificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeedSpecifications
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? germination = null,
    Object? purity = null,
    Object? moisture = null,
    Object? maturityDays = null,
    Object? yieldPotential = null,
    Object? resistance = null,
    Object? plantHeight = null,
    Object? fruitSize = null,
    Object? specialFeatures = null,
  }) {
    return _then(_$SeedSpecificationsImpl(
      germination: null == germination
          ? _value.germination
          : germination // ignore: cast_nullable_to_non_nullable
              as double,
      purity: null == purity
          ? _value.purity
          : purity // ignore: cast_nullable_to_non_nullable
              as double,
      moisture: null == moisture
          ? _value.moisture
          : moisture // ignore: cast_nullable_to_non_nullable
              as double,
      maturityDays: null == maturityDays
          ? _value.maturityDays
          : maturityDays // ignore: cast_nullable_to_non_nullable
              as int,
      yieldPotential: null == yieldPotential
          ? _value.yieldPotential
          : yieldPotential // ignore: cast_nullable_to_non_nullable
              as double,
      resistance: null == resistance
          ? _value.resistance
          : resistance // ignore: cast_nullable_to_non_nullable
              as String,
      plantHeight: null == plantHeight
          ? _value.plantHeight
          : plantHeight // ignore: cast_nullable_to_non_nullable
              as String,
      fruitSize: null == fruitSize
          ? _value.fruitSize
          : fruitSize // ignore: cast_nullable_to_non_nullable
              as String,
      specialFeatures: null == specialFeatures
          ? _value.specialFeatures
          : specialFeatures // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeedSpecificationsImpl implements _SeedSpecifications {
  const _$SeedSpecificationsImpl(
      {required this.germination,
      required this.purity,
      required this.moisture,
      required this.maturityDays,
      required this.yieldPotential,
      required this.resistance,
      required this.plantHeight,
      required this.fruitSize,
      required this.specialFeatures});

  factory _$SeedSpecificationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeedSpecificationsImplFromJson(json);

  @override
  final double germination;
  @override
  final double purity;
  @override
  final double moisture;
  @override
  final int maturityDays;
  @override
  final double yieldPotential;
  @override
  final String resistance;
  @override
  final String plantHeight;
  @override
  final String fruitSize;
  @override
  final String specialFeatures;

  @override
  String toString() {
    return 'SeedSpecifications(germination: $germination, purity: $purity, moisture: $moisture, maturityDays: $maturityDays, yieldPotential: $yieldPotential, resistance: $resistance, plantHeight: $plantHeight, fruitSize: $fruitSize, specialFeatures: $specialFeatures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeedSpecificationsImpl &&
            (identical(other.germination, germination) ||
                other.germination == germination) &&
            (identical(other.purity, purity) || other.purity == purity) &&
            (identical(other.moisture, moisture) ||
                other.moisture == moisture) &&
            (identical(other.maturityDays, maturityDays) ||
                other.maturityDays == maturityDays) &&
            (identical(other.yieldPotential, yieldPotential) ||
                other.yieldPotential == yieldPotential) &&
            (identical(other.resistance, resistance) ||
                other.resistance == resistance) &&
            (identical(other.plantHeight, plantHeight) ||
                other.plantHeight == plantHeight) &&
            (identical(other.fruitSize, fruitSize) ||
                other.fruitSize == fruitSize) &&
            (identical(other.specialFeatures, specialFeatures) ||
                other.specialFeatures == specialFeatures));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      germination,
      purity,
      moisture,
      maturityDays,
      yieldPotential,
      resistance,
      plantHeight,
      fruitSize,
      specialFeatures);

  /// Create a copy of SeedSpecifications
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeedSpecificationsImplCopyWith<_$SeedSpecificationsImpl> get copyWith =>
      __$$SeedSpecificationsImplCopyWithImpl<_$SeedSpecificationsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeedSpecificationsImplToJson(
      this,
    );
  }
}

abstract class _SeedSpecifications implements SeedSpecifications {
  const factory _SeedSpecifications(
      {required final double germination,
      required final double purity,
      required final double moisture,
      required final int maturityDays,
      required final double yieldPotential,
      required final String resistance,
      required final String plantHeight,
      required final String fruitSize,
      required final String specialFeatures}) = _$SeedSpecificationsImpl;

  factory _SeedSpecifications.fromJson(Map<String, dynamic> json) =
      _$SeedSpecificationsImpl.fromJson;

  @override
  double get germination;
  @override
  double get purity;
  @override
  double get moisture;
  @override
  int get maturityDays;
  @override
  double get yieldPotential;
  @override
  String get resistance;
  @override
  String get plantHeight;
  @override
  String get fruitSize;
  @override
  String get specialFeatures;

  /// Create a copy of SeedSpecifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeedSpecificationsImplCopyWith<_$SeedSpecificationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LivestockDetail _$LivestockDetailFromJson(Map<String, dynamic> json) {
  return _LivestockDetail.fromJson(json);
}

/// @nodoc
mixin _$LivestockDetail {
  String get id => throw _privateConstructorUsedError;
  LivestockType get type => throw _privateConstructorUsedError;
  String get breed => throw _privateConstructorUsedError;
  String get hindiName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get averageWeight => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  String get healthStatus => throw _privateConstructorUsedError;
  FeedingInfo get feeding => throw _privateConstructorUsedError;
  VaccinationSchedule get vaccination => throw _privateConstructorUsedError;
  BreedingInfo get breeding => throw _privateConstructorUsedError;
  ProductionInfo get production => throw _privateConstructorUsedError;
  List<HealthRecord> get healthRecords => throw _privateConstructorUsedError;
  List<ProductionRecord> get productionRecords =>
      throw _privateConstructorUsedError;

  /// Serializes this LivestockDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LivestockDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LivestockDetailCopyWith<LivestockDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivestockDetailCopyWith<$Res> {
  factory $LivestockDetailCopyWith(
          LivestockDetail value, $Res Function(LivestockDetail) then) =
      _$LivestockDetailCopyWithImpl<$Res, LivestockDetail>;
  @useResult
  $Res call(
      {String id,
      LivestockType type,
      String breed,
      String hindiName,
      int quantity,
      double averageWeight,
      String age,
      String healthStatus,
      FeedingInfo feeding,
      VaccinationSchedule vaccination,
      BreedingInfo breeding,
      ProductionInfo production,
      List<HealthRecord> healthRecords,
      List<ProductionRecord> productionRecords});

  $FeedingInfoCopyWith<$Res> get feeding;
  $VaccinationScheduleCopyWith<$Res> get vaccination;
  $BreedingInfoCopyWith<$Res> get breeding;
  $ProductionInfoCopyWith<$Res> get production;
}

/// @nodoc
class _$LivestockDetailCopyWithImpl<$Res, $Val extends LivestockDetail>
    implements $LivestockDetailCopyWith<$Res> {
  _$LivestockDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LivestockDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? breed = null,
    Object? hindiName = null,
    Object? quantity = null,
    Object? averageWeight = null,
    Object? age = null,
    Object? healthStatus = null,
    Object? feeding = null,
    Object? vaccination = null,
    Object? breeding = null,
    Object? production = null,
    Object? healthRecords = null,
    Object? productionRecords = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LivestockType,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      averageWeight: null == averageWeight
          ? _value.averageWeight
          : averageWeight // ignore: cast_nullable_to_non_nullable
              as double,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      healthStatus: null == healthStatus
          ? _value.healthStatus
          : healthStatus // ignore: cast_nullable_to_non_nullable
              as String,
      feeding: null == feeding
          ? _value.feeding
          : feeding // ignore: cast_nullable_to_non_nullable
              as FeedingInfo,
      vaccination: null == vaccination
          ? _value.vaccination
          : vaccination // ignore: cast_nullable_to_non_nullable
              as VaccinationSchedule,
      breeding: null == breeding
          ? _value.breeding
          : breeding // ignore: cast_nullable_to_non_nullable
              as BreedingInfo,
      production: null == production
          ? _value.production
          : production // ignore: cast_nullable_to_non_nullable
              as ProductionInfo,
      healthRecords: null == healthRecords
          ? _value.healthRecords
          : healthRecords // ignore: cast_nullable_to_non_nullable
              as List<HealthRecord>,
      productionRecords: null == productionRecords
          ? _value.productionRecords
          : productionRecords // ignore: cast_nullable_to_non_nullable
              as List<ProductionRecord>,
    ) as $Val);
  }

  /// Create a copy of LivestockDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeedingInfoCopyWith<$Res> get feeding {
    return $FeedingInfoCopyWith<$Res>(_value.feeding, (value) {
      return _then(_value.copyWith(feeding: value) as $Val);
    });
  }

  /// Create a copy of LivestockDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VaccinationScheduleCopyWith<$Res> get vaccination {
    return $VaccinationScheduleCopyWith<$Res>(_value.vaccination, (value) {
      return _then(_value.copyWith(vaccination: value) as $Val);
    });
  }

  /// Create a copy of LivestockDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BreedingInfoCopyWith<$Res> get breeding {
    return $BreedingInfoCopyWith<$Res>(_value.breeding, (value) {
      return _then(_value.copyWith(breeding: value) as $Val);
    });
  }

  /// Create a copy of LivestockDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductionInfoCopyWith<$Res> get production {
    return $ProductionInfoCopyWith<$Res>(_value.production, (value) {
      return _then(_value.copyWith(production: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LivestockDetailImplCopyWith<$Res>
    implements $LivestockDetailCopyWith<$Res> {
  factory _$$LivestockDetailImplCopyWith(_$LivestockDetailImpl value,
          $Res Function(_$LivestockDetailImpl) then) =
      __$$LivestockDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      LivestockType type,
      String breed,
      String hindiName,
      int quantity,
      double averageWeight,
      String age,
      String healthStatus,
      FeedingInfo feeding,
      VaccinationSchedule vaccination,
      BreedingInfo breeding,
      ProductionInfo production,
      List<HealthRecord> healthRecords,
      List<ProductionRecord> productionRecords});

  @override
  $FeedingInfoCopyWith<$Res> get feeding;
  @override
  $VaccinationScheduleCopyWith<$Res> get vaccination;
  @override
  $BreedingInfoCopyWith<$Res> get breeding;
  @override
  $ProductionInfoCopyWith<$Res> get production;
}

/// @nodoc
class __$$LivestockDetailImplCopyWithImpl<$Res>
    extends _$LivestockDetailCopyWithImpl<$Res, _$LivestockDetailImpl>
    implements _$$LivestockDetailImplCopyWith<$Res> {
  __$$LivestockDetailImplCopyWithImpl(
      _$LivestockDetailImpl _value, $Res Function(_$LivestockDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of LivestockDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? breed = null,
    Object? hindiName = null,
    Object? quantity = null,
    Object? averageWeight = null,
    Object? age = null,
    Object? healthStatus = null,
    Object? feeding = null,
    Object? vaccination = null,
    Object? breeding = null,
    Object? production = null,
    Object? healthRecords = null,
    Object? productionRecords = null,
  }) {
    return _then(_$LivestockDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LivestockType,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      hindiName: null == hindiName
          ? _value.hindiName
          : hindiName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      averageWeight: null == averageWeight
          ? _value.averageWeight
          : averageWeight // ignore: cast_nullable_to_non_nullable
              as double,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      healthStatus: null == healthStatus
          ? _value.healthStatus
          : healthStatus // ignore: cast_nullable_to_non_nullable
              as String,
      feeding: null == feeding
          ? _value.feeding
          : feeding // ignore: cast_nullable_to_non_nullable
              as FeedingInfo,
      vaccination: null == vaccination
          ? _value.vaccination
          : vaccination // ignore: cast_nullable_to_non_nullable
              as VaccinationSchedule,
      breeding: null == breeding
          ? _value.breeding
          : breeding // ignore: cast_nullable_to_non_nullable
              as BreedingInfo,
      production: null == production
          ? _value.production
          : production // ignore: cast_nullable_to_non_nullable
              as ProductionInfo,
      healthRecords: null == healthRecords
          ? _value._healthRecords
          : healthRecords // ignore: cast_nullable_to_non_nullable
              as List<HealthRecord>,
      productionRecords: null == productionRecords
          ? _value._productionRecords
          : productionRecords // ignore: cast_nullable_to_non_nullable
              as List<ProductionRecord>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LivestockDetailImpl implements _LivestockDetail {
  const _$LivestockDetailImpl(
      {required this.id,
      required this.type,
      required this.breed,
      required this.hindiName,
      required this.quantity,
      required this.averageWeight,
      required this.age,
      required this.healthStatus,
      required this.feeding,
      required this.vaccination,
      required this.breeding,
      required this.production,
      final List<HealthRecord> healthRecords = const [],
      final List<ProductionRecord> productionRecords = const []})
      : _healthRecords = healthRecords,
        _productionRecords = productionRecords;

  factory _$LivestockDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$LivestockDetailImplFromJson(json);

  @override
  final String id;
  @override
  final LivestockType type;
  @override
  final String breed;
  @override
  final String hindiName;
  @override
  final int quantity;
  @override
  final double averageWeight;
  @override
  final String age;
  @override
  final String healthStatus;
  @override
  final FeedingInfo feeding;
  @override
  final VaccinationSchedule vaccination;
  @override
  final BreedingInfo breeding;
  @override
  final ProductionInfo production;
  final List<HealthRecord> _healthRecords;
  @override
  @JsonKey()
  List<HealthRecord> get healthRecords {
    if (_healthRecords is EqualUnmodifiableListView) return _healthRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_healthRecords);
  }

  final List<ProductionRecord> _productionRecords;
  @override
  @JsonKey()
  List<ProductionRecord> get productionRecords {
    if (_productionRecords is EqualUnmodifiableListView)
      return _productionRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productionRecords);
  }

  @override
  String toString() {
    return 'LivestockDetail(id: $id, type: $type, breed: $breed, hindiName: $hindiName, quantity: $quantity, averageWeight: $averageWeight, age: $age, healthStatus: $healthStatus, feeding: $feeding, vaccination: $vaccination, breeding: $breeding, production: $production, healthRecords: $healthRecords, productionRecords: $productionRecords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivestockDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.hindiName, hindiName) ||
                other.hindiName == hindiName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.averageWeight, averageWeight) ||
                other.averageWeight == averageWeight) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.healthStatus, healthStatus) ||
                other.healthStatus == healthStatus) &&
            (identical(other.feeding, feeding) || other.feeding == feeding) &&
            (identical(other.vaccination, vaccination) ||
                other.vaccination == vaccination) &&
            (identical(other.breeding, breeding) ||
                other.breeding == breeding) &&
            (identical(other.production, production) ||
                other.production == production) &&
            const DeepCollectionEquality()
                .equals(other._healthRecords, _healthRecords) &&
            const DeepCollectionEquality()
                .equals(other._productionRecords, _productionRecords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      breed,
      hindiName,
      quantity,
      averageWeight,
      age,
      healthStatus,
      feeding,
      vaccination,
      breeding,
      production,
      const DeepCollectionEquality().hash(_healthRecords),
      const DeepCollectionEquality().hash(_productionRecords));

  /// Create a copy of LivestockDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LivestockDetailImplCopyWith<_$LivestockDetailImpl> get copyWith =>
      __$$LivestockDetailImplCopyWithImpl<_$LivestockDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LivestockDetailImplToJson(
      this,
    );
  }
}

abstract class _LivestockDetail implements LivestockDetail {
  const factory _LivestockDetail(
      {required final String id,
      required final LivestockType type,
      required final String breed,
      required final String hindiName,
      required final int quantity,
      required final double averageWeight,
      required final String age,
      required final String healthStatus,
      required final FeedingInfo feeding,
      required final VaccinationSchedule vaccination,
      required final BreedingInfo breeding,
      required final ProductionInfo production,
      final List<HealthRecord> healthRecords,
      final List<ProductionRecord> productionRecords}) = _$LivestockDetailImpl;

  factory _LivestockDetail.fromJson(Map<String, dynamic> json) =
      _$LivestockDetailImpl.fromJson;

  @override
  String get id;
  @override
  LivestockType get type;
  @override
  String get breed;
  @override
  String get hindiName;
  @override
  int get quantity;
  @override
  double get averageWeight;
  @override
  String get age;
  @override
  String get healthStatus;
  @override
  FeedingInfo get feeding;
  @override
  VaccinationSchedule get vaccination;
  @override
  BreedingInfo get breeding;
  @override
  ProductionInfo get production;
  @override
  List<HealthRecord> get healthRecords;
  @override
  List<ProductionRecord> get productionRecords;

  /// Create a copy of LivestockDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LivestockDetailImplCopyWith<_$LivestockDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedingInfo _$FeedingInfoFromJson(Map<String, dynamic> json) {
  return _FeedingInfo.fromJson(json);
}

/// @nodoc
mixin _$FeedingInfo {
  List<String> get feedTypes => throw _privateConstructorUsedError;
  double get dailyFeedKg => throw _privateConstructorUsedError;
  String get feedingSchedule => throw _privateConstructorUsedError;
  double get waterRequirement => throw _privateConstructorUsedError;
  List<String> get supplements => throw _privateConstructorUsedError;
  double get feedCostPerDay => throw _privateConstructorUsedError;

  /// Serializes this FeedingInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedingInfoCopyWith<FeedingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedingInfoCopyWith<$Res> {
  factory $FeedingInfoCopyWith(
          FeedingInfo value, $Res Function(FeedingInfo) then) =
      _$FeedingInfoCopyWithImpl<$Res, FeedingInfo>;
  @useResult
  $Res call(
      {List<String> feedTypes,
      double dailyFeedKg,
      String feedingSchedule,
      double waterRequirement,
      List<String> supplements,
      double feedCostPerDay});
}

/// @nodoc
class _$FeedingInfoCopyWithImpl<$Res, $Val extends FeedingInfo>
    implements $FeedingInfoCopyWith<$Res> {
  _$FeedingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedTypes = null,
    Object? dailyFeedKg = null,
    Object? feedingSchedule = null,
    Object? waterRequirement = null,
    Object? supplements = null,
    Object? feedCostPerDay = null,
  }) {
    return _then(_value.copyWith(
      feedTypes: null == feedTypes
          ? _value.feedTypes
          : feedTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dailyFeedKg: null == dailyFeedKg
          ? _value.dailyFeedKg
          : dailyFeedKg // ignore: cast_nullable_to_non_nullable
              as double,
      feedingSchedule: null == feedingSchedule
          ? _value.feedingSchedule
          : feedingSchedule // ignore: cast_nullable_to_non_nullable
              as String,
      waterRequirement: null == waterRequirement
          ? _value.waterRequirement
          : waterRequirement // ignore: cast_nullable_to_non_nullable
              as double,
      supplements: null == supplements
          ? _value.supplements
          : supplements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      feedCostPerDay: null == feedCostPerDay
          ? _value.feedCostPerDay
          : feedCostPerDay // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedingInfoImplCopyWith<$Res>
    implements $FeedingInfoCopyWith<$Res> {
  factory _$$FeedingInfoImplCopyWith(
          _$FeedingInfoImpl value, $Res Function(_$FeedingInfoImpl) then) =
      __$$FeedingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> feedTypes,
      double dailyFeedKg,
      String feedingSchedule,
      double waterRequirement,
      List<String> supplements,
      double feedCostPerDay});
}

/// @nodoc
class __$$FeedingInfoImplCopyWithImpl<$Res>
    extends _$FeedingInfoCopyWithImpl<$Res, _$FeedingInfoImpl>
    implements _$$FeedingInfoImplCopyWith<$Res> {
  __$$FeedingInfoImplCopyWithImpl(
      _$FeedingInfoImpl _value, $Res Function(_$FeedingInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedTypes = null,
    Object? dailyFeedKg = null,
    Object? feedingSchedule = null,
    Object? waterRequirement = null,
    Object? supplements = null,
    Object? feedCostPerDay = null,
  }) {
    return _then(_$FeedingInfoImpl(
      feedTypes: null == feedTypes
          ? _value._feedTypes
          : feedTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dailyFeedKg: null == dailyFeedKg
          ? _value.dailyFeedKg
          : dailyFeedKg // ignore: cast_nullable_to_non_nullable
              as double,
      feedingSchedule: null == feedingSchedule
          ? _value.feedingSchedule
          : feedingSchedule // ignore: cast_nullable_to_non_nullable
              as String,
      waterRequirement: null == waterRequirement
          ? _value.waterRequirement
          : waterRequirement // ignore: cast_nullable_to_non_nullable
              as double,
      supplements: null == supplements
          ? _value._supplements
          : supplements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      feedCostPerDay: null == feedCostPerDay
          ? _value.feedCostPerDay
          : feedCostPerDay // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedingInfoImpl implements _FeedingInfo {
  const _$FeedingInfoImpl(
      {required final List<String> feedTypes,
      required this.dailyFeedKg,
      required this.feedingSchedule,
      required this.waterRequirement,
      required final List<String> supplements,
      required this.feedCostPerDay})
      : _feedTypes = feedTypes,
        _supplements = supplements;

  factory _$FeedingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedingInfoImplFromJson(json);

  final List<String> _feedTypes;
  @override
  List<String> get feedTypes {
    if (_feedTypes is EqualUnmodifiableListView) return _feedTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feedTypes);
  }

  @override
  final double dailyFeedKg;
  @override
  final String feedingSchedule;
  @override
  final double waterRequirement;
  final List<String> _supplements;
  @override
  List<String> get supplements {
    if (_supplements is EqualUnmodifiableListView) return _supplements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supplements);
  }

  @override
  final double feedCostPerDay;

  @override
  String toString() {
    return 'FeedingInfo(feedTypes: $feedTypes, dailyFeedKg: $dailyFeedKg, feedingSchedule: $feedingSchedule, waterRequirement: $waterRequirement, supplements: $supplements, feedCostPerDay: $feedCostPerDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedingInfoImpl &&
            const DeepCollectionEquality()
                .equals(other._feedTypes, _feedTypes) &&
            (identical(other.dailyFeedKg, dailyFeedKg) ||
                other.dailyFeedKg == dailyFeedKg) &&
            (identical(other.feedingSchedule, feedingSchedule) ||
                other.feedingSchedule == feedingSchedule) &&
            (identical(other.waterRequirement, waterRequirement) ||
                other.waterRequirement == waterRequirement) &&
            const DeepCollectionEquality()
                .equals(other._supplements, _supplements) &&
            (identical(other.feedCostPerDay, feedCostPerDay) ||
                other.feedCostPerDay == feedCostPerDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_feedTypes),
      dailyFeedKg,
      feedingSchedule,
      waterRequirement,
      const DeepCollectionEquality().hash(_supplements),
      feedCostPerDay);

  /// Create a copy of FeedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedingInfoImplCopyWith<_$FeedingInfoImpl> get copyWith =>
      __$$FeedingInfoImplCopyWithImpl<_$FeedingInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedingInfoImplToJson(
      this,
    );
  }
}

abstract class _FeedingInfo implements FeedingInfo {
  const factory _FeedingInfo(
      {required final List<String> feedTypes,
      required final double dailyFeedKg,
      required final String feedingSchedule,
      required final double waterRequirement,
      required final List<String> supplements,
      required final double feedCostPerDay}) = _$FeedingInfoImpl;

  factory _FeedingInfo.fromJson(Map<String, dynamic> json) =
      _$FeedingInfoImpl.fromJson;

  @override
  List<String> get feedTypes;
  @override
  double get dailyFeedKg;
  @override
  String get feedingSchedule;
  @override
  double get waterRequirement;
  @override
  List<String> get supplements;
  @override
  double get feedCostPerDay;

  /// Create a copy of FeedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedingInfoImplCopyWith<_$FeedingInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VaccinationSchedule _$VaccinationScheduleFromJson(Map<String, dynamic> json) {
  return _VaccinationSchedule.fromJson(json);
}

/// @nodoc
mixin _$VaccinationSchedule {
  List<VaccineRecord> get vaccines => throw _privateConstructorUsedError;
  List<String> get deworming => throw _privateConstructorUsedError;
  String get healthCheckup => throw _privateConstructorUsedError;

  /// Serializes this VaccinationSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccinationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccinationScheduleCopyWith<VaccinationSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccinationScheduleCopyWith<$Res> {
  factory $VaccinationScheduleCopyWith(
          VaccinationSchedule value, $Res Function(VaccinationSchedule) then) =
      _$VaccinationScheduleCopyWithImpl<$Res, VaccinationSchedule>;
  @useResult
  $Res call(
      {List<VaccineRecord> vaccines,
      List<String> deworming,
      String healthCheckup});
}

/// @nodoc
class _$VaccinationScheduleCopyWithImpl<$Res, $Val extends VaccinationSchedule>
    implements $VaccinationScheduleCopyWith<$Res> {
  _$VaccinationScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccinationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaccines = null,
    Object? deworming = null,
    Object? healthCheckup = null,
  }) {
    return _then(_value.copyWith(
      vaccines: null == vaccines
          ? _value.vaccines
          : vaccines // ignore: cast_nullable_to_non_nullable
              as List<VaccineRecord>,
      deworming: null == deworming
          ? _value.deworming
          : deworming // ignore: cast_nullable_to_non_nullable
              as List<String>,
      healthCheckup: null == healthCheckup
          ? _value.healthCheckup
          : healthCheckup // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VaccinationScheduleImplCopyWith<$Res>
    implements $VaccinationScheduleCopyWith<$Res> {
  factory _$$VaccinationScheduleImplCopyWith(_$VaccinationScheduleImpl value,
          $Res Function(_$VaccinationScheduleImpl) then) =
      __$$VaccinationScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<VaccineRecord> vaccines,
      List<String> deworming,
      String healthCheckup});
}

/// @nodoc
class __$$VaccinationScheduleImplCopyWithImpl<$Res>
    extends _$VaccinationScheduleCopyWithImpl<$Res, _$VaccinationScheduleImpl>
    implements _$$VaccinationScheduleImplCopyWith<$Res> {
  __$$VaccinationScheduleImplCopyWithImpl(_$VaccinationScheduleImpl _value,
      $Res Function(_$VaccinationScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccinationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaccines = null,
    Object? deworming = null,
    Object? healthCheckup = null,
  }) {
    return _then(_$VaccinationScheduleImpl(
      vaccines: null == vaccines
          ? _value._vaccines
          : vaccines // ignore: cast_nullable_to_non_nullable
              as List<VaccineRecord>,
      deworming: null == deworming
          ? _value._deworming
          : deworming // ignore: cast_nullable_to_non_nullable
              as List<String>,
      healthCheckup: null == healthCheckup
          ? _value.healthCheckup
          : healthCheckup // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VaccinationScheduleImpl implements _VaccinationSchedule {
  const _$VaccinationScheduleImpl(
      {required final List<VaccineRecord> vaccines,
      required final List<String> deworming,
      required this.healthCheckup})
      : _vaccines = vaccines,
        _deworming = deworming;

  factory _$VaccinationScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaccinationScheduleImplFromJson(json);

  final List<VaccineRecord> _vaccines;
  @override
  List<VaccineRecord> get vaccines {
    if (_vaccines is EqualUnmodifiableListView) return _vaccines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vaccines);
  }

  final List<String> _deworming;
  @override
  List<String> get deworming {
    if (_deworming is EqualUnmodifiableListView) return _deworming;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deworming);
  }

  @override
  final String healthCheckup;

  @override
  String toString() {
    return 'VaccinationSchedule(vaccines: $vaccines, deworming: $deworming, healthCheckup: $healthCheckup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccinationScheduleImpl &&
            const DeepCollectionEquality().equals(other._vaccines, _vaccines) &&
            const DeepCollectionEquality()
                .equals(other._deworming, _deworming) &&
            (identical(other.healthCheckup, healthCheckup) ||
                other.healthCheckup == healthCheckup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_vaccines),
      const DeepCollectionEquality().hash(_deworming),
      healthCheckup);

  /// Create a copy of VaccinationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccinationScheduleImplCopyWith<_$VaccinationScheduleImpl> get copyWith =>
      __$$VaccinationScheduleImplCopyWithImpl<_$VaccinationScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccinationScheduleImplToJson(
      this,
    );
  }
}

abstract class _VaccinationSchedule implements VaccinationSchedule {
  const factory _VaccinationSchedule(
      {required final List<VaccineRecord> vaccines,
      required final List<String> deworming,
      required final String healthCheckup}) = _$VaccinationScheduleImpl;

  factory _VaccinationSchedule.fromJson(Map<String, dynamic> json) =
      _$VaccinationScheduleImpl.fromJson;

  @override
  List<VaccineRecord> get vaccines;
  @override
  List<String> get deworming;
  @override
  String get healthCheckup;

  /// Create a copy of VaccinationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccinationScheduleImplCopyWith<_$VaccinationScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VaccineRecord _$VaccineRecordFromJson(Map<String, dynamic> json) {
  return _VaccineRecord.fromJson(json);
}

/// @nodoc
mixin _$VaccineRecord {
  String get vaccineName => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get nextDue => throw _privateConstructorUsedError;
  String get veterinarian => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this VaccineRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccineRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccineRecordCopyWith<VaccineRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineRecordCopyWith<$Res> {
  factory $VaccineRecordCopyWith(
          VaccineRecord value, $Res Function(VaccineRecord) then) =
      _$VaccineRecordCopyWithImpl<$Res, VaccineRecord>;
  @useResult
  $Res call(
      {String vaccineName,
      DateTime date,
      DateTime nextDue,
      String veterinarian,
      double cost,
      String notes});
}

/// @nodoc
class _$VaccineRecordCopyWithImpl<$Res, $Val extends VaccineRecord>
    implements $VaccineRecordCopyWith<$Res> {
  _$VaccineRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccineRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaccineName = null,
    Object? date = null,
    Object? nextDue = null,
    Object? veterinarian = null,
    Object? cost = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      vaccineName: null == vaccineName
          ? _value.vaccineName
          : vaccineName // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextDue: null == nextDue
          ? _value.nextDue
          : nextDue // ignore: cast_nullable_to_non_nullable
              as DateTime,
      veterinarian: null == veterinarian
          ? _value.veterinarian
          : veterinarian // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VaccineRecordImplCopyWith<$Res>
    implements $VaccineRecordCopyWith<$Res> {
  factory _$$VaccineRecordImplCopyWith(
          _$VaccineRecordImpl value, $Res Function(_$VaccineRecordImpl) then) =
      __$$VaccineRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String vaccineName,
      DateTime date,
      DateTime nextDue,
      String veterinarian,
      double cost,
      String notes});
}

/// @nodoc
class __$$VaccineRecordImplCopyWithImpl<$Res>
    extends _$VaccineRecordCopyWithImpl<$Res, _$VaccineRecordImpl>
    implements _$$VaccineRecordImplCopyWith<$Res> {
  __$$VaccineRecordImplCopyWithImpl(
      _$VaccineRecordImpl _value, $Res Function(_$VaccineRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccineRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaccineName = null,
    Object? date = null,
    Object? nextDue = null,
    Object? veterinarian = null,
    Object? cost = null,
    Object? notes = null,
  }) {
    return _then(_$VaccineRecordImpl(
      vaccineName: null == vaccineName
          ? _value.vaccineName
          : vaccineName // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextDue: null == nextDue
          ? _value.nextDue
          : nextDue // ignore: cast_nullable_to_non_nullable
              as DateTime,
      veterinarian: null == veterinarian
          ? _value.veterinarian
          : veterinarian // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VaccineRecordImpl implements _VaccineRecord {
  const _$VaccineRecordImpl(
      {required this.vaccineName,
      required this.date,
      required this.nextDue,
      required this.veterinarian,
      required this.cost,
      required this.notes});

  factory _$VaccineRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaccineRecordImplFromJson(json);

  @override
  final String vaccineName;
  @override
  final DateTime date;
  @override
  final DateTime nextDue;
  @override
  final String veterinarian;
  @override
  final double cost;
  @override
  final String notes;

  @override
  String toString() {
    return 'VaccineRecord(vaccineName: $vaccineName, date: $date, nextDue: $nextDue, veterinarian: $veterinarian, cost: $cost, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccineRecordImpl &&
            (identical(other.vaccineName, vaccineName) ||
                other.vaccineName == vaccineName) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.nextDue, nextDue) || other.nextDue == nextDue) &&
            (identical(other.veterinarian, veterinarian) ||
                other.veterinarian == veterinarian) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, vaccineName, date, nextDue, veterinarian, cost, notes);

  /// Create a copy of VaccineRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccineRecordImplCopyWith<_$VaccineRecordImpl> get copyWith =>
      __$$VaccineRecordImplCopyWithImpl<_$VaccineRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccineRecordImplToJson(
      this,
    );
  }
}

abstract class _VaccineRecord implements VaccineRecord {
  const factory _VaccineRecord(
      {required final String vaccineName,
      required final DateTime date,
      required final DateTime nextDue,
      required final String veterinarian,
      required final double cost,
      required final String notes}) = _$VaccineRecordImpl;

  factory _VaccineRecord.fromJson(Map<String, dynamic> json) =
      _$VaccineRecordImpl.fromJson;

  @override
  String get vaccineName;
  @override
  DateTime get date;
  @override
  DateTime get nextDue;
  @override
  String get veterinarian;
  @override
  double get cost;
  @override
  String get notes;

  /// Create a copy of VaccineRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccineRecordImplCopyWith<_$VaccineRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BreedingInfo _$BreedingInfoFromJson(Map<String, dynamic> json) {
  return _BreedingInfo.fromJson(json);
}

/// @nodoc
mixin _$BreedingInfo {
  String get breedingMethod => throw _privateConstructorUsedError;
  String get gestationPeriod => throw _privateConstructorUsedError;
  int get averageOffspring => throw _privateConstructorUsedError;
  String get breedingSeason => throw _privateConstructorUsedError;
  double get breedingCost => throw _privateConstructorUsedError;

  /// Serializes this BreedingInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreedingInfoCopyWith<BreedingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedingInfoCopyWith<$Res> {
  factory $BreedingInfoCopyWith(
          BreedingInfo value, $Res Function(BreedingInfo) then) =
      _$BreedingInfoCopyWithImpl<$Res, BreedingInfo>;
  @useResult
  $Res call(
      {String breedingMethod,
      String gestationPeriod,
      int averageOffspring,
      String breedingSeason,
      double breedingCost});
}

/// @nodoc
class _$BreedingInfoCopyWithImpl<$Res, $Val extends BreedingInfo>
    implements $BreedingInfoCopyWith<$Res> {
  _$BreedingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breedingMethod = null,
    Object? gestationPeriod = null,
    Object? averageOffspring = null,
    Object? breedingSeason = null,
    Object? breedingCost = null,
  }) {
    return _then(_value.copyWith(
      breedingMethod: null == breedingMethod
          ? _value.breedingMethod
          : breedingMethod // ignore: cast_nullable_to_non_nullable
              as String,
      gestationPeriod: null == gestationPeriod
          ? _value.gestationPeriod
          : gestationPeriod // ignore: cast_nullable_to_non_nullable
              as String,
      averageOffspring: null == averageOffspring
          ? _value.averageOffspring
          : averageOffspring // ignore: cast_nullable_to_non_nullable
              as int,
      breedingSeason: null == breedingSeason
          ? _value.breedingSeason
          : breedingSeason // ignore: cast_nullable_to_non_nullable
              as String,
      breedingCost: null == breedingCost
          ? _value.breedingCost
          : breedingCost // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BreedingInfoImplCopyWith<$Res>
    implements $BreedingInfoCopyWith<$Res> {
  factory _$$BreedingInfoImplCopyWith(
          _$BreedingInfoImpl value, $Res Function(_$BreedingInfoImpl) then) =
      __$$BreedingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String breedingMethod,
      String gestationPeriod,
      int averageOffspring,
      String breedingSeason,
      double breedingCost});
}

/// @nodoc
class __$$BreedingInfoImplCopyWithImpl<$Res>
    extends _$BreedingInfoCopyWithImpl<$Res, _$BreedingInfoImpl>
    implements _$$BreedingInfoImplCopyWith<$Res> {
  __$$BreedingInfoImplCopyWithImpl(
      _$BreedingInfoImpl _value, $Res Function(_$BreedingInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BreedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breedingMethod = null,
    Object? gestationPeriod = null,
    Object? averageOffspring = null,
    Object? breedingSeason = null,
    Object? breedingCost = null,
  }) {
    return _then(_$BreedingInfoImpl(
      breedingMethod: null == breedingMethod
          ? _value.breedingMethod
          : breedingMethod // ignore: cast_nullable_to_non_nullable
              as String,
      gestationPeriod: null == gestationPeriod
          ? _value.gestationPeriod
          : gestationPeriod // ignore: cast_nullable_to_non_nullable
              as String,
      averageOffspring: null == averageOffspring
          ? _value.averageOffspring
          : averageOffspring // ignore: cast_nullable_to_non_nullable
              as int,
      breedingSeason: null == breedingSeason
          ? _value.breedingSeason
          : breedingSeason // ignore: cast_nullable_to_non_nullable
              as String,
      breedingCost: null == breedingCost
          ? _value.breedingCost
          : breedingCost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BreedingInfoImpl implements _BreedingInfo {
  const _$BreedingInfoImpl(
      {required this.breedingMethod,
      required this.gestationPeriod,
      required this.averageOffspring,
      required this.breedingSeason,
      required this.breedingCost});

  factory _$BreedingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreedingInfoImplFromJson(json);

  @override
  final String breedingMethod;
  @override
  final String gestationPeriod;
  @override
  final int averageOffspring;
  @override
  final String breedingSeason;
  @override
  final double breedingCost;

  @override
  String toString() {
    return 'BreedingInfo(breedingMethod: $breedingMethod, gestationPeriod: $gestationPeriod, averageOffspring: $averageOffspring, breedingSeason: $breedingSeason, breedingCost: $breedingCost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreedingInfoImpl &&
            (identical(other.breedingMethod, breedingMethod) ||
                other.breedingMethod == breedingMethod) &&
            (identical(other.gestationPeriod, gestationPeriod) ||
                other.gestationPeriod == gestationPeriod) &&
            (identical(other.averageOffspring, averageOffspring) ||
                other.averageOffspring == averageOffspring) &&
            (identical(other.breedingSeason, breedingSeason) ||
                other.breedingSeason == breedingSeason) &&
            (identical(other.breedingCost, breedingCost) ||
                other.breedingCost == breedingCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, breedingMethod, gestationPeriod,
      averageOffspring, breedingSeason, breedingCost);

  /// Create a copy of BreedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreedingInfoImplCopyWith<_$BreedingInfoImpl> get copyWith =>
      __$$BreedingInfoImplCopyWithImpl<_$BreedingInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreedingInfoImplToJson(
      this,
    );
  }
}

abstract class _BreedingInfo implements BreedingInfo {
  const factory _BreedingInfo(
      {required final String breedingMethod,
      required final String gestationPeriod,
      required final int averageOffspring,
      required final String breedingSeason,
      required final double breedingCost}) = _$BreedingInfoImpl;

  factory _BreedingInfo.fromJson(Map<String, dynamic> json) =
      _$BreedingInfoImpl.fromJson;

  @override
  String get breedingMethod;
  @override
  String get gestationPeriod;
  @override
  int get averageOffspring;
  @override
  String get breedingSeason;
  @override
  double get breedingCost;

  /// Create a copy of BreedingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreedingInfoImplCopyWith<_$BreedingInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductionInfo _$ProductionInfoFromJson(Map<String, dynamic> json) {
  return _ProductionInfo.fromJson(json);
}

/// @nodoc
mixin _$ProductionInfo {
  String get productType => throw _privateConstructorUsedError;
  double get dailyProduction => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  double get pricePerUnit => throw _privateConstructorUsedError;
  String get marketDemand => throw _privateConstructorUsedError;
  List<String> get buyers => throw _privateConstructorUsedError;

  /// Serializes this ProductionInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductionInfoCopyWith<ProductionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionInfoCopyWith<$Res> {
  factory $ProductionInfoCopyWith(
          ProductionInfo value, $Res Function(ProductionInfo) then) =
      _$ProductionInfoCopyWithImpl<$Res, ProductionInfo>;
  @useResult
  $Res call(
      {String productType,
      double dailyProduction,
      String unit,
      double pricePerUnit,
      String marketDemand,
      List<String> buyers});
}

/// @nodoc
class _$ProductionInfoCopyWithImpl<$Res, $Val extends ProductionInfo>
    implements $ProductionInfoCopyWith<$Res> {
  _$ProductionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productType = null,
    Object? dailyProduction = null,
    Object? unit = null,
    Object? pricePerUnit = null,
    Object? marketDemand = null,
    Object? buyers = null,
  }) {
    return _then(_value.copyWith(
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      dailyProduction: null == dailyProduction
          ? _value.dailyProduction
          : dailyProduction // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerUnit: null == pricePerUnit
          ? _value.pricePerUnit
          : pricePerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      marketDemand: null == marketDemand
          ? _value.marketDemand
          : marketDemand // ignore: cast_nullable_to_non_nullable
              as String,
      buyers: null == buyers
          ? _value.buyers
          : buyers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductionInfoImplCopyWith<$Res>
    implements $ProductionInfoCopyWith<$Res> {
  factory _$$ProductionInfoImplCopyWith(_$ProductionInfoImpl value,
          $Res Function(_$ProductionInfoImpl) then) =
      __$$ProductionInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productType,
      double dailyProduction,
      String unit,
      double pricePerUnit,
      String marketDemand,
      List<String> buyers});
}

/// @nodoc
class __$$ProductionInfoImplCopyWithImpl<$Res>
    extends _$ProductionInfoCopyWithImpl<$Res, _$ProductionInfoImpl>
    implements _$$ProductionInfoImplCopyWith<$Res> {
  __$$ProductionInfoImplCopyWithImpl(
      _$ProductionInfoImpl _value, $Res Function(_$ProductionInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productType = null,
    Object? dailyProduction = null,
    Object? unit = null,
    Object? pricePerUnit = null,
    Object? marketDemand = null,
    Object? buyers = null,
  }) {
    return _then(_$ProductionInfoImpl(
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      dailyProduction: null == dailyProduction
          ? _value.dailyProduction
          : dailyProduction // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerUnit: null == pricePerUnit
          ? _value.pricePerUnit
          : pricePerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      marketDemand: null == marketDemand
          ? _value.marketDemand
          : marketDemand // ignore: cast_nullable_to_non_nullable
              as String,
      buyers: null == buyers
          ? _value._buyers
          : buyers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionInfoImpl implements _ProductionInfo {
  const _$ProductionInfoImpl(
      {required this.productType,
      required this.dailyProduction,
      required this.unit,
      required this.pricePerUnit,
      required this.marketDemand,
      required final List<String> buyers})
      : _buyers = buyers;

  factory _$ProductionInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionInfoImplFromJson(json);

  @override
  final String productType;
  @override
  final double dailyProduction;
  @override
  final String unit;
  @override
  final double pricePerUnit;
  @override
  final String marketDemand;
  final List<String> _buyers;
  @override
  List<String> get buyers {
    if (_buyers is EqualUnmodifiableListView) return _buyers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_buyers);
  }

  @override
  String toString() {
    return 'ProductionInfo(productType: $productType, dailyProduction: $dailyProduction, unit: $unit, pricePerUnit: $pricePerUnit, marketDemand: $marketDemand, buyers: $buyers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionInfoImpl &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.dailyProduction, dailyProduction) ||
                other.dailyProduction == dailyProduction) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.pricePerUnit, pricePerUnit) ||
                other.pricePerUnit == pricePerUnit) &&
            (identical(other.marketDemand, marketDemand) ||
                other.marketDemand == marketDemand) &&
            const DeepCollectionEquality().equals(other._buyers, _buyers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productType,
      dailyProduction,
      unit,
      pricePerUnit,
      marketDemand,
      const DeepCollectionEquality().hash(_buyers));

  /// Create a copy of ProductionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionInfoImplCopyWith<_$ProductionInfoImpl> get copyWith =>
      __$$ProductionInfoImplCopyWithImpl<_$ProductionInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionInfoImplToJson(
      this,
    );
  }
}

abstract class _ProductionInfo implements ProductionInfo {
  const factory _ProductionInfo(
      {required final String productType,
      required final double dailyProduction,
      required final String unit,
      required final double pricePerUnit,
      required final String marketDemand,
      required final List<String> buyers}) = _$ProductionInfoImpl;

  factory _ProductionInfo.fromJson(Map<String, dynamic> json) =
      _$ProductionInfoImpl.fromJson;

  @override
  String get productType;
  @override
  double get dailyProduction;
  @override
  String get unit;
  @override
  double get pricePerUnit;
  @override
  String get marketDemand;
  @override
  List<String> get buyers;

  /// Create a copy of ProductionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductionInfoImplCopyWith<_$ProductionInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HealthRecord _$HealthRecordFromJson(Map<String, dynamic> json) {
  return _HealthRecord.fromJson(json);
}

/// @nodoc
mixin _$HealthRecord {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get issue => throw _privateConstructorUsedError;
  String get treatment => throw _privateConstructorUsedError;
  String get veterinarian => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get outcome => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this HealthRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthRecordCopyWith<HealthRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthRecordCopyWith<$Res> {
  factory $HealthRecordCopyWith(
          HealthRecord value, $Res Function(HealthRecord) then) =
      _$HealthRecordCopyWithImpl<$Res, HealthRecord>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String issue,
      String treatment,
      String veterinarian,
      double cost,
      String outcome,
      String notes});
}

/// @nodoc
class _$HealthRecordCopyWithImpl<$Res, $Val extends HealthRecord>
    implements $HealthRecordCopyWith<$Res> {
  _$HealthRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? issue = null,
    Object? treatment = null,
    Object? veterinarian = null,
    Object? cost = null,
    Object? outcome = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      issue: null == issue
          ? _value.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as String,
      treatment: null == treatment
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as String,
      veterinarian: null == veterinarian
          ? _value.veterinarian
          : veterinarian // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      outcome: null == outcome
          ? _value.outcome
          : outcome // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthRecordImplCopyWith<$Res>
    implements $HealthRecordCopyWith<$Res> {
  factory _$$HealthRecordImplCopyWith(
          _$HealthRecordImpl value, $Res Function(_$HealthRecordImpl) then) =
      __$$HealthRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String issue,
      String treatment,
      String veterinarian,
      double cost,
      String outcome,
      String notes});
}

/// @nodoc
class __$$HealthRecordImplCopyWithImpl<$Res>
    extends _$HealthRecordCopyWithImpl<$Res, _$HealthRecordImpl>
    implements _$$HealthRecordImplCopyWith<$Res> {
  __$$HealthRecordImplCopyWithImpl(
      _$HealthRecordImpl _value, $Res Function(_$HealthRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of HealthRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? issue = null,
    Object? treatment = null,
    Object? veterinarian = null,
    Object? cost = null,
    Object? outcome = null,
    Object? notes = null,
  }) {
    return _then(_$HealthRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      issue: null == issue
          ? _value.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as String,
      treatment: null == treatment
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as String,
      veterinarian: null == veterinarian
          ? _value.veterinarian
          : veterinarian // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      outcome: null == outcome
          ? _value.outcome
          : outcome // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthRecordImpl implements _HealthRecord {
  const _$HealthRecordImpl(
      {required this.id,
      required this.date,
      required this.issue,
      required this.treatment,
      required this.veterinarian,
      required this.cost,
      required this.outcome,
      required this.notes});

  factory _$HealthRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthRecordImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String issue;
  @override
  final String treatment;
  @override
  final String veterinarian;
  @override
  final double cost;
  @override
  final String outcome;
  @override
  final String notes;

  @override
  String toString() {
    return 'HealthRecord(id: $id, date: $date, issue: $issue, treatment: $treatment, veterinarian: $veterinarian, cost: $cost, outcome: $outcome, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.issue, issue) || other.issue == issue) &&
            (identical(other.treatment, treatment) ||
                other.treatment == treatment) &&
            (identical(other.veterinarian, veterinarian) ||
                other.veterinarian == veterinarian) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.outcome, outcome) || other.outcome == outcome) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, issue, treatment,
      veterinarian, cost, outcome, notes);

  /// Create a copy of HealthRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthRecordImplCopyWith<_$HealthRecordImpl> get copyWith =>
      __$$HealthRecordImplCopyWithImpl<_$HealthRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthRecordImplToJson(
      this,
    );
  }
}

abstract class _HealthRecord implements HealthRecord {
  const factory _HealthRecord(
      {required final String id,
      required final DateTime date,
      required final String issue,
      required final String treatment,
      required final String veterinarian,
      required final double cost,
      required final String outcome,
      required final String notes}) = _$HealthRecordImpl;

  factory _HealthRecord.fromJson(Map<String, dynamic> json) =
      _$HealthRecordImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get issue;
  @override
  String get treatment;
  @override
  String get veterinarian;
  @override
  double get cost;
  @override
  String get outcome;
  @override
  String get notes;

  /// Create a copy of HealthRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthRecordImplCopyWith<_$HealthRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductionRecord _$ProductionRecordFromJson(Map<String, dynamic> json) {
  return _ProductionRecord.fromJson(json);
}

/// @nodoc
mixin _$ProductionRecord {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  double get pricePerUnit => throw _privateConstructorUsedError;
  String get buyer => throw _privateConstructorUsedError;
  double get totalRevenue => throw _privateConstructorUsedError;
  String get quality => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this ProductionRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductionRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductionRecordCopyWith<ProductionRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionRecordCopyWith<$Res> {
  factory $ProductionRecordCopyWith(
          ProductionRecord value, $Res Function(ProductionRecord) then) =
      _$ProductionRecordCopyWithImpl<$Res, ProductionRecord>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      double quantity,
      String unit,
      double pricePerUnit,
      String buyer,
      double totalRevenue,
      String quality,
      String notes});
}

/// @nodoc
class _$ProductionRecordCopyWithImpl<$Res, $Val extends ProductionRecord>
    implements $ProductionRecordCopyWith<$Res> {
  _$ProductionRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductionRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? quantity = null,
    Object? unit = null,
    Object? pricePerUnit = null,
    Object? buyer = null,
    Object? totalRevenue = null,
    Object? quality = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerUnit: null == pricePerUnit
          ? _value.pricePerUnit
          : pricePerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      buyer: null == buyer
          ? _value.buyer
          : buyer // ignore: cast_nullable_to_non_nullable
              as String,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductionRecordImplCopyWith<$Res>
    implements $ProductionRecordCopyWith<$Res> {
  factory _$$ProductionRecordImplCopyWith(_$ProductionRecordImpl value,
          $Res Function(_$ProductionRecordImpl) then) =
      __$$ProductionRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      double quantity,
      String unit,
      double pricePerUnit,
      String buyer,
      double totalRevenue,
      String quality,
      String notes});
}

/// @nodoc
class __$$ProductionRecordImplCopyWithImpl<$Res>
    extends _$ProductionRecordCopyWithImpl<$Res, _$ProductionRecordImpl>
    implements _$$ProductionRecordImplCopyWith<$Res> {
  __$$ProductionRecordImplCopyWithImpl(_$ProductionRecordImpl _value,
      $Res Function(_$ProductionRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductionRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? quantity = null,
    Object? unit = null,
    Object? pricePerUnit = null,
    Object? buyer = null,
    Object? totalRevenue = null,
    Object? quality = null,
    Object? notes = null,
  }) {
    return _then(_$ProductionRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerUnit: null == pricePerUnit
          ? _value.pricePerUnit
          : pricePerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      buyer: null == buyer
          ? _value.buyer
          : buyer // ignore: cast_nullable_to_non_nullable
              as String,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionRecordImpl implements _ProductionRecord {
  const _$ProductionRecordImpl(
      {required this.id,
      required this.date,
      required this.quantity,
      required this.unit,
      required this.pricePerUnit,
      required this.buyer,
      required this.totalRevenue,
      required this.quality,
      required this.notes});

  factory _$ProductionRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionRecordImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final double quantity;
  @override
  final String unit;
  @override
  final double pricePerUnit;
  @override
  final String buyer;
  @override
  final double totalRevenue;
  @override
  final String quality;
  @override
  final String notes;

  @override
  String toString() {
    return 'ProductionRecord(id: $id, date: $date, quantity: $quantity, unit: $unit, pricePerUnit: $pricePerUnit, buyer: $buyer, totalRevenue: $totalRevenue, quality: $quality, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.pricePerUnit, pricePerUnit) ||
                other.pricePerUnit == pricePerUnit) &&
            (identical(other.buyer, buyer) || other.buyer == buyer) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, quantity, unit,
      pricePerUnit, buyer, totalRevenue, quality, notes);

  /// Create a copy of ProductionRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionRecordImplCopyWith<_$ProductionRecordImpl> get copyWith =>
      __$$ProductionRecordImplCopyWithImpl<_$ProductionRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionRecordImplToJson(
      this,
    );
  }
}

abstract class _ProductionRecord implements ProductionRecord {
  const factory _ProductionRecord(
      {required final String id,
      required final DateTime date,
      required final double quantity,
      required final String unit,
      required final double pricePerUnit,
      required final String buyer,
      required final double totalRevenue,
      required final String quality,
      required final String notes}) = _$ProductionRecordImpl;

  factory _ProductionRecord.fromJson(Map<String, dynamic> json) =
      _$ProductionRecordImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  double get quantity;
  @override
  String get unit;
  @override
  double get pricePerUnit;
  @override
  String get buyer;
  @override
  double get totalRevenue;
  @override
  String get quality;
  @override
  String get notes;

  /// Create a copy of ProductionRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductionRecordImplCopyWith<_$ProductionRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FieldExpense _$FieldExpenseFromJson(Map<String, dynamic> json) {
  return _FieldExpense.fromJson(json);
}

/// @nodoc
mixin _$FieldExpense {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  ExpenseCategory get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get vendor => throw _privateConstructorUsedError;
  String get receipt => throw _privateConstructorUsedError;
  String get fieldId => throw _privateConstructorUsedError;
  List<String> get attachments => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this FieldExpense to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FieldExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FieldExpenseCopyWith<FieldExpense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldExpenseCopyWith<$Res> {
  factory $FieldExpenseCopyWith(
          FieldExpense value, $Res Function(FieldExpense) then) =
      _$FieldExpenseCopyWithImpl<$Res, FieldExpense>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      ExpenseCategory category,
      String description,
      double amount,
      String paymentMethod,
      String vendor,
      String receipt,
      String fieldId,
      List<String> attachments,
      String notes});
}

/// @nodoc
class _$FieldExpenseCopyWithImpl<$Res, $Val extends FieldExpense>
    implements $FieldExpenseCopyWith<$Res> {
  _$FieldExpenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FieldExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? category = null,
    Object? description = null,
    Object? amount = null,
    Object? paymentMethod = null,
    Object? vendor = null,
    Object? receipt = null,
    Object? fieldId = null,
    Object? attachments = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      receipt: null == receipt
          ? _value.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as String,
      fieldId: null == fieldId
          ? _value.fieldId
          : fieldId // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FieldExpenseImplCopyWith<$Res>
    implements $FieldExpenseCopyWith<$Res> {
  factory _$$FieldExpenseImplCopyWith(
          _$FieldExpenseImpl value, $Res Function(_$FieldExpenseImpl) then) =
      __$$FieldExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      ExpenseCategory category,
      String description,
      double amount,
      String paymentMethod,
      String vendor,
      String receipt,
      String fieldId,
      List<String> attachments,
      String notes});
}

/// @nodoc
class __$$FieldExpenseImplCopyWithImpl<$Res>
    extends _$FieldExpenseCopyWithImpl<$Res, _$FieldExpenseImpl>
    implements _$$FieldExpenseImplCopyWith<$Res> {
  __$$FieldExpenseImplCopyWithImpl(
      _$FieldExpenseImpl _value, $Res Function(_$FieldExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FieldExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? category = null,
    Object? description = null,
    Object? amount = null,
    Object? paymentMethod = null,
    Object? vendor = null,
    Object? receipt = null,
    Object? fieldId = null,
    Object? attachments = null,
    Object? notes = null,
  }) {
    return _then(_$FieldExpenseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      receipt: null == receipt
          ? _value.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as String,
      fieldId: null == fieldId
          ? _value.fieldId
          : fieldId // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FieldExpenseImpl implements _FieldExpense {
  const _$FieldExpenseImpl(
      {required this.id,
      required this.date,
      required this.category,
      required this.description,
      required this.amount,
      required this.paymentMethod,
      required this.vendor,
      required this.receipt,
      required this.fieldId,
      final List<String> attachments = const [],
      required this.notes})
      : _attachments = attachments;

  factory _$FieldExpenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FieldExpenseImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final ExpenseCategory category;
  @override
  final String description;
  @override
  final double amount;
  @override
  final String paymentMethod;
  @override
  final String vendor;
  @override
  final String receipt;
  @override
  final String fieldId;
  final List<String> _attachments;
  @override
  @JsonKey()
  List<String> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final String notes;

  @override
  String toString() {
    return 'FieldExpense(id: $id, date: $date, category: $category, description: $description, amount: $amount, paymentMethod: $paymentMethod, vendor: $vendor, receipt: $receipt, fieldId: $fieldId, attachments: $attachments, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldExpenseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.receipt, receipt) || other.receipt == receipt) &&
            (identical(other.fieldId, fieldId) || other.fieldId == fieldId) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      category,
      description,
      amount,
      paymentMethod,
      vendor,
      receipt,
      fieldId,
      const DeepCollectionEquality().hash(_attachments),
      notes);

  /// Create a copy of FieldExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldExpenseImplCopyWith<_$FieldExpenseImpl> get copyWith =>
      __$$FieldExpenseImplCopyWithImpl<_$FieldExpenseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FieldExpenseImplToJson(
      this,
    );
  }
}

abstract class _FieldExpense implements FieldExpense {
  const factory _FieldExpense(
      {required final String id,
      required final DateTime date,
      required final ExpenseCategory category,
      required final String description,
      required final double amount,
      required final String paymentMethod,
      required final String vendor,
      required final String receipt,
      required final String fieldId,
      final List<String> attachments,
      required final String notes}) = _$FieldExpenseImpl;

  factory _FieldExpense.fromJson(Map<String, dynamic> json) =
      _$FieldExpenseImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  ExpenseCategory get category;
  @override
  String get description;
  @override
  double get amount;
  @override
  String get paymentMethod;
  @override
  String get vendor;
  @override
  String get receipt;
  @override
  String get fieldId;
  @override
  List<String> get attachments;
  @override
  String get notes;

  /// Create a copy of FieldExpense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FieldExpenseImplCopyWith<_$FieldExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FieldActivity _$FieldActivityFromJson(Map<String, dynamic> json) {
  return _FieldActivity.fromJson(json);
}

/// @nodoc
mixin _$FieldActivity {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get activity => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get laborType => throw _privateConstructorUsedError;
  int get hoursWorked => throw _privateConstructorUsedError;
  String get equipment => throw _privateConstructorUsedError;
  String get fieldId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this FieldActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FieldActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FieldActivityCopyWith<FieldActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldActivityCopyWith<$Res> {
  factory $FieldActivityCopyWith(
          FieldActivity value, $Res Function(FieldActivity) then) =
      _$FieldActivityCopyWithImpl<$Res, FieldActivity>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String activity,
      String description,
      double cost,
      String laborType,
      int hoursWorked,
      String equipment,
      String fieldId,
      String status,
      String notes});
}

/// @nodoc
class _$FieldActivityCopyWithImpl<$Res, $Val extends FieldActivity>
    implements $FieldActivityCopyWith<$Res> {
  _$FieldActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FieldActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? activity = null,
    Object? description = null,
    Object? cost = null,
    Object? laborType = null,
    Object? hoursWorked = null,
    Object? equipment = null,
    Object? fieldId = null,
    Object? status = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      laborType: null == laborType
          ? _value.laborType
          : laborType // ignore: cast_nullable_to_non_nullable
              as String,
      hoursWorked: null == hoursWorked
          ? _value.hoursWorked
          : hoursWorked // ignore: cast_nullable_to_non_nullable
              as int,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      fieldId: null == fieldId
          ? _value.fieldId
          : fieldId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FieldActivityImplCopyWith<$Res>
    implements $FieldActivityCopyWith<$Res> {
  factory _$$FieldActivityImplCopyWith(
          _$FieldActivityImpl value, $Res Function(_$FieldActivityImpl) then) =
      __$$FieldActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String activity,
      String description,
      double cost,
      String laborType,
      int hoursWorked,
      String equipment,
      String fieldId,
      String status,
      String notes});
}

/// @nodoc
class __$$FieldActivityImplCopyWithImpl<$Res>
    extends _$FieldActivityCopyWithImpl<$Res, _$FieldActivityImpl>
    implements _$$FieldActivityImplCopyWith<$Res> {
  __$$FieldActivityImplCopyWithImpl(
      _$FieldActivityImpl _value, $Res Function(_$FieldActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of FieldActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? activity = null,
    Object? description = null,
    Object? cost = null,
    Object? laborType = null,
    Object? hoursWorked = null,
    Object? equipment = null,
    Object? fieldId = null,
    Object? status = null,
    Object? notes = null,
  }) {
    return _then(_$FieldActivityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      laborType: null == laborType
          ? _value.laborType
          : laborType // ignore: cast_nullable_to_non_nullable
              as String,
      hoursWorked: null == hoursWorked
          ? _value.hoursWorked
          : hoursWorked // ignore: cast_nullable_to_non_nullable
              as int,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      fieldId: null == fieldId
          ? _value.fieldId
          : fieldId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FieldActivityImpl implements _FieldActivity {
  const _$FieldActivityImpl(
      {required this.id,
      required this.date,
      required this.activity,
      required this.description,
      required this.cost,
      required this.laborType,
      required this.hoursWorked,
      required this.equipment,
      required this.fieldId,
      required this.status,
      required this.notes});

  factory _$FieldActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FieldActivityImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String activity;
  @override
  final String description;
  @override
  final double cost;
  @override
  final String laborType;
  @override
  final int hoursWorked;
  @override
  final String equipment;
  @override
  final String fieldId;
  @override
  final String status;
  @override
  final String notes;

  @override
  String toString() {
    return 'FieldActivity(id: $id, date: $date, activity: $activity, description: $description, cost: $cost, laborType: $laborType, hoursWorked: $hoursWorked, equipment: $equipment, fieldId: $fieldId, status: $status, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.laborType, laborType) ||
                other.laborType == laborType) &&
            (identical(other.hoursWorked, hoursWorked) ||
                other.hoursWorked == hoursWorked) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.fieldId, fieldId) || other.fieldId == fieldId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, activity, description,
      cost, laborType, hoursWorked, equipment, fieldId, status, notes);

  /// Create a copy of FieldActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldActivityImplCopyWith<_$FieldActivityImpl> get copyWith =>
      __$$FieldActivityImplCopyWithImpl<_$FieldActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FieldActivityImplToJson(
      this,
    );
  }
}

abstract class _FieldActivity implements FieldActivity {
  const factory _FieldActivity(
      {required final String id,
      required final DateTime date,
      required final String activity,
      required final String description,
      required final double cost,
      required final String laborType,
      required final int hoursWorked,
      required final String equipment,
      required final String fieldId,
      required final String status,
      required final String notes}) = _$FieldActivityImpl;

  factory _FieldActivity.fromJson(Map<String, dynamic> json) =
      _$FieldActivityImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get activity;
  @override
  String get description;
  @override
  double get cost;
  @override
  String get laborType;
  @override
  int get hoursWorked;
  @override
  String get equipment;
  @override
  String get fieldId;
  @override
  String get status;
  @override
  String get notes;

  /// Create a copy of FieldActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FieldActivityImplCopyWith<_$FieldActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FinancialSummary _$FinancialSummaryFromJson(Map<String, dynamic> json) {
  return _FinancialSummary.fromJson(json);
}

/// @nodoc
mixin _$FinancialSummary {
  String get farmerId => throw _privateConstructorUsedError;
  String get season => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  double get totalIncome => throw _privateConstructorUsedError;
  double get totalExpenses => throw _privateConstructorUsedError;
  double get netProfit => throw _privateConstructorUsedError;
  Map<ExpenseCategory, double> get categoryWiseExpenses =>
      throw _privateConstructorUsedError;
  Map<String, double> get cropWiseProfit => throw _privateConstructorUsedError;
  List<LoanInfo> get loans => throw _privateConstructorUsedError;
  List<InsuranceInfo> get insurance => throw _privateConstructorUsedError;
  TaxInfo get taxes => throw _privateConstructorUsedError;

  /// Serializes this FinancialSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinancialSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinancialSummaryCopyWith<FinancialSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialSummaryCopyWith<$Res> {
  factory $FinancialSummaryCopyWith(
          FinancialSummary value, $Res Function(FinancialSummary) then) =
      _$FinancialSummaryCopyWithImpl<$Res, FinancialSummary>;
  @useResult
  $Res call(
      {String farmerId,
      String season,
      int year,
      double totalIncome,
      double totalExpenses,
      double netProfit,
      Map<ExpenseCategory, double> categoryWiseExpenses,
      Map<String, double> cropWiseProfit,
      List<LoanInfo> loans,
      List<InsuranceInfo> insurance,
      TaxInfo taxes});

  $TaxInfoCopyWith<$Res> get taxes;
}

/// @nodoc
class _$FinancialSummaryCopyWithImpl<$Res, $Val extends FinancialSummary>
    implements $FinancialSummaryCopyWith<$Res> {
  _$FinancialSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinancialSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmerId = null,
    Object? season = null,
    Object? year = null,
    Object? totalIncome = null,
    Object? totalExpenses = null,
    Object? netProfit = null,
    Object? categoryWiseExpenses = null,
    Object? cropWiseProfit = null,
    Object? loans = null,
    Object? insurance = null,
    Object? taxes = null,
  }) {
    return _then(_value.copyWith(
      farmerId: null == farmerId
          ? _value.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      netProfit: null == netProfit
          ? _value.netProfit
          : netProfit // ignore: cast_nullable_to_non_nullable
              as double,
      categoryWiseExpenses: null == categoryWiseExpenses
          ? _value.categoryWiseExpenses
          : categoryWiseExpenses // ignore: cast_nullable_to_non_nullable
              as Map<ExpenseCategory, double>,
      cropWiseProfit: null == cropWiseProfit
          ? _value.cropWiseProfit
          : cropWiseProfit // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      loans: null == loans
          ? _value.loans
          : loans // ignore: cast_nullable_to_non_nullable
              as List<LoanInfo>,
      insurance: null == insurance
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as List<InsuranceInfo>,
      taxes: null == taxes
          ? _value.taxes
          : taxes // ignore: cast_nullable_to_non_nullable
              as TaxInfo,
    ) as $Val);
  }

  /// Create a copy of FinancialSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaxInfoCopyWith<$Res> get taxes {
    return $TaxInfoCopyWith<$Res>(_value.taxes, (value) {
      return _then(_value.copyWith(taxes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FinancialSummaryImplCopyWith<$Res>
    implements $FinancialSummaryCopyWith<$Res> {
  factory _$$FinancialSummaryImplCopyWith(_$FinancialSummaryImpl value,
          $Res Function(_$FinancialSummaryImpl) then) =
      __$$FinancialSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String farmerId,
      String season,
      int year,
      double totalIncome,
      double totalExpenses,
      double netProfit,
      Map<ExpenseCategory, double> categoryWiseExpenses,
      Map<String, double> cropWiseProfit,
      List<LoanInfo> loans,
      List<InsuranceInfo> insurance,
      TaxInfo taxes});

  @override
  $TaxInfoCopyWith<$Res> get taxes;
}

/// @nodoc
class __$$FinancialSummaryImplCopyWithImpl<$Res>
    extends _$FinancialSummaryCopyWithImpl<$Res, _$FinancialSummaryImpl>
    implements _$$FinancialSummaryImplCopyWith<$Res> {
  __$$FinancialSummaryImplCopyWithImpl(_$FinancialSummaryImpl _value,
      $Res Function(_$FinancialSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinancialSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmerId = null,
    Object? season = null,
    Object? year = null,
    Object? totalIncome = null,
    Object? totalExpenses = null,
    Object? netProfit = null,
    Object? categoryWiseExpenses = null,
    Object? cropWiseProfit = null,
    Object? loans = null,
    Object? insurance = null,
    Object? taxes = null,
  }) {
    return _then(_$FinancialSummaryImpl(
      farmerId: null == farmerId
          ? _value.farmerId
          : farmerId // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      netProfit: null == netProfit
          ? _value.netProfit
          : netProfit // ignore: cast_nullable_to_non_nullable
              as double,
      categoryWiseExpenses: null == categoryWiseExpenses
          ? _value._categoryWiseExpenses
          : categoryWiseExpenses // ignore: cast_nullable_to_non_nullable
              as Map<ExpenseCategory, double>,
      cropWiseProfit: null == cropWiseProfit
          ? _value._cropWiseProfit
          : cropWiseProfit // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      loans: null == loans
          ? _value._loans
          : loans // ignore: cast_nullable_to_non_nullable
              as List<LoanInfo>,
      insurance: null == insurance
          ? _value._insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as List<InsuranceInfo>,
      taxes: null == taxes
          ? _value.taxes
          : taxes // ignore: cast_nullable_to_non_nullable
              as TaxInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinancialSummaryImpl implements _FinancialSummary {
  const _$FinancialSummaryImpl(
      {required this.farmerId,
      required this.season,
      required this.year,
      required this.totalIncome,
      required this.totalExpenses,
      required this.netProfit,
      required final Map<ExpenseCategory, double> categoryWiseExpenses,
      required final Map<String, double> cropWiseProfit,
      required final List<LoanInfo> loans,
      required final List<InsuranceInfo> insurance,
      required this.taxes})
      : _categoryWiseExpenses = categoryWiseExpenses,
        _cropWiseProfit = cropWiseProfit,
        _loans = loans,
        _insurance = insurance;

  factory _$FinancialSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinancialSummaryImplFromJson(json);

  @override
  final String farmerId;
  @override
  final String season;
  @override
  final int year;
  @override
  final double totalIncome;
  @override
  final double totalExpenses;
  @override
  final double netProfit;
  final Map<ExpenseCategory, double> _categoryWiseExpenses;
  @override
  Map<ExpenseCategory, double> get categoryWiseExpenses {
    if (_categoryWiseExpenses is EqualUnmodifiableMapView)
      return _categoryWiseExpenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryWiseExpenses);
  }

  final Map<String, double> _cropWiseProfit;
  @override
  Map<String, double> get cropWiseProfit {
    if (_cropWiseProfit is EqualUnmodifiableMapView) return _cropWiseProfit;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cropWiseProfit);
  }

  final List<LoanInfo> _loans;
  @override
  List<LoanInfo> get loans {
    if (_loans is EqualUnmodifiableListView) return _loans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loans);
  }

  final List<InsuranceInfo> _insurance;
  @override
  List<InsuranceInfo> get insurance {
    if (_insurance is EqualUnmodifiableListView) return _insurance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insurance);
  }

  @override
  final TaxInfo taxes;

  @override
  String toString() {
    return 'FinancialSummary(farmerId: $farmerId, season: $season, year: $year, totalIncome: $totalIncome, totalExpenses: $totalExpenses, netProfit: $netProfit, categoryWiseExpenses: $categoryWiseExpenses, cropWiseProfit: $cropWiseProfit, loans: $loans, insurance: $insurance, taxes: $taxes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinancialSummaryImpl &&
            (identical(other.farmerId, farmerId) ||
                other.farmerId == farmerId) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalExpenses, totalExpenses) ||
                other.totalExpenses == totalExpenses) &&
            (identical(other.netProfit, netProfit) ||
                other.netProfit == netProfit) &&
            const DeepCollectionEquality()
                .equals(other._categoryWiseExpenses, _categoryWiseExpenses) &&
            const DeepCollectionEquality()
                .equals(other._cropWiseProfit, _cropWiseProfit) &&
            const DeepCollectionEquality().equals(other._loans, _loans) &&
            const DeepCollectionEquality()
                .equals(other._insurance, _insurance) &&
            (identical(other.taxes, taxes) || other.taxes == taxes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      farmerId,
      season,
      year,
      totalIncome,
      totalExpenses,
      netProfit,
      const DeepCollectionEquality().hash(_categoryWiseExpenses),
      const DeepCollectionEquality().hash(_cropWiseProfit),
      const DeepCollectionEquality().hash(_loans),
      const DeepCollectionEquality().hash(_insurance),
      taxes);

  /// Create a copy of FinancialSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinancialSummaryImplCopyWith<_$FinancialSummaryImpl> get copyWith =>
      __$$FinancialSummaryImplCopyWithImpl<_$FinancialSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinancialSummaryImplToJson(
      this,
    );
  }
}

abstract class _FinancialSummary implements FinancialSummary {
  const factory _FinancialSummary(
      {required final String farmerId,
      required final String season,
      required final int year,
      required final double totalIncome,
      required final double totalExpenses,
      required final double netProfit,
      required final Map<ExpenseCategory, double> categoryWiseExpenses,
      required final Map<String, double> cropWiseProfit,
      required final List<LoanInfo> loans,
      required final List<InsuranceInfo> insurance,
      required final TaxInfo taxes}) = _$FinancialSummaryImpl;

  factory _FinancialSummary.fromJson(Map<String, dynamic> json) =
      _$FinancialSummaryImpl.fromJson;

  @override
  String get farmerId;
  @override
  String get season;
  @override
  int get year;
  @override
  double get totalIncome;
  @override
  double get totalExpenses;
  @override
  double get netProfit;
  @override
  Map<ExpenseCategory, double> get categoryWiseExpenses;
  @override
  Map<String, double> get cropWiseProfit;
  @override
  List<LoanInfo> get loans;
  @override
  List<InsuranceInfo> get insurance;
  @override
  TaxInfo get taxes;

  /// Create a copy of FinancialSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinancialSummaryImplCopyWith<_$FinancialSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoanInfo _$LoanInfoFromJson(Map<String, dynamic> json) {
  return _LoanInfo.fromJson(json);
}

/// @nodoc
mixin _$LoanInfo {
  String get id => throw _privateConstructorUsedError;
  String get bankName => throw _privateConstructorUsedError;
  String get loanType => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get interestRate => throw _privateConstructorUsedError;
  DateTime get disbursalDate => throw _privateConstructorUsedError;
  DateTime get maturityDate => throw _privateConstructorUsedError;
  double get emiAmount => throw _privateConstructorUsedError;
  double get outstandingBalance => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<EMIRecord> get emiRecords => throw _privateConstructorUsedError;

  /// Serializes this LoanInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoanInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoanInfoCopyWith<LoanInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanInfoCopyWith<$Res> {
  factory $LoanInfoCopyWith(LoanInfo value, $Res Function(LoanInfo) then) =
      _$LoanInfoCopyWithImpl<$Res, LoanInfo>;
  @useResult
  $Res call(
      {String id,
      String bankName,
      String loanType,
      double amount,
      double interestRate,
      DateTime disbursalDate,
      DateTime maturityDate,
      double emiAmount,
      double outstandingBalance,
      String status,
      List<EMIRecord> emiRecords});
}

/// @nodoc
class _$LoanInfoCopyWithImpl<$Res, $Val extends LoanInfo>
    implements $LoanInfoCopyWith<$Res> {
  _$LoanInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoanInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bankName = null,
    Object? loanType = null,
    Object? amount = null,
    Object? interestRate = null,
    Object? disbursalDate = null,
    Object? maturityDate = null,
    Object? emiAmount = null,
    Object? outstandingBalance = null,
    Object? status = null,
    Object? emiRecords = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      loanType: null == loanType
          ? _value.loanType
          : loanType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      interestRate: null == interestRate
          ? _value.interestRate
          : interestRate // ignore: cast_nullable_to_non_nullable
              as double,
      disbursalDate: null == disbursalDate
          ? _value.disbursalDate
          : disbursalDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maturityDate: null == maturityDate
          ? _value.maturityDate
          : maturityDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      emiAmount: null == emiAmount
          ? _value.emiAmount
          : emiAmount // ignore: cast_nullable_to_non_nullable
              as double,
      outstandingBalance: null == outstandingBalance
          ? _value.outstandingBalance
          : outstandingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      emiRecords: null == emiRecords
          ? _value.emiRecords
          : emiRecords // ignore: cast_nullable_to_non_nullable
              as List<EMIRecord>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoanInfoImplCopyWith<$Res>
    implements $LoanInfoCopyWith<$Res> {
  factory _$$LoanInfoImplCopyWith(
          _$LoanInfoImpl value, $Res Function(_$LoanInfoImpl) then) =
      __$$LoanInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String bankName,
      String loanType,
      double amount,
      double interestRate,
      DateTime disbursalDate,
      DateTime maturityDate,
      double emiAmount,
      double outstandingBalance,
      String status,
      List<EMIRecord> emiRecords});
}

/// @nodoc
class __$$LoanInfoImplCopyWithImpl<$Res>
    extends _$LoanInfoCopyWithImpl<$Res, _$LoanInfoImpl>
    implements _$$LoanInfoImplCopyWith<$Res> {
  __$$LoanInfoImplCopyWithImpl(
      _$LoanInfoImpl _value, $Res Function(_$LoanInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoanInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bankName = null,
    Object? loanType = null,
    Object? amount = null,
    Object? interestRate = null,
    Object? disbursalDate = null,
    Object? maturityDate = null,
    Object? emiAmount = null,
    Object? outstandingBalance = null,
    Object? status = null,
    Object? emiRecords = null,
  }) {
    return _then(_$LoanInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      loanType: null == loanType
          ? _value.loanType
          : loanType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      interestRate: null == interestRate
          ? _value.interestRate
          : interestRate // ignore: cast_nullable_to_non_nullable
              as double,
      disbursalDate: null == disbursalDate
          ? _value.disbursalDate
          : disbursalDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maturityDate: null == maturityDate
          ? _value.maturityDate
          : maturityDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      emiAmount: null == emiAmount
          ? _value.emiAmount
          : emiAmount // ignore: cast_nullable_to_non_nullable
              as double,
      outstandingBalance: null == outstandingBalance
          ? _value.outstandingBalance
          : outstandingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      emiRecords: null == emiRecords
          ? _value._emiRecords
          : emiRecords // ignore: cast_nullable_to_non_nullable
              as List<EMIRecord>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoanInfoImpl implements _LoanInfo {
  const _$LoanInfoImpl(
      {required this.id,
      required this.bankName,
      required this.loanType,
      required this.amount,
      required this.interestRate,
      required this.disbursalDate,
      required this.maturityDate,
      required this.emiAmount,
      required this.outstandingBalance,
      required this.status,
      final List<EMIRecord> emiRecords = const []})
      : _emiRecords = emiRecords;

  factory _$LoanInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoanInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String bankName;
  @override
  final String loanType;
  @override
  final double amount;
  @override
  final double interestRate;
  @override
  final DateTime disbursalDate;
  @override
  final DateTime maturityDate;
  @override
  final double emiAmount;
  @override
  final double outstandingBalance;
  @override
  final String status;
  final List<EMIRecord> _emiRecords;
  @override
  @JsonKey()
  List<EMIRecord> get emiRecords {
    if (_emiRecords is EqualUnmodifiableListView) return _emiRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emiRecords);
  }

  @override
  String toString() {
    return 'LoanInfo(id: $id, bankName: $bankName, loanType: $loanType, amount: $amount, interestRate: $interestRate, disbursalDate: $disbursalDate, maturityDate: $maturityDate, emiAmount: $emiAmount, outstandingBalance: $outstandingBalance, status: $status, emiRecords: $emiRecords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.loanType, loanType) ||
                other.loanType == loanType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.interestRate, interestRate) ||
                other.interestRate == interestRate) &&
            (identical(other.disbursalDate, disbursalDate) ||
                other.disbursalDate == disbursalDate) &&
            (identical(other.maturityDate, maturityDate) ||
                other.maturityDate == maturityDate) &&
            (identical(other.emiAmount, emiAmount) ||
                other.emiAmount == emiAmount) &&
            (identical(other.outstandingBalance, outstandingBalance) ||
                other.outstandingBalance == outstandingBalance) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._emiRecords, _emiRecords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bankName,
      loanType,
      amount,
      interestRate,
      disbursalDate,
      maturityDate,
      emiAmount,
      outstandingBalance,
      status,
      const DeepCollectionEquality().hash(_emiRecords));

  /// Create a copy of LoanInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoanInfoImplCopyWith<_$LoanInfoImpl> get copyWith =>
      __$$LoanInfoImplCopyWithImpl<_$LoanInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoanInfoImplToJson(
      this,
    );
  }
}

abstract class _LoanInfo implements LoanInfo {
  const factory _LoanInfo(
      {required final String id,
      required final String bankName,
      required final String loanType,
      required final double amount,
      required final double interestRate,
      required final DateTime disbursalDate,
      required final DateTime maturityDate,
      required final double emiAmount,
      required final double outstandingBalance,
      required final String status,
      final List<EMIRecord> emiRecords}) = _$LoanInfoImpl;

  factory _LoanInfo.fromJson(Map<String, dynamic> json) =
      _$LoanInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get bankName;
  @override
  String get loanType;
  @override
  double get amount;
  @override
  double get interestRate;
  @override
  DateTime get disbursalDate;
  @override
  DateTime get maturityDate;
  @override
  double get emiAmount;
  @override
  double get outstandingBalance;
  @override
  String get status;
  @override
  List<EMIRecord> get emiRecords;

  /// Create a copy of LoanInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoanInfoImplCopyWith<_$LoanInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EMIRecord _$EMIRecordFromJson(Map<String, dynamic> json) {
  return _EMIRecord.fromJson(json);
}

/// @nodoc
mixin _$EMIRecord {
  DateTime get date => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get principal => throw _privateConstructorUsedError;
  double get interest => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get transactionId => throw _privateConstructorUsedError;

  /// Serializes this EMIRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EMIRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EMIRecordCopyWith<EMIRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EMIRecordCopyWith<$Res> {
  factory $EMIRecordCopyWith(EMIRecord value, $Res Function(EMIRecord) then) =
      _$EMIRecordCopyWithImpl<$Res, EMIRecord>;
  @useResult
  $Res call(
      {DateTime date,
      double amount,
      double principal,
      double interest,
      String status,
      String transactionId});
}

/// @nodoc
class _$EMIRecordCopyWithImpl<$Res, $Val extends EMIRecord>
    implements $EMIRecordCopyWith<$Res> {
  _$EMIRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EMIRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? principal = null,
    Object? interest = null,
    Object? status = null,
    Object? transactionId = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      principal: null == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as double,
      interest: null == interest
          ? _value.interest
          : interest // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EMIRecordImplCopyWith<$Res>
    implements $EMIRecordCopyWith<$Res> {
  factory _$$EMIRecordImplCopyWith(
          _$EMIRecordImpl value, $Res Function(_$EMIRecordImpl) then) =
      __$$EMIRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      double amount,
      double principal,
      double interest,
      String status,
      String transactionId});
}

/// @nodoc
class __$$EMIRecordImplCopyWithImpl<$Res>
    extends _$EMIRecordCopyWithImpl<$Res, _$EMIRecordImpl>
    implements _$$EMIRecordImplCopyWith<$Res> {
  __$$EMIRecordImplCopyWithImpl(
      _$EMIRecordImpl _value, $Res Function(_$EMIRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of EMIRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? principal = null,
    Object? interest = null,
    Object? status = null,
    Object? transactionId = null,
  }) {
    return _then(_$EMIRecordImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      principal: null == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as double,
      interest: null == interest
          ? _value.interest
          : interest // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EMIRecordImpl implements _EMIRecord {
  const _$EMIRecordImpl(
      {required this.date,
      required this.amount,
      required this.principal,
      required this.interest,
      required this.status,
      required this.transactionId});

  factory _$EMIRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$EMIRecordImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double amount;
  @override
  final double principal;
  @override
  final double interest;
  @override
  final String status;
  @override
  final String transactionId;

  @override
  String toString() {
    return 'EMIRecord(date: $date, amount: $amount, principal: $principal, interest: $interest, status: $status, transactionId: $transactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EMIRecordImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.principal, principal) ||
                other.principal == principal) &&
            (identical(other.interest, interest) ||
                other.interest == interest) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, amount, principal, interest, status, transactionId);

  /// Create a copy of EMIRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EMIRecordImplCopyWith<_$EMIRecordImpl> get copyWith =>
      __$$EMIRecordImplCopyWithImpl<_$EMIRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EMIRecordImplToJson(
      this,
    );
  }
}

abstract class _EMIRecord implements EMIRecord {
  const factory _EMIRecord(
      {required final DateTime date,
      required final double amount,
      required final double principal,
      required final double interest,
      required final String status,
      required final String transactionId}) = _$EMIRecordImpl;

  factory _EMIRecord.fromJson(Map<String, dynamic> json) =
      _$EMIRecordImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get amount;
  @override
  double get principal;
  @override
  double get interest;
  @override
  String get status;
  @override
  String get transactionId;

  /// Create a copy of EMIRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EMIRecordImplCopyWith<_$EMIRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InsuranceInfo _$InsuranceInfoFromJson(Map<String, dynamic> json) {
  return _InsuranceInfo.fromJson(json);
}

/// @nodoc
mixin _$InsuranceInfo {
  String get id => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  String get policyType => throw _privateConstructorUsedError;
  String get policyNumber => throw _privateConstructorUsedError;
  double get sumInsured => throw _privateConstructorUsedError;
  double get premium => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  List<String> get coverages => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<ClaimRecord> get claims => throw _privateConstructorUsedError;

  /// Serializes this InsuranceInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InsuranceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InsuranceInfoCopyWith<InsuranceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsuranceInfoCopyWith<$Res> {
  factory $InsuranceInfoCopyWith(
          InsuranceInfo value, $Res Function(InsuranceInfo) then) =
      _$InsuranceInfoCopyWithImpl<$Res, InsuranceInfo>;
  @useResult
  $Res call(
      {String id,
      String company,
      String policyType,
      String policyNumber,
      double sumInsured,
      double premium,
      DateTime startDate,
      DateTime endDate,
      List<String> coverages,
      String status,
      List<ClaimRecord> claims});
}

/// @nodoc
class _$InsuranceInfoCopyWithImpl<$Res, $Val extends InsuranceInfo>
    implements $InsuranceInfoCopyWith<$Res> {
  _$InsuranceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InsuranceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? company = null,
    Object? policyType = null,
    Object? policyNumber = null,
    Object? sumInsured = null,
    Object? premium = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? coverages = null,
    Object? status = null,
    Object? claims = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      policyType: null == policyType
          ? _value.policyType
          : policyType // ignore: cast_nullable_to_non_nullable
              as String,
      policyNumber: null == policyNumber
          ? _value.policyNumber
          : policyNumber // ignore: cast_nullable_to_non_nullable
              as String,
      sumInsured: null == sumInsured
          ? _value.sumInsured
          : sumInsured // ignore: cast_nullable_to_non_nullable
              as double,
      premium: null == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      coverages: null == coverages
          ? _value.coverages
          : coverages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      claims: null == claims
          ? _value.claims
          : claims // ignore: cast_nullable_to_non_nullable
              as List<ClaimRecord>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsuranceInfoImplCopyWith<$Res>
    implements $InsuranceInfoCopyWith<$Res> {
  factory _$$InsuranceInfoImplCopyWith(
          _$InsuranceInfoImpl value, $Res Function(_$InsuranceInfoImpl) then) =
      __$$InsuranceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String company,
      String policyType,
      String policyNumber,
      double sumInsured,
      double premium,
      DateTime startDate,
      DateTime endDate,
      List<String> coverages,
      String status,
      List<ClaimRecord> claims});
}

/// @nodoc
class __$$InsuranceInfoImplCopyWithImpl<$Res>
    extends _$InsuranceInfoCopyWithImpl<$Res, _$InsuranceInfoImpl>
    implements _$$InsuranceInfoImplCopyWith<$Res> {
  __$$InsuranceInfoImplCopyWithImpl(
      _$InsuranceInfoImpl _value, $Res Function(_$InsuranceInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of InsuranceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? company = null,
    Object? policyType = null,
    Object? policyNumber = null,
    Object? sumInsured = null,
    Object? premium = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? coverages = null,
    Object? status = null,
    Object? claims = null,
  }) {
    return _then(_$InsuranceInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      policyType: null == policyType
          ? _value.policyType
          : policyType // ignore: cast_nullable_to_non_nullable
              as String,
      policyNumber: null == policyNumber
          ? _value.policyNumber
          : policyNumber // ignore: cast_nullable_to_non_nullable
              as String,
      sumInsured: null == sumInsured
          ? _value.sumInsured
          : sumInsured // ignore: cast_nullable_to_non_nullable
              as double,
      premium: null == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      coverages: null == coverages
          ? _value._coverages
          : coverages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      claims: null == claims
          ? _value._claims
          : claims // ignore: cast_nullable_to_non_nullable
              as List<ClaimRecord>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsuranceInfoImpl implements _InsuranceInfo {
  const _$InsuranceInfoImpl(
      {required this.id,
      required this.company,
      required this.policyType,
      required this.policyNumber,
      required this.sumInsured,
      required this.premium,
      required this.startDate,
      required this.endDate,
      required final List<String> coverages,
      required this.status,
      final List<ClaimRecord> claims = const []})
      : _coverages = coverages,
        _claims = claims;

  factory _$InsuranceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsuranceInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String company;
  @override
  final String policyType;
  @override
  final String policyNumber;
  @override
  final double sumInsured;
  @override
  final double premium;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  final List<String> _coverages;
  @override
  List<String> get coverages {
    if (_coverages is EqualUnmodifiableListView) return _coverages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coverages);
  }

  @override
  final String status;
  final List<ClaimRecord> _claims;
  @override
  @JsonKey()
  List<ClaimRecord> get claims {
    if (_claims is EqualUnmodifiableListView) return _claims;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_claims);
  }

  @override
  String toString() {
    return 'InsuranceInfo(id: $id, company: $company, policyType: $policyType, policyNumber: $policyNumber, sumInsured: $sumInsured, premium: $premium, startDate: $startDate, endDate: $endDate, coverages: $coverages, status: $status, claims: $claims)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsuranceInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.policyType, policyType) ||
                other.policyType == policyType) &&
            (identical(other.policyNumber, policyNumber) ||
                other.policyNumber == policyNumber) &&
            (identical(other.sumInsured, sumInsured) ||
                other.sumInsured == sumInsured) &&
            (identical(other.premium, premium) || other.premium == premium) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._coverages, _coverages) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._claims, _claims));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      company,
      policyType,
      policyNumber,
      sumInsured,
      premium,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_coverages),
      status,
      const DeepCollectionEquality().hash(_claims));

  /// Create a copy of InsuranceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InsuranceInfoImplCopyWith<_$InsuranceInfoImpl> get copyWith =>
      __$$InsuranceInfoImplCopyWithImpl<_$InsuranceInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsuranceInfoImplToJson(
      this,
    );
  }
}

abstract class _InsuranceInfo implements InsuranceInfo {
  const factory _InsuranceInfo(
      {required final String id,
      required final String company,
      required final String policyType,
      required final String policyNumber,
      required final double sumInsured,
      required final double premium,
      required final DateTime startDate,
      required final DateTime endDate,
      required final List<String> coverages,
      required final String status,
      final List<ClaimRecord> claims}) = _$InsuranceInfoImpl;

  factory _InsuranceInfo.fromJson(Map<String, dynamic> json) =
      _$InsuranceInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get company;
  @override
  String get policyType;
  @override
  String get policyNumber;
  @override
  double get sumInsured;
  @override
  double get premium;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  List<String> get coverages;
  @override
  String get status;
  @override
  List<ClaimRecord> get claims;

  /// Create a copy of InsuranceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InsuranceInfoImplCopyWith<_$InsuranceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClaimRecord _$ClaimRecordFromJson(Map<String, dynamic> json) {
  return _ClaimRecord.fromJson(json);
}

/// @nodoc
mixin _$ClaimRecord {
  String get id => throw _privateConstructorUsedError;
  DateTime get claimDate => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  double get claimAmount => throw _privateConstructorUsedError;
  double get settledAmount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get settlementDate => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this ClaimRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClaimRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClaimRecordCopyWith<ClaimRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimRecordCopyWith<$Res> {
  factory $ClaimRecordCopyWith(
          ClaimRecord value, $Res Function(ClaimRecord) then) =
      _$ClaimRecordCopyWithImpl<$Res, ClaimRecord>;
  @useResult
  $Res call(
      {String id,
      DateTime claimDate,
      String reason,
      double claimAmount,
      double settledAmount,
      String status,
      DateTime settlementDate,
      String notes});
}

/// @nodoc
class _$ClaimRecordCopyWithImpl<$Res, $Val extends ClaimRecord>
    implements $ClaimRecordCopyWith<$Res> {
  _$ClaimRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClaimRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? claimDate = null,
    Object? reason = null,
    Object? claimAmount = null,
    Object? settledAmount = null,
    Object? status = null,
    Object? settlementDate = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      claimDate: null == claimDate
          ? _value.claimDate
          : claimDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      claimAmount: null == claimAmount
          ? _value.claimAmount
          : claimAmount // ignore: cast_nullable_to_non_nullable
              as double,
      settledAmount: null == settledAmount
          ? _value.settledAmount
          : settledAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      settlementDate: null == settlementDate
          ? _value.settlementDate
          : settlementDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClaimRecordImplCopyWith<$Res>
    implements $ClaimRecordCopyWith<$Res> {
  factory _$$ClaimRecordImplCopyWith(
          _$ClaimRecordImpl value, $Res Function(_$ClaimRecordImpl) then) =
      __$$ClaimRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime claimDate,
      String reason,
      double claimAmount,
      double settledAmount,
      String status,
      DateTime settlementDate,
      String notes});
}

/// @nodoc
class __$$ClaimRecordImplCopyWithImpl<$Res>
    extends _$ClaimRecordCopyWithImpl<$Res, _$ClaimRecordImpl>
    implements _$$ClaimRecordImplCopyWith<$Res> {
  __$$ClaimRecordImplCopyWithImpl(
      _$ClaimRecordImpl _value, $Res Function(_$ClaimRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClaimRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? claimDate = null,
    Object? reason = null,
    Object? claimAmount = null,
    Object? settledAmount = null,
    Object? status = null,
    Object? settlementDate = null,
    Object? notes = null,
  }) {
    return _then(_$ClaimRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      claimDate: null == claimDate
          ? _value.claimDate
          : claimDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      claimAmount: null == claimAmount
          ? _value.claimAmount
          : claimAmount // ignore: cast_nullable_to_non_nullable
              as double,
      settledAmount: null == settledAmount
          ? _value.settledAmount
          : settledAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      settlementDate: null == settlementDate
          ? _value.settlementDate
          : settlementDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClaimRecordImpl implements _ClaimRecord {
  const _$ClaimRecordImpl(
      {required this.id,
      required this.claimDate,
      required this.reason,
      required this.claimAmount,
      required this.settledAmount,
      required this.status,
      required this.settlementDate,
      required this.notes});

  factory _$ClaimRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClaimRecordImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime claimDate;
  @override
  final String reason;
  @override
  final double claimAmount;
  @override
  final double settledAmount;
  @override
  final String status;
  @override
  final DateTime settlementDate;
  @override
  final String notes;

  @override
  String toString() {
    return 'ClaimRecord(id: $id, claimDate: $claimDate, reason: $reason, claimAmount: $claimAmount, settledAmount: $settledAmount, status: $status, settlementDate: $settlementDate, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClaimRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.claimDate, claimDate) ||
                other.claimDate == claimDate) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.claimAmount, claimAmount) ||
                other.claimAmount == claimAmount) &&
            (identical(other.settledAmount, settledAmount) ||
                other.settledAmount == settledAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.settlementDate, settlementDate) ||
                other.settlementDate == settlementDate) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, claimDate, reason,
      claimAmount, settledAmount, status, settlementDate, notes);

  /// Create a copy of ClaimRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClaimRecordImplCopyWith<_$ClaimRecordImpl> get copyWith =>
      __$$ClaimRecordImplCopyWithImpl<_$ClaimRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClaimRecordImplToJson(
      this,
    );
  }
}

abstract class _ClaimRecord implements ClaimRecord {
  const factory _ClaimRecord(
      {required final String id,
      required final DateTime claimDate,
      required final String reason,
      required final double claimAmount,
      required final double settledAmount,
      required final String status,
      required final DateTime settlementDate,
      required final String notes}) = _$ClaimRecordImpl;

  factory _ClaimRecord.fromJson(Map<String, dynamic> json) =
      _$ClaimRecordImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get claimDate;
  @override
  String get reason;
  @override
  double get claimAmount;
  @override
  double get settledAmount;
  @override
  String get status;
  @override
  DateTime get settlementDate;
  @override
  String get notes;

  /// Create a copy of ClaimRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClaimRecordImplCopyWith<_$ClaimRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaxInfo _$TaxInfoFromJson(Map<String, dynamic> json) {
  return _TaxInfo.fromJson(json);
}

/// @nodoc
mixin _$TaxInfo {
  String get assessmentYear => throw _privateConstructorUsedError;
  double get agriculturalIncome => throw _privateConstructorUsedError;
  double get nonAgriculturalIncome => throw _privateConstructorUsedError;
  double get totalTax => throw _privateConstructorUsedError;
  double get tds => throw _privateConstructorUsedError;
  String get filingStatus => throw _privateConstructorUsedError;
  DateTime get filingDate => throw _privateConstructorUsedError;
  String get acknowledgmentNumber => throw _privateConstructorUsedError;

  /// Serializes this TaxInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaxInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaxInfoCopyWith<TaxInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxInfoCopyWith<$Res> {
  factory $TaxInfoCopyWith(TaxInfo value, $Res Function(TaxInfo) then) =
      _$TaxInfoCopyWithImpl<$Res, TaxInfo>;
  @useResult
  $Res call(
      {String assessmentYear,
      double agriculturalIncome,
      double nonAgriculturalIncome,
      double totalTax,
      double tds,
      String filingStatus,
      DateTime filingDate,
      String acknowledgmentNumber});
}

/// @nodoc
class _$TaxInfoCopyWithImpl<$Res, $Val extends TaxInfo>
    implements $TaxInfoCopyWith<$Res> {
  _$TaxInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaxInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assessmentYear = null,
    Object? agriculturalIncome = null,
    Object? nonAgriculturalIncome = null,
    Object? totalTax = null,
    Object? tds = null,
    Object? filingStatus = null,
    Object? filingDate = null,
    Object? acknowledgmentNumber = null,
  }) {
    return _then(_value.copyWith(
      assessmentYear: null == assessmentYear
          ? _value.assessmentYear
          : assessmentYear // ignore: cast_nullable_to_non_nullable
              as String,
      agriculturalIncome: null == agriculturalIncome
          ? _value.agriculturalIncome
          : agriculturalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      nonAgriculturalIncome: null == nonAgriculturalIncome
          ? _value.nonAgriculturalIncome
          : nonAgriculturalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      tds: null == tds
          ? _value.tds
          : tds // ignore: cast_nullable_to_non_nullable
              as double,
      filingStatus: null == filingStatus
          ? _value.filingStatus
          : filingStatus // ignore: cast_nullable_to_non_nullable
              as String,
      filingDate: null == filingDate
          ? _value.filingDate
          : filingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      acknowledgmentNumber: null == acknowledgmentNumber
          ? _value.acknowledgmentNumber
          : acknowledgmentNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxInfoImplCopyWith<$Res> implements $TaxInfoCopyWith<$Res> {
  factory _$$TaxInfoImplCopyWith(
          _$TaxInfoImpl value, $Res Function(_$TaxInfoImpl) then) =
      __$$TaxInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String assessmentYear,
      double agriculturalIncome,
      double nonAgriculturalIncome,
      double totalTax,
      double tds,
      String filingStatus,
      DateTime filingDate,
      String acknowledgmentNumber});
}

/// @nodoc
class __$$TaxInfoImplCopyWithImpl<$Res>
    extends _$TaxInfoCopyWithImpl<$Res, _$TaxInfoImpl>
    implements _$$TaxInfoImplCopyWith<$Res> {
  __$$TaxInfoImplCopyWithImpl(
      _$TaxInfoImpl _value, $Res Function(_$TaxInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaxInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assessmentYear = null,
    Object? agriculturalIncome = null,
    Object? nonAgriculturalIncome = null,
    Object? totalTax = null,
    Object? tds = null,
    Object? filingStatus = null,
    Object? filingDate = null,
    Object? acknowledgmentNumber = null,
  }) {
    return _then(_$TaxInfoImpl(
      assessmentYear: null == assessmentYear
          ? _value.assessmentYear
          : assessmentYear // ignore: cast_nullable_to_non_nullable
              as String,
      agriculturalIncome: null == agriculturalIncome
          ? _value.agriculturalIncome
          : agriculturalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      nonAgriculturalIncome: null == nonAgriculturalIncome
          ? _value.nonAgriculturalIncome
          : nonAgriculturalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      tds: null == tds
          ? _value.tds
          : tds // ignore: cast_nullable_to_non_nullable
              as double,
      filingStatus: null == filingStatus
          ? _value.filingStatus
          : filingStatus // ignore: cast_nullable_to_non_nullable
              as String,
      filingDate: null == filingDate
          ? _value.filingDate
          : filingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      acknowledgmentNumber: null == acknowledgmentNumber
          ? _value.acknowledgmentNumber
          : acknowledgmentNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxInfoImpl implements _TaxInfo {
  const _$TaxInfoImpl(
      {required this.assessmentYear,
      required this.agriculturalIncome,
      required this.nonAgriculturalIncome,
      required this.totalTax,
      required this.tds,
      required this.filingStatus,
      required this.filingDate,
      required this.acknowledgmentNumber});

  factory _$TaxInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxInfoImplFromJson(json);

  @override
  final String assessmentYear;
  @override
  final double agriculturalIncome;
  @override
  final double nonAgriculturalIncome;
  @override
  final double totalTax;
  @override
  final double tds;
  @override
  final String filingStatus;
  @override
  final DateTime filingDate;
  @override
  final String acknowledgmentNumber;

  @override
  String toString() {
    return 'TaxInfo(assessmentYear: $assessmentYear, agriculturalIncome: $agriculturalIncome, nonAgriculturalIncome: $nonAgriculturalIncome, totalTax: $totalTax, tds: $tds, filingStatus: $filingStatus, filingDate: $filingDate, acknowledgmentNumber: $acknowledgmentNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxInfoImpl &&
            (identical(other.assessmentYear, assessmentYear) ||
                other.assessmentYear == assessmentYear) &&
            (identical(other.agriculturalIncome, agriculturalIncome) ||
                other.agriculturalIncome == agriculturalIncome) &&
            (identical(other.nonAgriculturalIncome, nonAgriculturalIncome) ||
                other.nonAgriculturalIncome == nonAgriculturalIncome) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.tds, tds) || other.tds == tds) &&
            (identical(other.filingStatus, filingStatus) ||
                other.filingStatus == filingStatus) &&
            (identical(other.filingDate, filingDate) ||
                other.filingDate == filingDate) &&
            (identical(other.acknowledgmentNumber, acknowledgmentNumber) ||
                other.acknowledgmentNumber == acknowledgmentNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      assessmentYear,
      agriculturalIncome,
      nonAgriculturalIncome,
      totalTax,
      tds,
      filingStatus,
      filingDate,
      acknowledgmentNumber);

  /// Create a copy of TaxInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxInfoImplCopyWith<_$TaxInfoImpl> get copyWith =>
      __$$TaxInfoImplCopyWithImpl<_$TaxInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxInfoImplToJson(
      this,
    );
  }
}

abstract class _TaxInfo implements TaxInfo {
  const factory _TaxInfo(
      {required final String assessmentYear,
      required final double agriculturalIncome,
      required final double nonAgriculturalIncome,
      required final double totalTax,
      required final double tds,
      required final String filingStatus,
      required final DateTime filingDate,
      required final String acknowledgmentNumber}) = _$TaxInfoImpl;

  factory _TaxInfo.fromJson(Map<String, dynamic> json) = _$TaxInfoImpl.fromJson;

  @override
  String get assessmentYear;
  @override
  double get agriculturalIncome;
  @override
  double get nonAgriculturalIncome;
  @override
  double get totalTax;
  @override
  double get tds;
  @override
  String get filingStatus;
  @override
  DateTime get filingDate;
  @override
  String get acknowledgmentNumber;

  /// Create a copy of TaxInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaxInfoImplCopyWith<_$TaxInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
