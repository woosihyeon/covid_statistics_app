import 'package:covid_statistics_app/src/models/covid_statistics.dart';
import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

class CovidStatisticsRepository {
  late var _dio;
  CovidStatisticsRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://openapi.data.go.kr",
        queryParameters: {
          'ServiceKey':
              'g8lyD4raKkJMB3itrqqNv/XnlIxz4b3uQDE1q7TTGj3SZHCh0iGDTGsa1FuCjE99kV9vMJ0GJxzjAF+L2nLNUA=='
        },
      ),
    );
  }

  Future<List<Covid19StatisticsModel>> fetchCovid19Statistics(
      {String? startDate, String? endDate}) async {
    var query = Map<String, String>();
    if (startDate != null) query.putIfAbsent('startCreateDt', () => startDate);
    if (endDate != null) query.putIfAbsent('endCreateDt', () => endDate);
    var response = await _dio.get(
        '/openapi/service/rest/Covid19/getCovid19InfStateJson',
        queryParameters: query);
    final document = XmlDocument.parse(response.data);
    final results = document.findAllElements('item');
    if (results.isNotEmpty) {
      return results
          .map<Covid19StatisticsModel>(
              (element) => Covid19StatisticsModel.fromXml(element))
          .toList();
    } else {
      return Future.value(null);
    }
 }
} 
