import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odinutils/odinutils_method_channel.dart';

void main() {
  MethodChannelOdinutils platform = MethodChannelOdinutils();
  const MethodChannel channel = MethodChannel('odinutils');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
