import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:github_clone/features/home/model/organization_data/organization_data.dart';
import 'package:github_clone/features/home/model/organization_repository/organization_repository.dart';
import 'package:github_clone/utils/helper_functions.dart';
import 'package:github_clone/utils/uri.dart';
import 'package:http/http.dart' as https;
import 'package:github_clone/utils/api_status.dart';
import 'package:github_clone/utils/strings.dart';

class HomeService {
  static Future<ApiStaus> getUserOrganizations({required String token}) async {
    try {
      final response = await https.get(
        Uri.parse(AppUri.organizations),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/vnd.github+json",
          "Authorization": "Bearer $token"
        },
      );
      debugModePrint(response.statusCode);
      if (response.statusCode == 200) {
        final List decodedData = jsonDecode(response.body) as List;
        final List<OrganizationData> data =
            decodedData.map((data) => OrganizationData.fromJson(data)).toList();
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

  static Future<ApiStaus> getOrganizationRepos({
    required String token,
    required String organizationName,
  }) async {
    try {
      debugModePrint(organizationName);
      final response = await https.get(
        Uri.parse(
          AppUri.organizationRepos(
            organizationName,
          ),
        ),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/vnd.github+json",
          "Authorization": "Bearer $token"
        },
      );
      debugModePrint(AppUri.organizationRepos(
        organizationName,
      ));
      if (response.statusCode == 200) {
        final List decodedData = jsonDecode(response.body) as List;
        final List<OrganizationRepository> data = decodedData
            .map((data) => OrganizationRepository.fromJson(data))
            .toList();
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

  static Future<ApiStaus> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return Success(code: "200", response: "");
    } catch (e) {
      return Failure(
        code: "103",
        message: ApiResponseMessage.unknownError,
      );
    }
  }
}
