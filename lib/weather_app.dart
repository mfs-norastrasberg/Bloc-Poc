import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'weather_bloc.dart';

class WeatherApp extends StatelessWidget {
  final _cityController = TextEditingController();
  WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherLoadInProgress) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Loading")));
            }
          },
          builder: (context, state) {
            if (state is WeatherLoadSuccess) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextField(
                        controller: _cityController,
                        decoration: const InputDecoration(
                          hintText: 'Enter city name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Column(children: [
                        Image.asset(
                          'assets/images/sun.png',
                          height: 200,
                          width: 200,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          state.weather.name,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          state.weather.main["temp"].toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ]),
                      ElevatedButton(
                        child: const Text('Get Weather'),
                        onPressed: () {
                          if (_cityController.text.isNotEmpty) {
                            context.read<WeatherBloc>().add(
                                WeatherRequest(cityName: _cityController.text));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
