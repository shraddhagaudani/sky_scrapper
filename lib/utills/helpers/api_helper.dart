import 'dart:convert';
import 'package:demo/models/weathermodel.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future<Weather_Model?> fetchallweather({required String search}) async {
    String apiKey = "ad312c30686f4039ad0125256232205";
    String baseUrl =
        "http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$search&Surat";

    http.Response res = await http.get(
      Uri.parse(baseUrl),
    );
    print(res.statusCode);

    if (res.statusCode == 200) {

      String data = res.body;

      Map decodeddata = jsonDecode(data);
      Weather_Model allWeatherdata = Weather_Model.fromMap(
        data: decodeddata,
      );
      return allWeatherdata;
    }
  }
}
