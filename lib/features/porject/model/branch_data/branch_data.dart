import 'package:equatable/equatable.dart';

import 'commit.dart';
import 'protection.dart';

class BranchData extends Equatable {
  final String? name;
  final Commit? commit;
  final bool? protected;
  final Protection? protection;
  final String? protectionUrl;

  const BranchData({
    this.name,
    this.commit,
    this.protected,
    this.protection,
    this.protectionUrl,
  });

  factory BranchData.fromJson(Map<String, dynamic> json) => BranchData(
        name: json['name'] as String?,
        commit: json['commit'] == null
            ? null
            : Commit.fromJson(json['commit'] as Map<String, dynamic>),
        protected: json['protected'] as bool?,
        protection: json['protection'] == null
            ? null
            : Protection.fromJson(json['protection'] as Map<String, dynamic>),
        protectionUrl: json['protection_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'commit': commit?.toJson(),
        'protected': protected,
        'protection': protection?.toJson(),
        'protection_url': protectionUrl,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      name,
      commit,
      protected,
      protection,
      protectionUrl,
    ];
  }
}
