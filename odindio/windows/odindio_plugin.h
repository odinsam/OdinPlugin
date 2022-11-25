#ifndef FLUTTER_PLUGIN_ODINDIO_PLUGIN_H_
#define FLUTTER_PLUGIN_ODINDIO_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace odindio {

class OdindioPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  OdindioPlugin();

  virtual ~OdindioPlugin();

  // Disallow copy and assign.
  OdindioPlugin(const OdindioPlugin&) = delete;
  OdindioPlugin& operator=(const OdindioPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace odindio

#endif  // FLUTTER_PLUGIN_ODINDIO_PLUGIN_H_
