import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Weather {
  Map<String, dynamic> coord;
  List<Map<String, dynamic>> weather;
  String base;
  Map<String, dynamic> main;
  int visibility;
  Map<String, dynamic> wind;
  Map<String, dynamic> clouds;
  int dt;
  Map<String, dynamic> sys;
  int timezone;
  int id;
  String name;
  int cod;

  Weather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    coord: json['coord'] as Map<String, dynamic>,
    weather: (json['weather'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
    base: json['base'] as String,
    main: json['main'] as Map<String, dynamic>,
    visibility: json['visibility'] as int,
    wind: json['wind'] as Map<String, dynamic>,
    clouds: json['clouds'] as Map<String, dynamic>,
    dt: json['dt'] as int,
    sys: json['sys'] as Map<String, dynamic>,
    timezone: json['timezone'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    cod: json['cod'] as int,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };
