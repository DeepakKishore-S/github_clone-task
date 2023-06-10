import 'dart:convert';

import 'package:equatable/equatable.dart';

class SecretScanningPushProtection extends Equatable {
  final String? status;

  const SecretScanningPushProtection({this.status});

  factory SecretScanningPushProtection.fromMap(Map<String, dynamic> data) {
    return SecretScanningPushProtection(
      status: data['status'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SecretScanningPushProtection].
  factory SecretScanningPushProtection.fromJson(String data) {
    return SecretScanningPushProtection.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SecretScanningPushProtection] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status];
}
