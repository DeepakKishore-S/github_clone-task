import 'package:firebase_auth/firebase_auth.dart';
import 'package:github_clone/utils/api_status.dart';
import 'package:github_clone/utils/helper_functions.dart';
import 'package:github_clone/utils/strings.dart';

class AuthenticationService {
  static Future signInWithGitHub() async {
    try {
      GithubAuthProvider githubProvider = GithubAuthProvider();
      final List<String> scopes = ["repo", "admin:org"];
      for (String scope in scopes) {
        githubProvider.addScope(scope);
      }
      UserCredential data =
          await FirebaseAuth.instance.signInWithProvider(githubProvider);
      debugModePrint(data);
      return Success(
        code: "200",
        response: data,
      );
    } on FirebaseException catch (e) {
      debugModePrint(e.code);
      if (e.code == "unknown") {
        return Failure(
          code: "103",
          message: ApiResponseMessage.unknownError,
        );
      }
      return Failure(
        code: e.code,
        message: e.message!,
      );
    } catch (e) {
      return Failure(
        code: "103",
        message: ApiResponseMessage.unknownError,
      );
    }
  }
}
