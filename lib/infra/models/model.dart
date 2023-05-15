import 'package:flutter/material.dart';

abstract class Model {
  const Model();

  Map<String, dynamic> toJson();

  @override
  String toString() {
    return toJson().toString();
  }

  String? stringFromJson(Map map, String key, {String? defaultVal}) {
    if (isNotNull(map[key])) {
      return map[key].toString().trim();
    }
    return defaultVal;
  }

  bool boolFromJson(Map map, String key, {bool defVal = false}) {
    if (map.containsKey(key)) {
      return map[key];
    }
    return defVal;
  }

  Color? colorFromJson(Map map, String key, {Color? defaultVal}) {
    if (isNotNull(map[key])) {
      String colorCode = map[key].toString();
      var hexColor = colorCode.replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF$hexColor";
      }
      if (hexColor.length == 8) {
        return Color(int.parse("0x$hexColor"));
      }
    }
    return defaultVal;
  }

  int? intFromJson(Map map, String key, {int? defaultVal}) {
    if (isNotNull(map[key])) {
      return num.tryParse(map[key].toString())?.toInt() ?? defaultVal;
    }
    return defaultVal;
  }

  double? doubleFromJson(Map map, String key, {double? defaultVal}) {
    if (isNotNull(map[key])) {
      return num.tryParse(map[key].toString())?.toDouble() ?? defaultVal;
    }
    return defaultVal;
  }

  num? numFromJson(Map map, String key, {num? defaultVal}) {
    if (isNotNull(map[key])) {
      if (map[key] is String) {
        return num.tryParse(map[key].toString()) ?? defaultVal;
      }
      if (map[key] is num) {
        return map[key];
      }
    }
    return defaultVal;
  }

  DateTime? dateFromJson(Map map, String key, {DateTime? defaultVal}) {
    if (isNotNull(map[key])) {
      if (map[key] is String) {
        return DateTime.tryParse(map[key])?.toLocal() ?? defaultVal;
      } else if (map[key] is num) {
        num number = map[key];
        return DateTime.fromMillisecondsSinceEpoch(number.toInt()).toLocal();
      }
    }
    return defaultVal;
  }

  List listFromJson(Map map, String key) {
    if (isNotNull(map[key]) && map[key] is List) {
      return List.from(map[key]);
    }
    return [];
  }

  bool isNotNull(Object? val) {
    return val != null && val != 'null' && val != 'Null';
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
