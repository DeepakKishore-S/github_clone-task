import 'package:equatable/equatable.dart';

class RequiredStatusChecks extends Equatable {
  final String? enforcementLevel;
  final List? contexts;

  const RequiredStatusChecks({this.enforcementLevel, this.contexts});

  factory RequiredStatusChecks.fromJson(Map<String, dynamic> json) {
    return RequiredStatusChecks(
      enforcementLevel: json['enforcement_level'] as String?,
      contexts: json['contexts'] as List?,
    );
  }

  Map<String, dynamic> toJson() => {
        'enforcement_level': enforcementLevel,
        'contexts': contexts,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [enforcementLevel, contexts];
}
