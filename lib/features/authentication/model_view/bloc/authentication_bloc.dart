import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:github_clone/features/authentication/model/user/user.dart';
import 'package:github_clone/features/authentication/repository/authentication_serivce.dart';
import 'package:github_clone/utils/api_status.dart';
import 'package:github_clone/utils/helper_functions.dart';
import 'package:github_clone/utils/strings.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(
          const AuthenticationBlocInitial(
            isLoading: false,
          ),
        ) {
    on<AuthenticateUserEvent>(authenticateUserEvent);
    on<AppEventInitialize>(appEventInitialize);
  }

  UserData? _user;
  String? _accessToken;

  UserData? get user => _user;

  String? get accessToken => _accessToken;

  Future<FutureOr<void>> authenticateUserEvent(
    AuthenticationEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    debugModePrint("Authentication event");
    emit(
      const AuthenticationBlocInitial(
        isLoading: true,
      ),
    );
    final response = await AuthenticationService.signInWithGitHub();
    if (response is Success) {
      UserCredential? userData = response.response as UserCredential;
      _user = UserData(
        name: userData.additionalUserInfo!.profile![name],
        userName: userData.additionalUserInfo!.profile![userName],
        profilePicture: userData.additionalUserInfo!.profile![userAvatar],
        accessToken: userData.credential!.accessToken!,
      );
      _accessToken = userData.credential!.accessToken;
      emit(
        const AuthencticatedState(
          isLoading: false,
          message: ApiResponseMessage.authenticated,
        ),
      );
    } else {
      emit(
        AuthenticationBlocInitial(
          isLoading: false,
          error: response,
        ),
      );
    }
  }

  FutureOr<void> appEventInitialize(
    AppEventInitialize event,
    Emitter<AuthenticationState> emit,
  ) {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      _user = UserData(
        name: firebaseUser!.displayName,
        userName: userName,
        profilePicture: firebaseUser!.photoURL!,
        accessToken: firebaseUser.refreshToken,
      );
      _accessToken = firebaseUser.refreshToken;
      emit(
        const AuthencticatedState(
          isLoading: false,
          message: ApiResponseMessage.authenticated,
        ),
      );
    } else {
      emit(
        const AuthenticationBlocInitial(
          isLoading: false,
        ),
      );
    }
  }
}
