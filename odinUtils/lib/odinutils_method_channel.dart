import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'odinutils_platform_interface.dart';

/// An implementation of [OdinutilsPlatform] that uses method channels.
class MethodChannelOdinutils extends OdinutilsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('odinutils');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
