import 'package:flutter_test/flutter_test.dart';
import 'package:odinutils/OdinExtensions/IntExtensions/odin_int_extensions.dart';
import 'package:odinutils/OdinExtensions/StringExtensions/odin_string_extensions.dart';
import 'package:odinutils/OdinExtensions/StringExtensions/odin_string_regex_extensions.dart';
import 'package:odinutils/OdinExtensions/TimerExtensions/odin_timer_extensions.dart';
import 'package:odinutils/odinutils.dart';
import 'package:odinutils/odinutils_platform_interface.dart';
import 'package:odinutils/odinutils_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOdinutilsPlatform
    with MockPlatformInterfaceMixin
    implements OdinutilsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final OdinutilsPlatform initialPlatform = OdinutilsPlatform.instance;

  test('stringUtils',(){
    String str="abc";
    print(str.compareIgnoreCase("ABCd"));
  });

  test('stringRegex',(){
    String str="620104198207290299";
    print(str.isChinaCardId());
  });

  test('time',(){
    var dt = DateTime.now();
    int unixTime = dt.toUnixTime();
    print(dt.toString());
    print(unixTime);
    print(unixTime.unixTimerToTimer());
  });

  test('$MethodChannelOdinutils is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOdinutils>());
  });

  test('getPlatformVersion', () async {
    Odinutils odinutilsPlugin = Odinutils();
    MockOdinutilsPlatform fakePlatform = MockOdinutilsPlatform();
    OdinutilsPlatform.instance = fakePlatform;

    expect(await odinutilsPlugin.getPlatformVersion(), '42');
  });
}
