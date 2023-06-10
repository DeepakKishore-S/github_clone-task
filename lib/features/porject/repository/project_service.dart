import 'dart:convert';

import 'package:github_clone/features/porject/model/branch_data/branch_data.dart';
import 'package:github_clone/features/porject/model/commit_data/commit_data.dart';
import 'package:github_clone/utils/api_status.dart';
import 'package:github_clone/utils/helper_functions.dart';
import 'package:github_clone/utils/strings.dart';
import 'package:github_clone/utils/uri.dart';
import 'package:http/http.dart' as https;

class ProjectService {
  static Future<ApiStaus> getProjectBranches({
    required String token,
    required String repo,
    required String owner,
  }) async {
    try {
      final response = await https.get(
        Uri.parse(AppUri.branches(
          owner: owner,
          repo: repo,
        )),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/vnd.github+json",
          "Authorization": "Bearer $token"
        },
      );
      debugModePrint(response.body);
      if (response.statusCode == 200) {
        final List decodedData = jsonDecode(response.body) as List;
        final List<BranchData> data =
            decodedData.map((data) => BranchData.fromJson(data)).toList();
        return Success(code: "200", response: data);
      }
      return Failure(
        code: "103",
        message: ApiResponseMessage.unknownError,
      );
    } catch (e) {
      debugModePrint(e);
      return Failure(
        code: "103",
        message: ApiResponseMessage.unknownError,
      );
    }
  }

  static Future<ApiStaus> getBranchCommits({
    required String token,
    required String owner,
    required String repo,
    required String branch,
  }) async {
    // try {
    final response = await https.get(
      Uri.parse(
        AppUri.commits(owner: owner, repo: repo, branch: branch),
      ),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/vnd.github+json",
        "Authorization": "Bearer $token"
      },
    );
    debugModePrint(AppUri.commits(owner: owner, repo: repo, branch: branch));
    debugModePrint(response.body);
    if (response.statusCode == 200) {
      final List commits = jsonDecode(response.body);
      final List<CommitData> data =
          commits.map((e) => CommitData.fromJson(e)).toList();
      return Success(code: "200", response: data);
    }
    return Failure(
      code: "103",
      message: ApiResponseMessage.unknownError,
    );
    // } catch (e) {
    //   debugModePrint(e);
    //   return Failure(
    //     code: "103",
    //     message: ApiResponseMessage.unknownError,
    //   );
    // }
  }
}
