import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weathe_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(InitialState());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;

  void getWeather({required String cityName}) async {
    emit(LoadingState());

    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(DataSuccesState());
    } on Exception catch (e) {
      emit(FailureState());
    }
  }
}
