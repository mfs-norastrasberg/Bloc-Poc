import 'package:bloc/bloc.dart';
import 'weather_model.dart';
import 'weather_repository.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherEvent {}

class WeatherRequest extends WeatherEvent {
  final String cityName;
  WeatherRequest({required this.cityName});
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository})
      : super(WeatherLoadInProgress()) {
    on<WeatherRequest>((event, emit) async {
      final weather = await weatherRepository.getWeather(event.cityName);
      emit(WeatherLoadSuccess(weather: weather));
    });
  }
}

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {
  final String name = 'Honduras';
}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;
  WeatherLoadSuccess({required this.weather});
}

class WeatherLoadFailure extends WeatherState {
  final String error;
  WeatherLoadFailure({required this.error});
}
