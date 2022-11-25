#include "include/odindio/odindio_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "odindio_plugin.h"

void OdindioPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  odindio::OdindioPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
