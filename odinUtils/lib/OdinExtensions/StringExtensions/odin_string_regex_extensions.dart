import 'package:odinutils/OdinExtensions/OdinExtensionEnum/enum_regex_type.dart';
import 'package:odinutils/OdinExtensions/StringExtensions/regex_const.dart';
extension OdinStringRegexExtensions on String
{
  bool _odinRegexString(EnumRegexType regexType,{String? pattern})
  {
    switch(regexType)
    {
      case EnumRegexType.chinaCardId:
        return RegExp(pattern ?? RegexConst.regexChinaCardId).hasMatch(this);
      case EnumRegexType.chinaMobile:
        return RegExp(pattern ?? RegexConst.regexChinaMobile).hasMatch(this);
      case EnumRegexType.ipAddress:
        return RegExp(pattern ?? RegexConst.regexIpAddress).hasMatch(this);
      case EnumRegexType.email:
        return RegExp(pattern ?? RegexConst.regexEmail).hasMatch(this);
      case EnumRegexType.url:
        return RegExp(pattern ?? RegexConst.regexUri).hasMatch(this);
    }
  }
  /// 判断中国身份号码格式
  bool isChinaCardId({String? pattern})
  {
    return _odinRegexString(EnumRegexType.chinaCardId,pattern: pattern);
  }

  /// 判断中国移动电话号码格式
  bool isChinaMobile({String? pattern})
  {
    return _odinRegexString(EnumRegexType.chinaMobile,pattern: pattern);
  }

  /// 判断Ip地址格式
  bool isIpAddress({String? pattern})
  {
    return _odinRegexString(EnumRegexType.ipAddress,pattern: pattern);
  }

  /// 判断邮箱地址格式
  bool isEmail({String? pattern})
  {
    return _odinRegexString(EnumRegexType.email,pattern: pattern);
  }

  /// 判断邮箱地址格式
  bool isUrl({String? pattern})
  {
    return _odinRegexString(EnumRegexType.url,pattern: pattern);
  }
}