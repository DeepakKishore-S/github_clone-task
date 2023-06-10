class AppUri {
  static String baseUrl = "https://api.github.com";

  static String organizations = "$baseUrl/user/orgs";
  static String organizationRepos(String orgName) =>
      "$baseUrl/orgs/$orgName/repos";
  static String branches({
    required String owner,
    required String repo,
  }) =>
      "$baseUrl/repos/$owner/$repo/branches";
  static String commits({
    required String owner,
    required String repo,
    required String branch,
  }) =>
      "$baseUrl/repos/$owner/$repo/commits?sha=$branch";
}
//https://api.github.com/repos/ziga-team/final_bloc_example/commits
//https://api.github.com/repos/ziga-team/final_bloc_example/commits?sha=dev
