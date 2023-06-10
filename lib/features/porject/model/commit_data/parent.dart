import 'package:equatable/equatable.dart';

class Parent extends Equatable {
  final String? sha;
  final String? url;
  final String? htmlUrl;

  const Parent({this.sha, this.url, this.htmlUrl});

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        sha: json['sha'] as String?,
        url: json['url'] as String?,
        htmlUrl: json['html_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'sha': sha,
        'url': url,
        'html_url': htmlUrl,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [sha, url, htmlUrl];
}
