// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ThemeSetting {
  final ThemeMode mode;

  ThemeSetting({
    required this.mode,
  });

  @override
  bool operator ==(covariant ThemeSetting other) {
    if (identical(this, other)) return true;

    return other.mode == mode;
  }

  @override
  int get hashCode => mode.hashCode;

  ThemeSetting copyWith({
    ThemeMode? mode,
  }) {
    return ThemeSetting(
      mode: mode ?? this.mode,
    );
  }

  @override
  String toString() => 'ThemeSetting(mode: $mode)';
}
