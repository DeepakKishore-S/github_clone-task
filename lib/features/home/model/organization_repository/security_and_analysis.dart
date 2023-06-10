import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'secret_scanning.dart';
import 'secret_scanning_push_protection.dart';

class SecurityAndAnalysis extends Equatable {
  final SecretScanning? secretScanning;
  final SecretScanningPushProtection? secretScanningPushProtection;

  const SecurityAndAnalysis({
    this.secretScanning,
    this.secretScanningPushProtection,
  });

  factory SecurityAndAnalysis.fromMap(Map<String, dynamic> data) {
    return SecurityAndAnalysis(
      secretScanning: data['secret_scanning'] == null
          ? null
          : SecretScanning.fromMap(
              data['secret_scanning'] as Map<String, dynamic>),
      secretScanningPushProtection: data['secret_scanning_push_protection'] ==
              null
          ? null
          : SecretScanningPushProtection.fromMap(
              data['secret_scanning_push_protection'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'secret_scanning': secretScanning?.toMap(),
        'secret_scanning_push_protection':
            secretScanningPushProtection?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SecurityAndAnalysis].
  factory SecurityAndAnalysis.fromJson(String data) {
    return SecurityAndAnalysis.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SecurityAndAnalysis] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      secretScanning,
      secretScanningPushProtection,
    ];
  }
}
