import 'package:equatable/equatable.dart';

class Tree extends Equatable {
  final String? sha;
  final String? url;

  const Tree({this.sha, this.url});

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
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
