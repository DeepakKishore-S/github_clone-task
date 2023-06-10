import 'dart:convert';

import 'package:equatable/equatable.dart';

class SecretScanning extends Equatable {
  final String? status;

  const SecretScanning({this.status});

  factory SecretScanning.fromMap(Map<String, dynamic> data) {
    return SecretScanning(
      status: data['status'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SecretScanning].
  factory SecretScanning.fromJson(String data) {
    return SecretScanning.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SecretScanning] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status];
}
