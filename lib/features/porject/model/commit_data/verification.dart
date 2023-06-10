import 'package:equatable/equatable.dart';

class Verification extends Equatable {
  final bool? verified;
  final String? reason;
  final dynamic signature;
  final dynamic payload;

  const Verification({
    this.verified,
    this.reason,
    this.signature,
    this.payload,
  });

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        verified: json['verified'] as bool?,
        reason: json['reason'] as String?,
        signature: json['signature'] as dynamic,
        payload: json['payload'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'verified': verified,
        'reason': reason,
        'signature': signature,
        'payload': payload,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [verified, reason, signature, payload];
}
