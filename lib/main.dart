import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'weather_bloc.dart';
import 'weather_app.dart';
import 'weather_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(weatherRepository: WeatherRepository())
        ..add(WeatherRequest(cityName: "Ahmedabad")),
      child: MaterialApp(
        home: WeatherApp(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
