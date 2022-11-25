import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'odindio_method_channel.dart';

abstract class OdindioPlatform extends PlatformInterface {
  /// Constructs a OdindioPlatform.
  OdindioPlatform() : super(token: _token);

  static final Object _token = Object();

  static OdindioPlatform _instance = MethodChannelOdindio();

  /// The default instance of [OdindioPlatform] to use.
  ///
  /// Defaults to [MethodChannelOdindio].
  static OdindioPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OdindioPlatform] when
  /// they register themselves.
  static set instance(OdindioPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
