import 'convert_number_to_chinese_money_words.dart';

class ConvertNumberToChineseNumber {
  String toChineseNumber(String num) {
    var str = ConvertNumberToChineseMoneyWords().toChinese(num);
    var strLst = str.split('元');
    return strLst[0]+(strLst.length>1?("点${strLst[1].replaceAll('角', '').replaceAll('分', '').replaceAll('厘', '')}"):"");
  }
}
