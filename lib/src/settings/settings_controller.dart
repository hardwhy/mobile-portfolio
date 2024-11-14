import 'package:flutter/material.dart';
import 'package:mobile_portfolio/src/commons/model/theme_setting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'settings_service.dart';
part 'settings_controller.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  late SettingsService _settingsService;

  @override
  FutureOr<ThemeSetting> build() async {
    _settingsService = ref.watch(settingServiceProvider);
    final themeMode = await _settingsService.themeMode();

    return ThemeSetting(mode: themeMode);
    // final theme = await _settingsService.
  }
  // SettingsController(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null || state.value == null) return;
    if (newThemeMode == state.value?.mode) return;

    state = AsyncData(state.value!.copyWith(mode: newThemeMode));
    // await _settingsService.updateThemeMode(newThemeMode);
  }
}
