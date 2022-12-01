import 'package:odinutils/OdinExtensions/OdinExtensionEnum/enum_ss_or_ms.dart';

extension OdinTimerExtensions on DateTime
{
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
}