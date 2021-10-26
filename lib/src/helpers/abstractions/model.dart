import 'dart:convert';

/// Abstraction for models
abstract class Model {
  const Model();

  Map<String, dynamic> toMap();

  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
