import 'dart:convert';

import 'package:equatable/equatable.dart';

class Permissions extends Equatable {
  final bool? admin;
  final bool? maintain;
  final bool? push;
  final bool? triage;
  final bool? pull;

  const Permissions({
    this.admin,
    this.maintain,
    this.push,
    this.triage,
    this.pull,
  });

  factory Permissions.fromMap(Map<String, dynamic> data) => Permissions(
        admin: data['admin'] as bool?,
        maintain: data['maintain'] as bool?,
        push: data['push'] as bool?,
        triage: data['triage'] as bool?,
        pull: data['pull'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'admin': admin,
        'maintain': maintain,
        'push': push,
        'triage': triage,
        'pull': pull,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Permissions].
  factory Permissions.fromJson(String data) {
    return Permissions.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Permissions] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [admin, maintain, push, triage, pull];
}
