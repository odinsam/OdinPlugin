import '../OdinExtensionEnum/enum_ss_or_ms.dart';

extension OdinDateTimeExtensions on DateTime{
  /// DataTime to unixTimer
  int toUnixTime({EnumSsOrMs? ssOrMs = EnumSsOrMs.ms}){
    if(ssOrMs==EnumSsOrMs.ss)
    {
      return microsecondsSinceEpoch;
    }
    else
    {
      return millisecondsSinceEpoch;
    }
  }
  /// 时间差
  Duration operator -(DateTime t){
    return difference(t);
  }
  bool isLeapYear(){
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
  }
}