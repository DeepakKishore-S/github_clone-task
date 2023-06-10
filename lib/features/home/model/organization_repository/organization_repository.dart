import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'owner.dart';
import 'permissions.dart';
import 'security_and_analysis.dart';

class OrganizationRepository extends Equatable {
  final int? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final bool? private;
  final Owner? owner;
  final String? htmlUrl;
  final dynamic description;
  final bool? fork;
  final String? url;
  final String? forksUrl;
  final String? keysUrl;
  final String? collaboratorsUrl;
  final String? teamsUrl;
  final String? hooksUrl;
  final String? issueEventsUrl;
  final String? eventsUrl;
  final String? assigneesUrl;
  final String? branchesUrl;
  final String? tagsUrl;
  final String? blobsUrl;
  final String? gitTagsUrl;
  final String? gitRefsUrl;
  final String? treesUrl;
  final String? statusesUrl;
  final String? languagesUrl;
  final String? stargazersUrl;
  final String? contributorsUrl;
  final String? subscribersUrl;
  final String? subscriptionUrl;
  final String? commitsUrl;
  final String? gitCommitsUrl;
  final String? commentsUrl;
  final String? issueCommentUrl;
  final String? contentsUrl;
  final String? compareUrl;
  final String? mergesUrl;
  final String? archiveUrl;
  final String? downloadsUrl;
  final String? issuesUrl;
  final String? pullsUrl;
  final String? milestonesUrl;
  final String? notificationsUrl;
  final String? labelsUrl;
  final String? releasesUrl;
  final String? deploymentsUrl;
  final String? createdAt;
  final String? updatedAt;
  final String? pushedAt;
  final String? gitUrl;
  final String? sshUrl;
  final String? cloneUrl;
  final String? svnUrl;
  final dynamic homepage;
  final int? size;
  final int? stargazersCount;
  final int? watchersCount;
  final String? language;
  final bool? hasIssues;
  final bool? hasProjects;
  final bool? hasDownloads;
  final bool? hasWiki;
  final bool? hasPages;
  final bool? hasDiscussions;
  final int? forksCount;
  final dynamic mirrorUrl;
  final bool? archived;
  final bool? disabled;
  final int? openIssuesCount;
  final dynamic license;
  final bool? allowForking;
  final bool? isTemplate;
  final bool? webCommitSignoffRequired;
  final List<dynamic>? topics;
  final String? visibility;
  final int? forks;
  final int? openIssues;
  final int? watchers;
  final String? defaultBranch;
  final Permissions? permissions;
  final SecurityAndAnalysis? securityAndAnalysis;

  const OrganizationRepository({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.hasDiscussions,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.allowForking,
    this.isTemplate,
    this.webCommitSignoffRequired,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.permissions,
    this.securityAndAnalysis,
  });

