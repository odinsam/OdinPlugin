import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odindio/odindio_method_channel.dart';

void main() {
  MethodChannelOdindio platform = MethodChannelOdindio();
  const MethodChannel channel = MethodChannel('odindio');

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
