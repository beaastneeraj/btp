// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'farm_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) {
  return _WeatherData.fromJson(json);
}

/// @nodoc
mixin _$WeatherData {
  double get temperature => throw _privateConstructorUsedError;
  double get humidity => throw _privateConstructorUsedError;
  double get uvIndex => throw _privateConstructorUsedError;
  double get windSpeed => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  List<HourlyForecast> get hourlyForecast => throw _privateConstructorUsedError;
  List<DailyForecast> get dailyForecast => throw _privateConstructorUsedError;

  /// Serializes this WeatherData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherDataCopyWith<WeatherData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataCopyWith<$Res> {
  factory $WeatherDataCopyWith(
          WeatherData value, $Res Function(WeatherData) then) =
      _$WeatherDataCopyWithImpl<$Res, WeatherData>;
  @useResult
  $Res call(
      {double temperature,
      double humidity,
      double uvIndex,
      double windSpeed,
      String description,
      DateTime timestamp,
      List<HourlyForecast> hourlyForecast,
      List<DailyForecast> dailyForecast});
}

/// @nodoc
class _$WeatherDataCopyWithImpl<$Res, $Val extends WeatherData>
    implements $WeatherDataCopyWith<$Res> {
  _$WeatherDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? humidity = null,
    Object? uvIndex = null,
    Object? windSpeed = null,
    Object? description = null,
    Object? timestamp = null,
    Object? hourlyForecast = null,
    Object? dailyForecast = null,
  }) {
    return _then(_value.copyWith(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      uvIndex: null == uvIndex
          ? _value.uvIndex
          : uvIndex // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hourlyForecast: null == hourlyForecast
          ? _value.hourlyForecast
          : hourlyForecast // ignore: cast_nullable_to_non_nullable
              as List<HourlyForecast>,
      dailyForecast: null == dailyForecast
          ? _value.dailyForecast
          : dailyForecast // ignore: cast_nullable_to_non_nullable
              as List<DailyForecast>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherDataImplCopyWith<$Res>
    implements $WeatherDataCopyWith<$Res> {
  factory _$$WeatherDataImplCopyWith(
          _$WeatherDataImpl value, $Res Function(_$WeatherDataImpl) then) =
      __$$WeatherDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double temperature,
      double humidity,
      double uvIndex,
      double windSpeed,
      String description,
      DateTime timestamp,
      List<HourlyForecast> hourlyForecast,
      List<DailyForecast> dailyForecast});
}

/// @nodoc
class __$$WeatherDataImplCopyWithImpl<$Res>
    extends _$WeatherDataCopyWithImpl<$Res, _$WeatherDataImpl>
    implements _$$WeatherDataImplCopyWith<$Res> {
  __$$WeatherDataImplCopyWithImpl(
      _$WeatherDataImpl _value, $Res Function(_$WeatherDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? humidity = null,
    Object? uvIndex = null,
    Object? windSpeed = null,
    Object? description = null,
    Object? timestamp = null,
    Object? hourlyForecast = null,
    Object? dailyForecast = null,
  }) {
    return _then(_$WeatherDataImpl(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      uvIndex: null == uvIndex
          ? _value.uvIndex
          : uvIndex // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hourlyForecast: null == hourlyForecast
          ? _value._hourlyForecast
          : hourlyForecast // ignore: cast_nullable_to_non_nullable
              as List<HourlyForecast>,
      dailyForecast: null == dailyForecast
          ? _value._dailyForecast
          : dailyForecast // ignore: cast_nullable_to_non_nullable
              as List<DailyForecast>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDataImpl implements _WeatherData {
  const _$WeatherDataImpl(
      {required this.temperature,
      required this.humidity,
      required this.uvIndex,
      required this.windSpeed,
      required this.description,
      required this.timestamp,
      final List<HourlyForecast> hourlyForecast = const [],
      final List<DailyForecast> dailyForecast = const []})
      : _hourlyForecast = hourlyForecast,
        _dailyForecast = dailyForecast;

  factory _$WeatherDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDataImplFromJson(json);

  @override
  final double temperature;
  @override
  final double humidity;
  @override
  final double uvIndex;
  @override
  final double windSpeed;
  @override
  final String description;
  @override
  final DateTime timestamp;
  final List<HourlyForecast> _hourlyForecast;
  @override
  @JsonKey()
  List<HourlyForecast> get hourlyForecast {
    if (_hourlyForecast is EqualUnmodifiableListView) return _hourlyForecast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyForecast);
  }

  final List<DailyForecast> _dailyForecast;
  @override
  @JsonKey()
  List<DailyForecast> get dailyForecast {
    if (_dailyForecast is EqualUnmodifiableListView) return _dailyForecast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyForecast);
  }

  @override
  String toString() {
    return 'WeatherData(temperature: $temperature, humidity: $humidity, uvIndex: $uvIndex, windSpeed: $windSpeed, description: $description, timestamp: $timestamp, hourlyForecast: $hourlyForecast, dailyForecast: $dailyForecast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDataImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.uvIndex, uvIndex) || other.uvIndex == uvIndex) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._hourlyForecast, _hourlyForecast) &&
            const DeepCollectionEquality()
                .equals(other._dailyForecast, _dailyForecast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      temperature,
      humidity,
      uvIndex,
      windSpeed,
      description,
      timestamp,
      const DeepCollectionEquality().hash(_hourlyForecast),
      const DeepCollectionEquality().hash(_dailyForecast));

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDataImplCopyWith<_$WeatherDataImpl> get copyWith =>
      __$$WeatherDataImplCopyWithImpl<_$WeatherDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDataImplToJson(
      this,
    );
  }
}

abstract class _WeatherData implements WeatherData {
  const factory _WeatherData(
      {required final double temperature,
      required final double humidity,
      required final double uvIndex,
      required final double windSpeed,
      required final String description,
      required final DateTime timestamp,
      final List<HourlyForecast> hourlyForecast,
      final List<DailyForecast> dailyForecast}) = _$WeatherDataImpl;

  factory _WeatherData.fromJson(Map<String, dynamic> json) =
      _$WeatherDataImpl.fromJson;

  @override
  double get temperature;
  @override
  double get humidity;
  @override
  double get uvIndex;
  @override
  double get windSpeed;
  @override
  String get description;
  @override
  DateTime get timestamp;
  @override
  List<HourlyForecast> get hourlyForecast;
  @override
  List<DailyForecast> get dailyForecast;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherDataImplCopyWith<_$WeatherDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HourlyForecast _$HourlyForecastFromJson(Map<String, dynamic> json) {
  return _HourlyForecast.fromJson(json);
}

/// @nodoc
mixin _$HourlyForecast {
  DateTime get time => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  double get humidity => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this HourlyForecast to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlyForecastCopyWith<HourlyForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyForecastCopyWith<$Res> {
  factory $HourlyForecastCopyWith(
          HourlyForecast value, $Res Function(HourlyForecast) then) =
      _$HourlyForecastCopyWithImpl<$Res, HourlyForecast>;
  @useResult
  $Res call(
      {DateTime time, double temperature, double humidity, String description});
}

/// @nodoc
class _$HourlyForecastCopyWithImpl<$Res, $Val extends HourlyForecast>
    implements $HourlyForecastCopyWith<$Res> {
  _$HourlyForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature = null,
    Object? humidity = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HourlyForecastImplCopyWith<$Res>
    implements $HourlyForecastCopyWith<$Res> {
  factory _$$HourlyForecastImplCopyWith(_$HourlyForecastImpl value,
          $Res Function(_$HourlyForecastImpl) then) =
      __$$HourlyForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime time, double temperature, double humidity, String description});
}

/// @nodoc
class __$$HourlyForecastImplCopyWithImpl<$Res>
    extends _$HourlyForecastCopyWithImpl<$Res, _$HourlyForecastImpl>
    implements _$$HourlyForecastImplCopyWith<$Res> {
  __$$HourlyForecastImplCopyWithImpl(
      _$HourlyForecastImpl _value, $Res Function(_$HourlyForecastImpl) _then)
      : super(_value, _then);

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature = null,
    Object? humidity = null,
    Object? description = null,
  }) {
    return _then(_$HourlyForecastImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
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
class _$HourlyForecastImpl implements _HourlyForecast {
  const _$HourlyForecastImpl(
      {required this.time,
      required this.temperature,
      required this.humidity,
      required this.description});

  factory _$HourlyForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyForecastImplFromJson(json);

  @override
  final DateTime time;
  @override
  final double temperature;
  @override
  final double humidity;
  @override
  final String description;

  @override
  String toString() {
    return 'HourlyForecast(time: $time, temperature: $temperature, humidity: $humidity, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyForecastImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, time, temperature, humidity, description);

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyForecastImplCopyWith<_$HourlyForecastImpl> get copyWith =>
      __$$HourlyForecastImplCopyWithImpl<_$HourlyForecastImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyForecastImplToJson(
      this,
    );
  }
}

abstract class _HourlyForecast implements HourlyForecast {
  const factory _HourlyForecast(
      {required final DateTime time,
      required final double temperature,
      required final double humidity,
      required final String description}) = _$HourlyForecastImpl;

  factory _HourlyForecast.fromJson(Map<String, dynamic> json) =
      _$HourlyForecastImpl.fromJson;

  @override
  DateTime get time;
  @override
  double get temperature;
  @override
  double get humidity;
  @override
  String get description;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlyForecastImplCopyWith<_$HourlyForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyForecast _$DailyForecastFromJson(Map<String, dynamic> json) {
  return _DailyForecast.fromJson(json);
}

/// @nodoc
mixin _$DailyForecast {
  DateTime get date => throw _privateConstructorUsedError;
  double get minTemp => throw _privateConstructorUsedError;
  double get maxTemp => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get precipitationChance => throw _privateConstructorUsedError;

  /// Serializes this DailyForecast to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyForecastCopyWith<DailyForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyForecastCopyWith<$Res> {
  factory $DailyForecastCopyWith(
          DailyForecast value, $Res Function(DailyForecast) then) =
      _$DailyForecastCopyWithImpl<$Res, DailyForecast>;
  @useResult
  $Res call(
      {DateTime date,
      double minTemp,
      double maxTemp,
      String description,
      double precipitationChance});
}

/// @nodoc
class _$DailyForecastCopyWithImpl<$Res, $Val extends DailyForecast>
    implements $DailyForecastCopyWith<$Res> {
  _$DailyForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? minTemp = null,
    Object? maxTemp = null,
    Object? description = null,
    Object? precipitationChance = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minTemp: null == minTemp
          ? _value.minTemp
          : minTemp // ignore: cast_nullable_to_non_nullable
              as double,
      maxTemp: null == maxTemp
          ? _value.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      precipitationChance: null == precipitationChance
          ? _value.precipitationChance
          : precipitationChance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyForecastImplCopyWith<$Res>
    implements $DailyForecastCopyWith<$Res> {
  factory _$$DailyForecastImplCopyWith(
          _$DailyForecastImpl value, $Res Function(_$DailyForecastImpl) then) =
      __$$DailyForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      double minTemp,
      double maxTemp,
      String description,
      double precipitationChance});
}

/// @nodoc
class __$$DailyForecastImplCopyWithImpl<$Res>
    extends _$DailyForecastCopyWithImpl<$Res, _$DailyForecastImpl>
    implements _$$DailyForecastImplCopyWith<$Res> {
  __$$DailyForecastImplCopyWithImpl(
      _$DailyForecastImpl _value, $Res Function(_$DailyForecastImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? minTemp = null,
    Object? maxTemp = null,
    Object? description = null,
    Object? precipitationChance = null,
  }) {
    return _then(_$DailyForecastImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minTemp: null == minTemp
          ? _value.minTemp
          : minTemp // ignore: cast_nullable_to_non_nullable
              as double,
      maxTemp: null == maxTemp
          ? _value.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      precipitationChance: null == precipitationChance
          ? _value.precipitationChance
          : precipitationChance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyForecastImpl implements _DailyForecast {
  const _$DailyForecastImpl(
      {required this.date,
      required this.minTemp,
      required this.maxTemp,
      required this.description,
      required this.precipitationChance});

  factory _$DailyForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyForecastImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double minTemp;
  @override
  final double maxTemp;
  @override
  final String description;
  @override
  final double precipitationChance;

  @override
  String toString() {
    return 'DailyForecast(date: $date, minTemp: $minTemp, maxTemp: $maxTemp, description: $description, precipitationChance: $precipitationChance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyForecastImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.minTemp, minTemp) || other.minTemp == minTemp) &&
            (identical(other.maxTemp, maxTemp) || other.maxTemp == maxTemp) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.precipitationChance, precipitationChance) ||
                other.precipitationChance == precipitationChance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, minTemp, maxTemp, description, precipitationChance);

  /// Create a copy of DailyForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyForecastImplCopyWith<_$DailyForecastImpl> get copyWith =>
      __$$DailyForecastImplCopyWithImpl<_$DailyForecastImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyForecastImplToJson(
      this,
    );
  }
}

abstract class _DailyForecast implements DailyForecast {
  const factory _DailyForecast(
      {required final DateTime date,
      required final double minTemp,
      required final double maxTemp,
      required final String description,
      required final double precipitationChance}) = _$DailyForecastImpl;

  factory _DailyForecast.fromJson(Map<String, dynamic> json) =
      _$DailyForecastImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get minTemp;
  @override
  double get maxTemp;
  @override
  String get description;
  @override
  double get precipitationChance;

  /// Create a copy of DailyForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyForecastImplCopyWith<_$DailyForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CropSection _$CropSectionFromJson(Map<String, dynamic> json) {
  return _CropSection.fromJson(json);
}

/// @nodoc
mixin _$CropSection {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get cropType => throw _privateConstructorUsedError;
  double get area => throw _privateConstructorUsedError;
  CropHealth get health => throw _privateConstructorUsedError;
  PlantingInfo get plantingInfo => throw _privateConstructorUsedError;
  List<SensorReading> get sensorReadings => throw _privateConstructorUsedError;
  List<AIInsight> get aiInsights => throw _privateConstructorUsedError;

  /// Serializes this CropSection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CropSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CropSectionCopyWith<CropSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropSectionCopyWith<$Res> {
  factory $CropSectionCopyWith(
          CropSection value, $Res Function(CropSection) then) =
      _$CropSectionCopyWithImpl<$Res, CropSection>;
  @useResult
  $Res call(
      {String id,
      String name,
      String cropType,
      double area,
      CropHealth health,
      PlantingInfo plantingInfo,
      List<SensorReading> sensorReadings,
      List<AIInsight> aiInsights});

  $CropHealthCopyWith<$Res> get health;
  $PlantingInfoCopyWith<$Res> get plantingInfo;
}

/// @nodoc
class _$CropSectionCopyWithImpl<$Res, $Val extends CropSection>
    implements $CropSectionCopyWith<$Res> {
  _$CropSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CropSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cropType = null,
    Object? area = null,
    Object? health = null,
    Object? plantingInfo = null,
    Object? sensorReadings = null,
    Object? aiInsights = null,
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
      cropType: null == cropType
          ? _value.cropType
          : cropType // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double,
      health: null == health
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as CropHealth,
      plantingInfo: null == plantingInfo
          ? _value.plantingInfo
          : plantingInfo // ignore: cast_nullable_to_non_nullable
              as PlantingInfo,
      sensorReadings: null == sensorReadings
          ? _value.sensorReadings
          : sensorReadings // ignore: cast_nullable_to_non_nullable
              as List<SensorReading>,
      aiInsights: null == aiInsights
          ? _value.aiInsights
          : aiInsights // ignore: cast_nullable_to_non_nullable
              as List<AIInsight>,
    ) as $Val);
  }

  /// Create a copy of CropSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CropHealthCopyWith<$Res> get health {
    return $CropHealthCopyWith<$Res>(_value.health, (value) {
      return _then(_value.copyWith(health: value) as $Val);
    });
  }

  /// Create a copy of CropSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlantingInfoCopyWith<$Res> get plantingInfo {
    return $PlantingInfoCopyWith<$Res>(_value.plantingInfo, (value) {
      return _then(_value.copyWith(plantingInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CropSectionImplCopyWith<$Res>
    implements $CropSectionCopyWith<$Res> {
  factory _$$CropSectionImplCopyWith(
          _$CropSectionImpl value, $Res Function(_$CropSectionImpl) then) =
      __$$CropSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String cropType,
      double area,
      CropHealth health,
      PlantingInfo plantingInfo,
      List<SensorReading> sensorReadings,
      List<AIInsight> aiInsights});

  @override
  $CropHealthCopyWith<$Res> get health;
  @override
  $PlantingInfoCopyWith<$Res> get plantingInfo;
}

/// @nodoc
class __$$CropSectionImplCopyWithImpl<$Res>
    extends _$CropSectionCopyWithImpl<$Res, _$CropSectionImpl>
    implements _$$CropSectionImplCopyWith<$Res> {
  __$$CropSectionImplCopyWithImpl(
      _$CropSectionImpl _value, $Res Function(_$CropSectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CropSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cropType = null,
    Object? area = null,
    Object? health = null,
    Object? plantingInfo = null,
    Object? sensorReadings = null,
    Object? aiInsights = null,
  }) {
    return _then(_$CropSectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cropType: null == cropType
          ? _value.cropType
          : cropType // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double,
      health: null == health
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as CropHealth,
      plantingInfo: null == plantingInfo
          ? _value.plantingInfo
          : plantingInfo // ignore: cast_nullable_to_non_nullable
              as PlantingInfo,
      sensorReadings: null == sensorReadings
          ? _value._sensorReadings
          : sensorReadings // ignore: cast_nullable_to_non_nullable
              as List<SensorReading>,
      aiInsights: null == aiInsights
          ? _value._aiInsights
          : aiInsights // ignore: cast_nullable_to_non_nullable
              as List<AIInsight>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CropSectionImpl implements _CropSection {
  const _$CropSectionImpl(
      {required this.id,
      required this.name,
      required this.cropType,
      required this.area,
      required this.health,
      required this.plantingInfo,
      required final List<SensorReading> sensorReadings,
      final List<AIInsight> aiInsights = const []})
      : _sensorReadings = sensorReadings,
        _aiInsights = aiInsights;

  factory _$CropSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CropSectionImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String cropType;
  @override
  final double area;
  @override
  final CropHealth health;
  @override
  final PlantingInfo plantingInfo;
  final List<SensorReading> _sensorReadings;
  @override
  List<SensorReading> get sensorReadings {
    if (_sensorReadings is EqualUnmodifiableListView) return _sensorReadings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sensorReadings);
  }

  final List<AIInsight> _aiInsights;
  @override
  @JsonKey()
  List<AIInsight> get aiInsights {
    if (_aiInsights is EqualUnmodifiableListView) return _aiInsights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aiInsights);
  }

  @override
  String toString() {
    return 'CropSection(id: $id, name: $name, cropType: $cropType, area: $area, health: $health, plantingInfo: $plantingInfo, sensorReadings: $sensorReadings, aiInsights: $aiInsights)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CropSectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cropType, cropType) ||
                other.cropType == cropType) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.plantingInfo, plantingInfo) ||
                other.plantingInfo == plantingInfo) &&
            const DeepCollectionEquality()
                .equals(other._sensorReadings, _sensorReadings) &&
            const DeepCollectionEquality()
                .equals(other._aiInsights, _aiInsights));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      cropType,
      area,
      health,
      plantingInfo,
      const DeepCollectionEquality().hash(_sensorReadings),
      const DeepCollectionEquality().hash(_aiInsights));

  /// Create a copy of CropSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CropSectionImplCopyWith<_$CropSectionImpl> get copyWith =>
      __$$CropSectionImplCopyWithImpl<_$CropSectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CropSectionImplToJson(
      this,
    );
  }
}

abstract class _CropSection implements CropSection {
  const factory _CropSection(
      {required final String id,
      required final String name,
      required final String cropType,
      required final double area,
      required final CropHealth health,
      required final PlantingInfo plantingInfo,
      required final List<SensorReading> sensorReadings,
      final List<AIInsight> aiInsights}) = _$CropSectionImpl;

  factory _CropSection.fromJson(Map<String, dynamic> json) =
      _$CropSectionImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get cropType;
  @override
  double get area;
  @override
  CropHealth get health;
  @override
  PlantingInfo get plantingInfo;
  @override
  List<SensorReading> get sensorReadings;
  @override
  List<AIInsight> get aiInsights;

  /// Create a copy of CropSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CropSectionImplCopyWith<_$CropSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CropHealth _$CropHealthFromJson(Map<String, dynamic> json) {
  return _CropHealth.fromJson(json);
}

/// @nodoc
mixin _$CropHealth {
  int get healthScore => throw _privateConstructorUsedError;
  double get growthRate => throw _privateConstructorUsedError;
  String get diseaseRisk => throw _privateConstructorUsedError;
  int get yieldForecast => throw _privateConstructorUsedError;
  DateTime get lastAssessment => throw _privateConstructorUsedError;
  List<String> get issues => throw _privateConstructorUsedError;
  List<String> get recommendations => throw _privateConstructorUsedError;

  /// Serializes this CropHealth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CropHealth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CropHealthCopyWith<CropHealth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropHealthCopyWith<$Res> {
  factory $CropHealthCopyWith(
          CropHealth value, $Res Function(CropHealth) then) =
      _$CropHealthCopyWithImpl<$Res, CropHealth>;
  @useResult
  $Res call(
      {int healthScore,
      double growthRate,
      String diseaseRisk,
      int yieldForecast,
      DateTime lastAssessment,
      List<String> issues,
      List<String> recommendations});
}

/// @nodoc
class _$CropHealthCopyWithImpl<$Res, $Val extends CropHealth>
    implements $CropHealthCopyWith<$Res> {
  _$CropHealthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CropHealth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? healthScore = null,
    Object? growthRate = null,
    Object? diseaseRisk = null,
    Object? yieldForecast = null,
    Object? lastAssessment = null,
    Object? issues = null,
    Object? recommendations = null,
  }) {
    return _then(_value.copyWith(
      healthScore: null == healthScore
          ? _value.healthScore
          : healthScore // ignore: cast_nullable_to_non_nullable
              as int,
      growthRate: null == growthRate
          ? _value.growthRate
          : growthRate // ignore: cast_nullable_to_non_nullable
              as double,
      diseaseRisk: null == diseaseRisk
          ? _value.diseaseRisk
          : diseaseRisk // ignore: cast_nullable_to_non_nullable
              as String,
      yieldForecast: null == yieldForecast
          ? _value.yieldForecast
          : yieldForecast // ignore: cast_nullable_to_non_nullable
              as int,
      lastAssessment: null == lastAssessment
          ? _value.lastAssessment
          : lastAssessment // ignore: cast_nullable_to_non_nullable
              as DateTime,
      issues: null == issues
          ? _value.issues
          : issues // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CropHealthImplCopyWith<$Res>
    implements $CropHealthCopyWith<$Res> {
  factory _$$CropHealthImplCopyWith(
          _$CropHealthImpl value, $Res Function(_$CropHealthImpl) then) =
      __$$CropHealthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int healthScore,
      double growthRate,
      String diseaseRisk,
      int yieldForecast,
      DateTime lastAssessment,
      List<String> issues,
      List<String> recommendations});
}

/// @nodoc
class __$$CropHealthImplCopyWithImpl<$Res>
    extends _$CropHealthCopyWithImpl<$Res, _$CropHealthImpl>
    implements _$$CropHealthImplCopyWith<$Res> {
  __$$CropHealthImplCopyWithImpl(
      _$CropHealthImpl _value, $Res Function(_$CropHealthImpl) _then)
      : super(_value, _then);

  /// Create a copy of CropHealth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? healthScore = null,
    Object? growthRate = null,
    Object? diseaseRisk = null,
    Object? yieldForecast = null,
    Object? lastAssessment = null,
    Object? issues = null,
    Object? recommendations = null,
  }) {
    return _then(_$CropHealthImpl(
      healthScore: null == healthScore
          ? _value.healthScore
          : healthScore // ignore: cast_nullable_to_non_nullable
              as int,
      growthRate: null == growthRate
          ? _value.growthRate
          : growthRate // ignore: cast_nullable_to_non_nullable
              as double,
      diseaseRisk: null == diseaseRisk
          ? _value.diseaseRisk
          : diseaseRisk // ignore: cast_nullable_to_non_nullable
              as String,
      yieldForecast: null == yieldForecast
          ? _value.yieldForecast
          : yieldForecast // ignore: cast_nullable_to_non_nullable
              as int,
      lastAssessment: null == lastAssessment
          ? _value.lastAssessment
          : lastAssessment // ignore: cast_nullable_to_non_nullable
              as DateTime,
      issues: null == issues
          ? _value._issues
          : issues // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recommendations: null == recommendations
          ? _value._recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CropHealthImpl implements _CropHealth {
  const _$CropHealthImpl(
      {required this.healthScore,
      required this.growthRate,
      required this.diseaseRisk,
      required this.yieldForecast,
      required this.lastAssessment,
      final List<String> issues = const [],
      final List<String> recommendations = const []})
      : _issues = issues,
        _recommendations = recommendations;

  factory _$CropHealthImpl.fromJson(Map<String, dynamic> json) =>
      _$$CropHealthImplFromJson(json);

  @override
  final int healthScore;
  @override
  final double growthRate;
  @override
  final String diseaseRisk;
  @override
  final int yieldForecast;
  @override
  final DateTime lastAssessment;
  final List<String> _issues;
  @override
  @JsonKey()
  List<String> get issues {
    if (_issues is EqualUnmodifiableListView) return _issues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_issues);
  }

  final List<String> _recommendations;
  @override
  @JsonKey()
  List<String> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  String toString() {
    return 'CropHealth(healthScore: $healthScore, growthRate: $growthRate, diseaseRisk: $diseaseRisk, yieldForecast: $yieldForecast, lastAssessment: $lastAssessment, issues: $issues, recommendations: $recommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CropHealthImpl &&
            (identical(other.healthScore, healthScore) ||
                other.healthScore == healthScore) &&
            (identical(other.growthRate, growthRate) ||
                other.growthRate == growthRate) &&
            (identical(other.diseaseRisk, diseaseRisk) ||
                other.diseaseRisk == diseaseRisk) &&
            (identical(other.yieldForecast, yieldForecast) ||
                other.yieldForecast == yieldForecast) &&
            (identical(other.lastAssessment, lastAssessment) ||
                other.lastAssessment == lastAssessment) &&
            const DeepCollectionEquality().equals(other._issues, _issues) &&
            const DeepCollectionEquality()
                .equals(other._recommendations, _recommendations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      healthScore,
      growthRate,
      diseaseRisk,
      yieldForecast,
      lastAssessment,
      const DeepCollectionEquality().hash(_issues),
      const DeepCollectionEquality().hash(_recommendations));

  /// Create a copy of CropHealth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CropHealthImplCopyWith<_$CropHealthImpl> get copyWith =>
      __$$CropHealthImplCopyWithImpl<_$CropHealthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CropHealthImplToJson(
      this,
    );
  }
}

abstract class _CropHealth implements CropHealth {
  const factory _CropHealth(
      {required final int healthScore,
      required final double growthRate,
      required final String diseaseRisk,
      required final int yieldForecast,
      required final DateTime lastAssessment,
      final List<String> issues,
      final List<String> recommendations}) = _$CropHealthImpl;

  factory _CropHealth.fromJson(Map<String, dynamic> json) =
      _$CropHealthImpl.fromJson;

  @override
  int get healthScore;
  @override
  double get growthRate;
  @override
  String get diseaseRisk;
  @override
  int get yieldForecast;
  @override
  DateTime get lastAssessment;
  @override
  List<String> get issues;
  @override
  List<String> get recommendations;

  /// Create a copy of CropHealth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CropHealthImplCopyWith<_$CropHealthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlantingInfo _$PlantingInfoFromJson(Map<String, dynamic> json) {
  return _PlantingInfo.fromJson(json);
}

/// @nodoc
mixin _$PlantingInfo {
  DateTime get plantedDate => throw _privateConstructorUsedError;
  DateTime get expectedHarvestDate => throw _privateConstructorUsedError;
  String get variety => throw _privateConstructorUsedError;
  int get plantCount => throw _privateConstructorUsedError;
  double get spacing => throw _privateConstructorUsedError;

  /// Serializes this PlantingInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlantingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantingInfoCopyWith<PlantingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantingInfoCopyWith<$Res> {
  factory $PlantingInfoCopyWith(
          PlantingInfo value, $Res Function(PlantingInfo) then) =
      _$PlantingInfoCopyWithImpl<$Res, PlantingInfo>;
  @useResult
  $Res call(
      {DateTime plantedDate,
      DateTime expectedHarvestDate,
      String variety,
      int plantCount,
      double spacing});
}

/// @nodoc
class _$PlantingInfoCopyWithImpl<$Res, $Val extends PlantingInfo>
    implements $PlantingInfoCopyWith<$Res> {
  _$PlantingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plantedDate = null,
    Object? expectedHarvestDate = null,
    Object? variety = null,
    Object? plantCount = null,
    Object? spacing = null,
  }) {
    return _then(_value.copyWith(
      plantedDate: null == plantedDate
          ? _value.plantedDate
          : plantedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedHarvestDate: null == expectedHarvestDate
          ? _value.expectedHarvestDate
          : expectedHarvestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      variety: null == variety
          ? _value.variety
          : variety // ignore: cast_nullable_to_non_nullable
              as String,
      plantCount: null == plantCount
          ? _value.plantCount
          : plantCount // ignore: cast_nullable_to_non_nullable
              as int,
      spacing: null == spacing
          ? _value.spacing
          : spacing // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlantingInfoImplCopyWith<$Res>
    implements $PlantingInfoCopyWith<$Res> {
  factory _$$PlantingInfoImplCopyWith(
          _$PlantingInfoImpl value, $Res Function(_$PlantingInfoImpl) then) =
      __$$PlantingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime plantedDate,
      DateTime expectedHarvestDate,
      String variety,
      int plantCount,
      double spacing});
}

/// @nodoc
class __$$PlantingInfoImplCopyWithImpl<$Res>
    extends _$PlantingInfoCopyWithImpl<$Res, _$PlantingInfoImpl>
    implements _$$PlantingInfoImplCopyWith<$Res> {
  __$$PlantingInfoImplCopyWithImpl(
      _$PlantingInfoImpl _value, $Res Function(_$PlantingInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plantedDate = null,
    Object? expectedHarvestDate = null,
    Object? variety = null,
    Object? plantCount = null,
    Object? spacing = null,
  }) {
    return _then(_$PlantingInfoImpl(
      plantedDate: null == plantedDate
          ? _value.plantedDate
          : plantedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedHarvestDate: null == expectedHarvestDate
          ? _value.expectedHarvestDate
          : expectedHarvestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      variety: null == variety
          ? _value.variety
          : variety // ignore: cast_nullable_to_non_nullable
              as String,
      plantCount: null == plantCount
          ? _value.plantCount
          : plantCount // ignore: cast_nullable_to_non_nullable
              as int,
      spacing: null == spacing
          ? _value.spacing
          : spacing // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlantingInfoImpl implements _PlantingInfo {
  const _$PlantingInfoImpl(
      {required this.plantedDate,
      required this.expectedHarvestDate,
      required this.variety,
      required this.plantCount,
      required this.spacing});

  factory _$PlantingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantingInfoImplFromJson(json);

  @override
  final DateTime plantedDate;
  @override
  final DateTime expectedHarvestDate;
  @override
  final String variety;
  @override
  final int plantCount;
  @override
  final double spacing;

  @override
  String toString() {
    return 'PlantingInfo(plantedDate: $plantedDate, expectedHarvestDate: $expectedHarvestDate, variety: $variety, plantCount: $plantCount, spacing: $spacing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantingInfoImpl &&
            (identical(other.plantedDate, plantedDate) ||
                other.plantedDate == plantedDate) &&
            (identical(other.expectedHarvestDate, expectedHarvestDate) ||
                other.expectedHarvestDate == expectedHarvestDate) &&
            (identical(other.variety, variety) || other.variety == variety) &&
            (identical(other.plantCount, plantCount) ||
                other.plantCount == plantCount) &&
            (identical(other.spacing, spacing) || other.spacing == spacing));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, plantedDate, expectedHarvestDate,
      variety, plantCount, spacing);

  /// Create a copy of PlantingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantingInfoImplCopyWith<_$PlantingInfoImpl> get copyWith =>
      __$$PlantingInfoImplCopyWithImpl<_$PlantingInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantingInfoImplToJson(
      this,
    );
  }
}

abstract class _PlantingInfo implements PlantingInfo {
  const factory _PlantingInfo(
      {required final DateTime plantedDate,
      required final DateTime expectedHarvestDate,
      required final String variety,
      required final int plantCount,
      required final double spacing}) = _$PlantingInfoImpl;

  factory _PlantingInfo.fromJson(Map<String, dynamic> json) =
      _$PlantingInfoImpl.fromJson;

  @override
  DateTime get plantedDate;
  @override
  DateTime get expectedHarvestDate;
  @override
  String get variety;
  @override
  int get plantCount;
  @override
  double get spacing;

  /// Create a copy of PlantingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantingInfoImplCopyWith<_$PlantingInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SensorReading _$SensorReadingFromJson(Map<String, dynamic> json) {
  return _SensorReading.fromJson(json);
}

/// @nodoc
mixin _$SensorReading {
  String get sensorId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  SensorStatus get status => throw _privateConstructorUsedError;

  /// Serializes this SensorReading to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SensorReading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SensorReadingCopyWith<SensorReading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorReadingCopyWith<$Res> {
  factory $SensorReadingCopyWith(
          SensorReading value, $Res Function(SensorReading) then) =
      _$SensorReadingCopyWithImpl<$Res, SensorReading>;
  @useResult
  $Res call(
      {String sensorId,
      String type,
      double value,
      String unit,
      DateTime timestamp,
      SensorStatus status});
}

/// @nodoc
class _$SensorReadingCopyWithImpl<$Res, $Val extends SensorReading>
    implements $SensorReadingCopyWith<$Res> {
  _$SensorReadingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SensorReading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sensorId = null,
    Object? type = null,
    Object? value = null,
    Object? unit = null,
    Object? timestamp = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      sensorId: null == sensorId
          ? _value.sensorId
          : sensorId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SensorStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SensorReadingImplCopyWith<$Res>
    implements $SensorReadingCopyWith<$Res> {
  factory _$$SensorReadingImplCopyWith(
          _$SensorReadingImpl value, $Res Function(_$SensorReadingImpl) then) =
      __$$SensorReadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sensorId,
      String type,
      double value,
      String unit,
      DateTime timestamp,
      SensorStatus status});
}

/// @nodoc
class __$$SensorReadingImplCopyWithImpl<$Res>
    extends _$SensorReadingCopyWithImpl<$Res, _$SensorReadingImpl>
    implements _$$SensorReadingImplCopyWith<$Res> {
  __$$SensorReadingImplCopyWithImpl(
      _$SensorReadingImpl _value, $Res Function(_$SensorReadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SensorReading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sensorId = null,
    Object? type = null,
    Object? value = null,
    Object? unit = null,
    Object? timestamp = null,
    Object? status = null,
  }) {
    return _then(_$SensorReadingImpl(
      sensorId: null == sensorId
          ? _value.sensorId
          : sensorId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SensorStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SensorReadingImpl implements _SensorReading {
  const _$SensorReadingImpl(
      {required this.sensorId,
      required this.type,
      required this.value,
      required this.unit,
      required this.timestamp,
      required this.status});

  factory _$SensorReadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$SensorReadingImplFromJson(json);

  @override
  final String sensorId;
  @override
  final String type;
  @override
  final double value;
  @override
  final String unit;
  @override
  final DateTime timestamp;
  @override
  final SensorStatus status;

  @override
  String toString() {
    return 'SensorReading(sensorId: $sensorId, type: $type, value: $value, unit: $unit, timestamp: $timestamp, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SensorReadingImpl &&
            (identical(other.sensorId, sensorId) ||
                other.sensorId == sensorId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sensorId, type, value, unit, timestamp, status);

  /// Create a copy of SensorReading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SensorReadingImplCopyWith<_$SensorReadingImpl> get copyWith =>
      __$$SensorReadingImplCopyWithImpl<_$SensorReadingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SensorReadingImplToJson(
      this,
    );
  }
}

abstract class _SensorReading implements SensorReading {
  const factory _SensorReading(
      {required final String sensorId,
      required final String type,
      required final double value,
      required final String unit,
      required final DateTime timestamp,
      required final SensorStatus status}) = _$SensorReadingImpl;

  factory _SensorReading.fromJson(Map<String, dynamic> json) =
      _$SensorReadingImpl.fromJson;

  @override
  String get sensorId;
  @override
  String get type;
  @override
  double get value;
  @override
  String get unit;
  @override
  DateTime get timestamp;
  @override
  SensorStatus get status;

  /// Create a copy of SensorReading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SensorReadingImplCopyWith<_$SensorReadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AIInsight _$AIInsightFromJson(Map<String, dynamic> json) {
  return _AIInsight.fromJson(json);
}

/// @nodoc
mixin _$AIInsight {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  AIInsightPriority get priority => throw _privateConstructorUsedError;
  List<String> get actionItems => throw _privateConstructorUsedError;

  /// Serializes this AIInsight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AIInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AIInsightCopyWith<AIInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AIInsightCopyWith<$Res> {
  factory $AIInsightCopyWith(AIInsight value, $Res Function(AIInsight) then) =
      _$AIInsightCopyWithImpl<$Res, AIInsight>;
  @useResult
  $Res call(
      {String id,
      String type,
      String title,
      String description,
      double confidence,
      DateTime timestamp,
      AIInsightPriority priority,
      List<String> actionItems});
}

/// @nodoc
class _$AIInsightCopyWithImpl<$Res, $Val extends AIInsight>
    implements $AIInsightCopyWith<$Res> {
  _$AIInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AIInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? confidence = null,
    Object? timestamp = null,
    Object? priority = null,
    Object? actionItems = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as AIInsightPriority,
      actionItems: null == actionItems
          ? _value.actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AIInsightImplCopyWith<$Res>
    implements $AIInsightCopyWith<$Res> {
  factory _$$AIInsightImplCopyWith(
          _$AIInsightImpl value, $Res Function(_$AIInsightImpl) then) =
      __$$AIInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String title,
      String description,
      double confidence,
      DateTime timestamp,
      AIInsightPriority priority,
      List<String> actionItems});
}

/// @nodoc
class __$$AIInsightImplCopyWithImpl<$Res>
    extends _$AIInsightCopyWithImpl<$Res, _$AIInsightImpl>
    implements _$$AIInsightImplCopyWith<$Res> {
  __$$AIInsightImplCopyWithImpl(
      _$AIInsightImpl _value, $Res Function(_$AIInsightImpl) _then)
      : super(_value, _then);

  /// Create a copy of AIInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? confidence = null,
    Object? timestamp = null,
    Object? priority = null,
    Object? actionItems = null,
  }) {
    return _then(_$AIInsightImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as AIInsightPriority,
      actionItems: null == actionItems
          ? _value._actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AIInsightImpl implements _AIInsight {
  const _$AIInsightImpl(
      {required this.id,
      required this.type,
      required this.title,
      required this.description,
      required this.confidence,
      required this.timestamp,
      required this.priority,
      final List<String> actionItems = const []})
      : _actionItems = actionItems;

  factory _$AIInsightImpl.fromJson(Map<String, dynamic> json) =>
      _$$AIInsightImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String title;
  @override
  final String description;
  @override
  final double confidence;
  @override
  final DateTime timestamp;
  @override
  final AIInsightPriority priority;
  final List<String> _actionItems;
  @override
  @JsonKey()
  List<String> get actionItems {
    if (_actionItems is EqualUnmodifiableListView) return _actionItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionItems);
  }

  @override
  String toString() {
    return 'AIInsight(id: $id, type: $type, title: $title, description: $description, confidence: $confidence, timestamp: $timestamp, priority: $priority, actionItems: $actionItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AIInsightImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality()
                .equals(other._actionItems, _actionItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      title,
      description,
      confidence,
      timestamp,
      priority,
      const DeepCollectionEquality().hash(_actionItems));

  /// Create a copy of AIInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AIInsightImplCopyWith<_$AIInsightImpl> get copyWith =>
      __$$AIInsightImplCopyWithImpl<_$AIInsightImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AIInsightImplToJson(
      this,
    );
  }
}

abstract class _AIInsight implements AIInsight {
  const factory _AIInsight(
      {required final String id,
      required final String type,
      required final String title,
      required final String description,
      required final double confidence,
      required final DateTime timestamp,
      required final AIInsightPriority priority,
      final List<String> actionItems}) = _$AIInsightImpl;

  factory _AIInsight.fromJson(Map<String, dynamic> json) =
      _$AIInsightImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get title;
  @override
  String get description;
  @override
  double get confidence;
  @override
  DateTime get timestamp;
  @override
  AIInsightPriority get priority;
  @override
  List<String> get actionItems;

  /// Create a copy of AIInsight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AIInsightImplCopyWith<_$AIInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FarmActivity _$FarmActivityFromJson(Map<String, dynamic> json) {
  return _FarmActivity.fromJson(json);
}

/// @nodoc
mixin _$FarmActivity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ActivityType get type => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get sectionId => throw _privateConstructorUsedError;
  ActivityStatus get status => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this FarmActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FarmActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FarmActivityCopyWith<FarmActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmActivityCopyWith<$Res> {
  factory $FarmActivityCopyWith(
          FarmActivity value, $Res Function(FarmActivity) then) =
      _$FarmActivityCopyWithImpl<$Res, FarmActivity>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      ActivityType type,
      DateTime timestamp,
      String sectionId,
      ActivityStatus status,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$FarmActivityCopyWithImpl<$Res, $Val extends FarmActivity>
    implements $FarmActivityCopyWith<$Res> {
  _$FarmActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FarmActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? timestamp = null,
    Object? sectionId = null,
    Object? status = null,
    Object? metadata = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActivityType,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sectionId: null == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ActivityStatus,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FarmActivityImplCopyWith<$Res>
    implements $FarmActivityCopyWith<$Res> {
  factory _$$FarmActivityImplCopyWith(
          _$FarmActivityImpl value, $Res Function(_$FarmActivityImpl) then) =
      __$$FarmActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      ActivityType type,
      DateTime timestamp,
      String sectionId,
      ActivityStatus status,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$FarmActivityImplCopyWithImpl<$Res>
    extends _$FarmActivityCopyWithImpl<$Res, _$FarmActivityImpl>
    implements _$$FarmActivityImplCopyWith<$Res> {
  __$$FarmActivityImplCopyWithImpl(
      _$FarmActivityImpl _value, $Res Function(_$FarmActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of FarmActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? timestamp = null,
    Object? sectionId = null,
    Object? status = null,
    Object? metadata = freezed,
  }) {
    return _then(_$FarmActivityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActivityType,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sectionId: null == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ActivityStatus,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FarmActivityImpl implements _FarmActivity {
  const _$FarmActivityImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.timestamp,
      required this.sectionId,
      required this.status,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$FarmActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FarmActivityImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final ActivityType type;
  @override
  final DateTime timestamp;
  @override
  final String sectionId;
  @override
  final ActivityStatus status;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'FarmActivity(id: $id, title: $title, description: $description, type: $type, timestamp: $timestamp, sectionId: $sectionId, status: $status, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FarmActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      type,
      timestamp,
      sectionId,
      status,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of FarmActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FarmActivityImplCopyWith<_$FarmActivityImpl> get copyWith =>
      __$$FarmActivityImplCopyWithImpl<_$FarmActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FarmActivityImplToJson(
      this,
    );
  }
}

abstract class _FarmActivity implements FarmActivity {
  const factory _FarmActivity(
      {required final String id,
      required final String title,
      required final String description,
      required final ActivityType type,
      required final DateTime timestamp,
      required final String sectionId,
      required final ActivityStatus status,
      final Map<String, dynamic>? metadata}) = _$FarmActivityImpl;

  factory _FarmActivity.fromJson(Map<String, dynamic> json) =
      _$FarmActivityImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  ActivityType get type;
  @override
  DateTime get timestamp;
  @override
  String get sectionId;
  @override
  ActivityStatus get status;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of FarmActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FarmActivityImplCopyWith<_$FarmActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FarmState {
  AsyncValue<WeatherData> get weather => throw _privateConstructorUsedError;
  AsyncValue<List<CropSection>> get cropSections =>
      throw _privateConstructorUsedError;
  AsyncValue<List<FarmActivity>> get activities =>
      throw _privateConstructorUsedError;
  AsyncValue<List<AIInsight>> get insights =>
      throw _privateConstructorUsedError;
  bool get isConnectedToSensors => throw _privateConstructorUsedError;
  String? get selectedSectionId => throw _privateConstructorUsedError;
  FarmViewMode get viewMode => throw _privateConstructorUsedError;

  /// Create a copy of FarmState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FarmStateCopyWith<FarmState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmStateCopyWith<$Res> {
  factory $FarmStateCopyWith(FarmState value, $Res Function(FarmState) then) =
      _$FarmStateCopyWithImpl<$Res, FarmState>;
  @useResult
  $Res call(
      {AsyncValue<WeatherData> weather,
      AsyncValue<List<CropSection>> cropSections,
      AsyncValue<List<FarmActivity>> activities,
      AsyncValue<List<AIInsight>> insights,
      bool isConnectedToSensors,
      String? selectedSectionId,
      FarmViewMode viewMode});
}

/// @nodoc
class _$FarmStateCopyWithImpl<$Res, $Val extends FarmState>
    implements $FarmStateCopyWith<$Res> {
  _$FarmStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FarmState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
    Object? cropSections = null,
    Object? activities = null,
    Object? insights = null,
    Object? isConnectedToSensors = null,
    Object? selectedSectionId = freezed,
    Object? viewMode = null,
  }) {
    return _then(_value.copyWith(
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as AsyncValue<WeatherData>,
      cropSections: null == cropSections
          ? _value.cropSections
          : cropSections // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CropSection>>,
      activities: null == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<FarmActivity>>,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<AIInsight>>,
      isConnectedToSensors: null == isConnectedToSensors
          ? _value.isConnectedToSensors
          : isConnectedToSensors // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedSectionId: freezed == selectedSectionId
          ? _value.selectedSectionId
          : selectedSectionId // ignore: cast_nullable_to_non_nullable
              as String?,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as FarmViewMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FarmStateImplCopyWith<$Res>
    implements $FarmStateCopyWith<$Res> {
  factory _$$FarmStateImplCopyWith(
          _$FarmStateImpl value, $Res Function(_$FarmStateImpl) then) =
      __$$FarmStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<WeatherData> weather,
      AsyncValue<List<CropSection>> cropSections,
      AsyncValue<List<FarmActivity>> activities,
      AsyncValue<List<AIInsight>> insights,
      bool isConnectedToSensors,
      String? selectedSectionId,
      FarmViewMode viewMode});
}

/// @nodoc
class __$$FarmStateImplCopyWithImpl<$Res>
    extends _$FarmStateCopyWithImpl<$Res, _$FarmStateImpl>
    implements _$$FarmStateImplCopyWith<$Res> {
  __$$FarmStateImplCopyWithImpl(
      _$FarmStateImpl _value, $Res Function(_$FarmStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FarmState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
    Object? cropSections = null,
    Object? activities = null,
    Object? insights = null,
    Object? isConnectedToSensors = null,
    Object? selectedSectionId = freezed,
    Object? viewMode = null,
  }) {
    return _then(_$FarmStateImpl(
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as AsyncValue<WeatherData>,
      cropSections: null == cropSections
          ? _value.cropSections
          : cropSections // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CropSection>>,
      activities: null == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<FarmActivity>>,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<AIInsight>>,
      isConnectedToSensors: null == isConnectedToSensors
          ? _value.isConnectedToSensors
          : isConnectedToSensors // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedSectionId: freezed == selectedSectionId
          ? _value.selectedSectionId
          : selectedSectionId // ignore: cast_nullable_to_non_nullable
              as String?,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as FarmViewMode,
    ));
  }
}

/// @nodoc

class _$FarmStateImpl implements _FarmState {
  const _$FarmStateImpl(
      {this.weather = const AsyncValue.loading(),
      this.cropSections = const AsyncValue.loading(),
      this.activities = const AsyncValue.loading(),
      this.insights = const AsyncValue.loading(),
      this.isConnectedToSensors = false,
      this.selectedSectionId = null,
      this.viewMode = FarmViewMode.dashboard});

  @override
  @JsonKey()
  final AsyncValue<WeatherData> weather;
  @override
  @JsonKey()
  final AsyncValue<List<CropSection>> cropSections;
  @override
  @JsonKey()
  final AsyncValue<List<FarmActivity>> activities;
  @override
  @JsonKey()
  final AsyncValue<List<AIInsight>> insights;
  @override
  @JsonKey()
  final bool isConnectedToSensors;
  @override
  @JsonKey()
  final String? selectedSectionId;
  @override
  @JsonKey()
  final FarmViewMode viewMode;

  @override
  String toString() {
    return 'FarmState(weather: $weather, cropSections: $cropSections, activities: $activities, insights: $insights, isConnectedToSensors: $isConnectedToSensors, selectedSectionId: $selectedSectionId, viewMode: $viewMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FarmStateImpl &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.cropSections, cropSections) ||
                other.cropSections == cropSections) &&
            (identical(other.activities, activities) ||
                other.activities == activities) &&
            (identical(other.insights, insights) ||
                other.insights == insights) &&
            (identical(other.isConnectedToSensors, isConnectedToSensors) ||
                other.isConnectedToSensors == isConnectedToSensors) &&
            (identical(other.selectedSectionId, selectedSectionId) ||
                other.selectedSectionId == selectedSectionId) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weather, cropSections,
      activities, insights, isConnectedToSensors, selectedSectionId, viewMode);

  /// Create a copy of FarmState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FarmStateImplCopyWith<_$FarmStateImpl> get copyWith =>
      __$$FarmStateImplCopyWithImpl<_$FarmStateImpl>(this, _$identity);
}

abstract class _FarmState implements FarmState {
  const factory _FarmState(
      {final AsyncValue<WeatherData> weather,
      final AsyncValue<List<CropSection>> cropSections,
      final AsyncValue<List<FarmActivity>> activities,
      final AsyncValue<List<AIInsight>> insights,
      final bool isConnectedToSensors,
      final String? selectedSectionId,
      final FarmViewMode viewMode}) = _$FarmStateImpl;

  @override
  AsyncValue<WeatherData> get weather;
  @override
  AsyncValue<List<CropSection>> get cropSections;
  @override
  AsyncValue<List<FarmActivity>> get activities;
  @override
  AsyncValue<List<AIInsight>> get insights;
  @override
  bool get isConnectedToSensors;
  @override
  String? get selectedSectionId;
  @override
  FarmViewMode get viewMode;

  /// Create a copy of FarmState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FarmStateImplCopyWith<_$FarmStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
