import 'dart:convert';

import 'package:equatable/equatable.dart';

class OrganizationData extends Equatable {
  final String? login;
  final int? id;
  final String? nodeId;
  final String? url;
  final String? reposUrl;
  final String? eventsUrl;
  final String? hooksUrl;
  final String? issuesUrl;
  final String? membersUrl;
  final String? publicMembersUrl;
  final String? avatarUrl;
  final dynamic description;

  const OrganizationData({
    this.login,
    this.id,
    this.nodeId,
    this.url,
    this.reposUrl,
    this.eventsUrl,
    this.hooksUrl,
    this.issuesUrl,
    this.membersUrl,
    this.publicMembersUrl,
    this.avatarUrl,
    this.description,
  });

  factory OrganizationData.fromMap(Map<String, dynamic> data) {
    return OrganizationData(
      login: data['login'] as String?,
      id: data['id'] as int?,
      nodeId: data['node_id'] as String?,
      url: data['url'] as String?,
      reposUrl: data['repos_url'] as String?,
      eventsUrl: data['events_url'] as String?,
      hooksUrl: data['hooks_url'] as String?,
      issuesUrl: data['issues_url'] as String?,
      membersUrl: data['members_url'] as String?,
      publicMembersUrl: data['public_members_url'] as String?,
      avatarUrl: data['avatar_url'] as String?,
      description: data['description'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'login': login,
        'id': id,
        'node_id': nodeId,
        'url': url,
        'repos_url': reposUrl,
        'events_url': eventsUrl,
        'hooks_url': hooksUrl,
        'issues_url': issuesUrl,
        'members_url': membersUrl,
        'public_members_url': publicMembersUrl,
        'avatar_url': avatarUrl,
        'description': description,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrganizationData].
  factory OrganizationData.fromJson(Map<String, dynamic> data) {
    return OrganizationData.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [OrganizationData] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      login,
      id,
      nodeId,
      url,
      reposUrl,
      eventsUrl,
      hooksUrl,
      issuesUrl,
      membersUrl,
      publicMembersUrl,
      avatarUrl,
      description,
    ];
  }
}
