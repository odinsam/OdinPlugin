import 'package:flutter_test/flutter_test.dart';
import 'package:odindio/odindio.dart';
import 'package:odindio/odindio_platform_interface.dart';
import 'package:odindio/odindio_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOdindioPlatform
    with MockPlatformInterfaceMixin
    implements OdindioPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final OdindioPlatform initialPlatform = OdindioPlatform.instance;

  test('$MethodChannelOdindio is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOdindio>());
  });

  test('getPlatformVersion', () async {
    Odindio odindioPlugin = Odindio();
    MockOdindioPlatform fakePlatform = MockOdindioPlatform();
    OdindioPlatform.instance = fakePlatform;

    expect(await odindioPlugin.getPlatformVersion(), '42');
  });
}
