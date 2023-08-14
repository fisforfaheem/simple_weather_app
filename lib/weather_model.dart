// ignore_for_file: prefer_typing_uninitialized_variables

class Weather {
  Weather(
      {required this.cityName,
      required this.icon,
      required this.condition,
      required this.temp,
      required this.wind,
      required this.humidity,
      required this.windDir,
      required this.gust,
      required this.uv,
      required this.pressure,
      required this.precipitation,
      required this.lastUpdate});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    windDir = json['current']['wind_dir'];
    gust = json['current']['gust_kph'];
    uv = json['current']['uv'];
    pressure = json['current']['pressure_mb'];
    precipitation = json['current']['precip_mm'];
    lastUpdate = json['current']['last_updated'];
  }

  var cityName;
  var condition;
  var gust;
  var humidity;
  var icon;
  var lastUpdate;
  var pressure;
  var precipitation;
  var temp;
  var uv;
  var wind;
  var windDir;
}
