import 'package:equatable/equatable.dart';

class Commit extends Equatable {
  final String? sha;
  final String? url;

  const Commit({this.sha, this.url});

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        sha: json['sha'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'sha': sha,
        'url': url,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [sha, url];
}
