import 'package:odinutils/OdinExtensions/OdinExtensionEnum/enum_ss_or_ms.dart';

extension OdinIntExtensions on int
{
  /// UnixTimer to Timer
  DateTime unixTimerToTimer({EnumSsOrMs? ssOrMs = EnumSsOrMs.ms}){
    if(ssOrMs == EnumSsOrMs.ms)
    {
      return DateTime.fromMillisecondsSinceEpoch(this);
    }
    else
    {
      return DateTime.fromMicrosecondsSinceEpoch(this);
    }
  }


}