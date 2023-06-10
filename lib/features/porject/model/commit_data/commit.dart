import 'package:equatable/equatable.dart';

import 'author.dart';
import 'committer.dart';
import 'tree.dart';
import 'verification.dart';

class Commit extends Equatable {
  final Author? author;
  final Committer? committer;
  final String? message;
  final Tree? tree;
  final String? url;
  final int? commentCount;
  final Verification? verification;

  const Commit({
    this.author,
    this.committer,
    this.message,
    this.tree,
    this.url,
    this.commentCount,
    this.verification,
  });

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        author: json['author'] == null
            ? null
            : Author.fromJson(json['author'] as Map<String, dynamic>),
        committer: json['committer'] == null
            ? null
            : Committer.fromJson(json['committer'] as Map<String, dynamic>),
        message: json['message'] as String?,
        tree: json['tree'] == null
            ? null
            : Tree.fromJson(json['tree'] as Map<String, dynamic>),
        url: json['url'] as String?,
        commentCount: json['comment_count'] as int?,
        verification: json['verification'] == null
            ? null
            : Verification.fromJson(
                json['verification'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'author': author?.toJson(),
        'committer': committer?.toJson(),
        'message': message,
        'tree': tree?.toJson(),
        'url': url,
        'comment_count': commentCount,
        'verification': verification?.toJson(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      author,
      committer,
      message,
      tree,
      url,
      commentCount,
      verification,
    ];
  }
}
