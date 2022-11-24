import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';
import '../model/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key, required this.title});

  final String title;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => WeatherBloc(),
    //   child: Scaffold(
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Search Weather by City",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // const TextField(
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: 'Enter a name of city',
                //   ),
                // ),
                // const SizedBox(
                //   height: 20.0,
                // ),
                TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search City by name",
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<WeatherBloc>()
                          .add(GetWeatherDataEvent(controller.text));
                    },
                    child: const Text(
                      "Search",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                BlocBuilder<WeatherBloc, WeatherState>(
                  // WeatherModel weather,
                  builder: (context, state) {
                    return Text(
                      "Temprature: ${state.props.}",
                      // "Temprature: ${state.temprature}",
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
