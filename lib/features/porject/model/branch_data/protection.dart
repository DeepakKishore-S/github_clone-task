import 'package:equatable/equatable.dart';

import 'required_status_checks.dart';

class Protection extends Equatable {
  final RequiredStatusChecks? requiredStatusChecks;

  const Protection({this.requiredStatusChecks});

  factory Protection.fromJson(Map<String, dynamic> json) => Protection(
        requiredStatusChecks: json['required_status_checks'] == null
            ? null
            : RequiredStatusChecks.fromJson(
                json['required_status_checks'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'required_status_checks': requiredStatusChecks?.toJson(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [requiredStatusChecks];
}
