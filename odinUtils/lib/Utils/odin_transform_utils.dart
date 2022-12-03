import 'OdinTransformHelper/convert_date_to_chinese_date.dart';
import 'OdinTransformHelper/convert_number_to_chinese_money_words.dart';
import 'OdinTransformHelper/convert_number_to_chinese_number.dart';

class OdinTransformUtils
{
  /// number to chineseMoneyWords
  static String convertNumberToChineseMoneyWords(String moneyNumber){
    return ConvertNumberToChineseMoneyWords().toChinese(moneyNumber);
  }
  /// number to chineseNumber
  static String convertNumberToChineseNumber(String number){
    return ConvertNumberToChineseNumber().toChineseNumber(number);
  }
  /// date to chineseDate
  static String convertDateToChineseDate(String date){
    return  ConvertDateToChineseDate().toChineseDate(date);
  }
}