import 'package:covid_statistics_app/src/utils/data_utils.dart';
import 'package:covid_statistics_app/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

class Covid19StatisticsModel {
  double? accDefRate;
  double? accExamCnt;
  double? accExamCompCnt;
  double? careCnt;
  double? clearCnt;
  String? createDt;
  double? deathCnt;
  double? decideCnt;
  double? examCnt;
  double? resutlNegCnt;
  double? seq;
  double calcDecideCnt = 0;
  double calcExamCnt = 0;
  double calcDeathCnt = 0;
  double calcClearCnt = 0;
  DateTime? stateDt;
  String? stateTime;
  String? updateDt;
  Covid19StatisticsModel({
    this.accDefRate,
    this.accExamCnt,
    this.accExamCompCnt,
    this.careCnt,
    this.clearCnt,
    this.createDt,
    this.deathCnt,
    this.decideCnt,
    this.examCnt,
    this.resutlNegCnt,
    this.seq,
    this.stateDt,
    this.stateTime,
    this.updateDt,
  });

  factory Covid19StatisticsModel.empty() {
    return Covid19StatisticsModel();
  }

  factory Covid19StatisticsModel.fromXml(XmlElement xml) {
    return Covid19StatisticsModel(
      accDefRate: XmlUtils.searchResultForDouble(xml, 'accDefRate'),
      accExamCnt: XmlUtils.searchResultForDouble(xml, 'accDefRate'),
      accExamCompCnt: XmlUtils.searchResultForDouble(xml, 'accExamCompCnt'),
      careCnt: XmlUtils.searchResultForDouble(xml, 'careCnt'),
      clearCnt: XmlUtils.searchResultForDouble(xml, 'clearCnt'),
      createDt: XmlUtils.searchResultForString(xml, 'createDt'),
      deathCnt: XmlUtils.searchResultForDouble(xml, 'deathCnt'),
      decideCnt: XmlUtils.searchResultForDouble(xml, 'decideCnt'),
      examCnt: XmlUtils.searchResultForDouble(xml, 'examCnt'),
      resutlNegCnt: XmlUtils.searchResultForDouble(xml, 'resutlNegCnt'),
      seq: XmlUtils.searchResultForDouble(xml, 'seq'),
      stateDt: XmlUtils.searchResultForString(xml, 'stateDt') != ''
          ? DateTime.parse(XmlUtils.searchResultForString(xml, 'stateDt'))
          : null,
      stateTime: XmlUtils.searchResultForString(xml, 'stateTime'),
      updateDt: XmlUtils.searchResultForString(xml, 'updateDt'),
    );
  }

  void updateCalcAboutYesterday(Covid19StatisticsModel yesterDayData) {
    _updateCalcDecideCnt(yesterDayData.decideCnt!);
    _updateCalcExamCnt(yesterDayData.examCnt!);
    _updateCalcDeathCnt(yesterDayData.deathCnt!);
    _updateCalcClearCnt(yesterDayData.clearCnt!);
  }

  void _updateCalcDecideCnt(double beforCnt) {
    calcDecideCnt = decideCnt! - beforCnt;
  }

  void _updateCalcExamCnt(double beforCnt) {
    calcExamCnt = examCnt! - beforCnt;
  }

  void _updateCalcDeathCnt(double beforCnt) {
    calcDeathCnt = deathCnt! - beforCnt;
  }

  void _updateCalcClearCnt(double beforCnt) {
    calcClearCnt = clearCnt! - beforCnt;
  }

  String get standardDayString => stateDt == null ? '' :
      '${DataUtils.simpleDayFormat(stateDt!)} $stateTime 기준';
}
