import 'StringUtilsHelper/generation_code_helper.dart';

class OdinStringUtils
{
  /// 按长度生成对应的字符串   length 生成的字符串长度
  /// containNum 是否包含数字  containLetter 是否包含字符  containSpecial 是否包含特殊字符
  static String generationCode(int length,
      {bool containNum = true,
        bool containLetter = true,
        bool containSpecial = false}){
    return GenerationCodeHelper.generationCode(length,containNum: containNum,containLetter: containLetter,containSpecial: containSpecial);
  }

  /// 按长度生成对应的字符串，不包含 0 o 1 I 等容易混淆的之母和数字     length 生成的字符串长度
  /// containNum 是否包含数字  containLetter 是否包含字符  containSpecial 是否包含特殊字符
  static String generationLimpidCode(int length,
      {bool containNum = true,
        bool containLetter = true,
        bool containSpecial = false}){
    return GenerationCodeHelper.generationLimpidCode(length,containNum: containNum,containLetter: containLetter,containSpecial: containSpecial);
  }
}