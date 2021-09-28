// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:covid_statistics_app/src/models/covid_statistics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xml/xml.dart';

void main() {
  final bookshelfXml =
      '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<response>
    <header>
        <resultCode>00</resultCode>
        <resultMsg>NORMAL SERVICE.</resultMsg>
    </header>
    <body>
        <items>
            <item>
                <accDefRate>2.0015871732</accDefRate>
                <accExamCnt>12866802</accExamCnt>
                <accExamCompCnt>12156203</accExamCompCnt>
                <careCnt>28189</careCnt>
                <clearCnt>212871</clearCnt>
                <createDt>2021-08-26 09:37:19.288</createDt>
                <deathCnt>2257</deathCnt>
                <decideCnt>243317</decideCnt>
                <examCnt>710599</examCnt>
                <resutlNegCnt>11912886</resutlNegCnt>
                <seq>615</seq>
                <stateDt>20210826</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.9938431056</accDefRate>
                <accExamCnt>12806613</accExamCnt>
                <accExamCompCnt>12109027</accExamCompCnt>
                <careCnt>28021</careCnt>
                <clearCnt>211177</clearCnt>
                <createDt>2021-08-25 09:46:31.206</createDt>
                <deathCnt>2237</deathCnt>
                <decideCnt>241435</decideCnt>
                <examCnt>697586</examCnt>
                <resutlNegCnt>11867592</resutlNegCnt>
                <seq>614</seq>
                <stateDt>20210825</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2021-08-26 16:59:40.265</updateDt>
            </item>
        </items>
        <numOfRows>10</numOfRows>
        <pageNo>1</pageNo>
        <totalCount>2</totalCount>
    </body>
</response>''';

  test('코로나 전체통계', () {
    final document = XmlDocument.parse(bookshelfXml);
    final items = document.findAllElements('item');
    var covid19Statics = <Covid19StatisticsModel>[];
    items.forEach((node) {
      covid19Statics.add(Covid19StatisticsModel.fromXml(node));
    });
    covid19Statics.forEach((covid19) {
      print('${covid19.stateDt} : ${covid19.decideCnt}');

     });
  });
}





