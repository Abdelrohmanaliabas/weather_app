import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weathe_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weathe_cubit/weather_state.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/firstscreen.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/weatherscreen.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            BlocProvider.of<WeatherCubit>(context).weatherModel == null
                ? Colors.blue
                : BlocProvider.of<WeatherCubit>(context)
                    .weatherModel!
                    .getThemeColor(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DataSuccesState) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;

            return WeatherScreenShow(weatherData: weatherData);
          } else if (state is FailureState) {
            return Center(
              child: Text('some thing is wrong'),
            );
          } else {
            return Center(
              child: FirstScreen(),
            );
          }
        },
      ),
    );
  }
}
