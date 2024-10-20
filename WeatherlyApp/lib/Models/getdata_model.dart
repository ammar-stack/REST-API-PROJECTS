class GetdataModel {
  late final String cityName;
  late final double temperature;
  final String weatherType;
  final String presure;
  final String humidity;
  final String windSpeed;

  GetdataModel(
      {required this.cityName,
      required this.temperature,
      required this.weatherType,
      required this.humidity,
      required this.presure,
      required this.windSpeed});
}
