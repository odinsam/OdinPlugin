import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'odindio_platform_interface.dart';

/// An implementation of [OdindioPlatform] that uses method channels.
class MethodChannelOdindio extends OdindioPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('odindio');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
