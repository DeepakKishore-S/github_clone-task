import 'package:equatable/equatable.dart';

import 'author.dart';
import 'commit.dart';
import 'committer.dart';
import 'parent.dart';

class CommitData extends Equatable {
  final String? sha;
  final String? nodeId;
  final Commit? commit;
  final String? url;
  final String? htmlUrl;
  final String? commentsUrl;
  final Author? author;
  final Committer? committer;
  final List<Parent>? parents;

  const CommitData({
    this.sha,
    this.nodeId,
    this.commit,
    this.url,
    this.htmlUrl,
    this.commentsUrl,
    this.author,
    this.committer,
    this.parents,
  });

  factory CommitData.fromJson(Map<String, dynamic> json) {
    return CommitData(
      sha: json['sha'] as String?,
      nodeId: json['node_id'] as String?,
      commit: json['commit'] == null
          ? null
          : Commit.fromJson(json['commit'] as Map<String, dynamic>),
      url: json['url'] as String?,
      htmlUrl: json['html_url'] as String?,
      commentsUrl: json['comments_url'] as String?,
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      committer: json['committer'] == null
          ? null
          : Committer.fromJson(json['committer'] as Map<String, dynamic>),
      parents: (json['parents'] as List<dynamic>?)
          ?.map((e) => Parent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'sha': sha,
        'node_id': nodeId,
        'commit': commit?.toJson(),
        'url': url,
        'html_url': htmlUrl,
        'comments_url': commentsUrl,
        'author': author?.toJson(),
        'committer': committer?.toJson(),
        'parents': parents?.map((e) => e.toJson()).toList(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      sha,
      nodeId,
      commit,
      url,
      htmlUrl,
      commentsUrl,
      author,
      committer,
      parents,
    ];
  }
}