  factory OrganizationRepository.fromMap(Map<String, dynamic> data) {
    return OrganizationRepository(
      id: data['id'] as int?,
      nodeId: data['node_id'] as String?,
      name: data['name'] as String?,
      fullName: data['full_name'] as String?,
      private: data['private'] as bool?,
      owner: data['owner'] == null
          ? null
          : Owner.fromMap(data['owner'] as Map<String, dynamic>),
      htmlUrl: data['html_url'] as String?,
      description: data['description'] as dynamic,
      fork: data['fork'] as bool?,
      url: data['url'] as String?,
      forksUrl: data['forks_url'] as String?,
      keysUrl: data['keys_url'] as String?,
      collaboratorsUrl: data['collaborators_url'] as String?,
      teamsUrl: data['teams_url'] as String?,
      hooksUrl: data['hooks_url'] as String?,
      issueEventsUrl: data['issue_events_url'] as String?,
      eventsUrl: data['events_url'] as String?,
      assigneesUrl: data['assignees_url'] as String?,
      branchesUrl: data['branches_url'] as String?,
      tagsUrl: data['tags_url'] as String?,
      blobsUrl: data['blobs_url'] as String?,
      gitTagsUrl: data['git_tags_url'] as String?,
      gitRefsUrl: data['git_refs_url'] as String?,
      treesUrl: data['trees_url'] as String?,
      statusesUrl: data['statuses_url'] as String?,
      languagesUrl: data['languages_url'] as String?,
      stargazersUrl: data['stargazers_url'] as String?,
      contributorsUrl: data['contributors_url'] as String?,
      subscribersUrl: data['subscribers_url'] as String?,
      subscriptionUrl: data['subscription_url'] as String?,
      commitsUrl: data['commits_url'] as String?,
      gitCommitsUrl: data['git_commits_url'] as String?,
      commentsUrl: data['comments_url'] as String?,
      issueCommentUrl: data['issue_comment_url'] as String?,
      contentsUrl: data['contents_url'] as String?,
      compareUrl: data['compare_url'] as String?,
      mergesUrl: data['merges_url'] as String?,
      archiveUrl: data['archive_url'] as String?,
      downloadsUrl: data['downloads_url'] as String?,
      issuesUrl: data['issues_url'] as String?,
      pullsUrl: data['pulls_url'] as String?,
      milestonesUrl: data['milestones_url'] as String?,
      notificationsUrl: data['notifications_url'] as String?,
      labelsUrl: data['labels_url'] as String?,
      releasesUrl: data['releases_url'] as String?,
      deploymentsUrl: data['deployments_url'] as String?,
      createdAt: data['created_at'] as String?,
      updatedAt: data['updated_at'] as String?,
      pushedAt: data['pushed_at'] as String?,
      gitUrl: data['git_url'] as String?,
      sshUrl: data['ssh_url'] as String?,
      cloneUrl: data['clone_url'] as String?,
      svnUrl: data['svn_url'] as String?,
      homepage: data['homepage'] as dynamic,
      size: data['size'] as int?,
      stargazersCount: data['stargazers_count'] as int?,
      watchersCount: data['watchers_count'] as int?,
      language: data['language'] as String?,
      hasIssues: data['has_issues'] as bool?,
      hasProjects: data['has_projects'] as bool?,
      hasDownloads: data['has_downloads'] as bool?,
      hasWiki: data['has_wiki'] as bool?,
      hasPages: data['has_pages'] as bool?,
      hasDiscussions: data['has_discussions'] as bool?,
      forksCount: data['forks_count'] as int?,
      mirrorUrl: data['mirror_url'] as dynamic,
      archived: data['archived'] as bool?,
      disabled: data['disabled'] as bool?,
      openIssuesCount: data['open_issues_count'] as int?,
      license: data['license'] as dynamic,
      allowForking: data['allow_forking'] as bool?,
      isTemplate: data['is_template'] as bool?,
      webCommitSignoffRequired: data['web_commit_signoff_required'] as bool?,
      topics: data['topics'] as List<dynamic>?,
      visibility: data['visibility'] as String?,
      forks: data['forks'] as int?,
      openIssues: data['open_issues'] as int?,
      watchers: data['watchers'] as int?,
      defaultBranch: data['default_branch'] as String?,
      permissions: data['permissions'] == null
          ? null
          : Permissions.fromMap(data['permissions'] as Map<String, dynamic>),
      securityAndAnalysis: data['security_and_analysis'] == null
          ? null
          : SecurityAndAnalysis.fromMap(
              data['security_and_analysis'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'node_id': nodeId,
        'name': name,
        'full_name': fullName,
        'private': private,
        'owner': owner?.toMap(),
        'html_url': htmlUrl,
        'description': description,
        'fork': fork,
        'url': url,
        'forks_url': forksUrl,
        'keys_url': keysUrl,
        'collaborators_url': collaboratorsUrl,
        'teams_url': teamsUrl,
        'hooks_url': hooksUrl,
        'issue_events_url': issueEventsUrl,
        'events_url': eventsUrl,
        'assignees_url': assigneesUrl,
        'branches_url': branchesUrl,
        'tags_url': tagsUrl,
        'blobs_url': blobsUrl,
        'git_tags_url': gitTagsUrl,
        'git_refs_url': gitRefsUrl,
        'trees_url': treesUrl,
        'statuses_url': statusesUrl,
        'languages_url': languagesUrl,
        'stargazers_url': stargazersUrl,
        'contributors_url': contributorsUrl,
        'subscribers_url': subscribersUrl,
        'subscription_url': subscriptionUrl,
        'commits_url': commitsUrl,
        'git_commits_url': gitCommitsUrl,
        'comments_url': commentsUrl,
        'issue_comment_url': issueCommentUrl,
        'contents_url': contentsUrl,
        'compare_url': compareUrl,
        'merges_url': mergesUrl,
        'archive_url': archiveUrl,
        'downloads_url': downloadsUrl,
        'issues_url': issuesUrl,
        'pulls_url': pullsUrl,
        'milestones_url': milestonesUrl,
        'notifications_url': notificationsUrl,
        'labels_url': labelsUrl,
        'releases_url': releasesUrl,
        'deployments_url': deploymentsUrl,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'pushed_at': pushedAt,
        'git_url': gitUrl,
        'ssh_url': sshUrl,
        'clone_url': cloneUrl,
        'svn_url': svnUrl,
        'homepage': homepage,
        'size': size,
        'stargazers_count': stargazersCount,
        'watchers_count': watchersCount,
        'language': language,
        'has_issues': hasIssues,
        'has_projects': hasProjects,
        'has_downloads': hasDownloads,
        'has_wiki': hasWiki,
        'has_pages': hasPages,
        'has_discussions': hasDiscussions,
        'forks_count': forksCount,
        'mirror_url': mirrorUrl,
        'archived': archived,
        'disabled': disabled,
        'open_issues_count': openIssuesCount,
        'license': license,
        'allow_forking': allowForking,
        'is_template': isTemplate,
        'web_commit_signoff_required': webCommitSignoffRequired,
        'topics': topics,
        'visibility': visibility,
        'forks': forks,
        'open_issues': openIssues,
        'watchers': watchers,
        'default_branch': defaultBranch,
        'permissions': permissions?.toMap(),
        'security_and_analysis': securityAndAnalysis?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrganizationRepository].
  factory OrganizationRepository.fromJson(Map<String, dynamic> data) {
    return OrganizationRepository.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [OrganizationRepository] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      nodeId,
      name,
      fullName,
      private,
      owner,
      htmlUrl,
      description,
      fork,
      url,
      forksUrl,
      keysUrl,
      collaboratorsUrl,
      teamsUrl,
      hooksUrl,
      issueEventsUrl,
      eventsUrl,
      assigneesUrl,
      branchesUrl,
      tagsUrl,
      blobsUrl,
      gitTagsUrl,
      gitRefsUrl,
      treesUrl,
      statusesUrl,
      languagesUrl,
      stargazersUrl,
      contributorsUrl,
      subscribersUrl,
      subscriptionUrl,
      commitsUrl,
      gitCommitsUrl,
      commentsUrl,
      issueCommentUrl,
      contentsUrl,
      compareUrl,
      mergesUrl,
      archiveUrl,
      downloadsUrl,
      issuesUrl,
      pullsUrl,
      milestonesUrl,
      notificationsUrl,
      labelsUrl,
      releasesUrl,
      deploymentsUrl,
      createdAt,
      updatedAt,
      pushedAt,
      gitUrl,
      sshUrl,
      cloneUrl,
      svnUrl,
      homepage,
      size,
      stargazersCount,
      watchersCount,
      language,
      hasIssues,
      hasProjects,
      hasDownloads,
      hasWiki,
      hasPages,
      hasDiscussions,
      forksCount,
      mirrorUrl,
      archived,
      disabled,
      openIssuesCount,
      license,
      allowForking,
      isTemplate,
      webCommitSignoffRequired,
      topics,
      visibility,
      forks,
      openIssues,
      watchers,
      defaultBranch,
      permissions,
      securityAndAnalysis,
    ];
  }
}
