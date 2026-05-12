import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/coutry_model.dart';

class CountryApi {
  static final String _api = dotenv.env["API_KEY"] ?? "Key bulunamadı";
  static final String _url =
      "https://api.countrylayer.com/v2/all?access_key=$_api";

  static Future<List<CountryModel>> getData() async {
    List<CountryModel> countyData = [];
    try {
      var response = await Dio().get(_url);
      debugPrint("********************");
      debugPrint(response.statusCode.toString());
      debugPrint("------------------------");
      var countryList = response.data;
      if (response.statusCode == 200) {
        countyData = CountryModel.fromList(countryList as List);
      }
      debugPrint(countyData.length.toString());
      debugPrint(countyData[0].name);
      debugPrint(countyData[4].capital);
      return countyData;
    } on DioException catch (e) {
      debugPrint("Burası çalışıyordirek");
      return Future.error(e.message.toString());
    }
  }
}
