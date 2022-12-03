#include "include/odinutils/odinutils_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "odinutils_plugin.h"

void OdinutilsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  odinutils::OdinutilsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
