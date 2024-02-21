abstract class WeatherState {}

class InitialState extends WeatherState {}

class LoadingState extends WeatherState {}

class DataSuccesState extends WeatherState {}

class FailureState extends WeatherState {}
