import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part '../generated/components/loginprovider.freezed.dart';

final loginProvider = StateNotifierProvider<LoginProvider, LoginProviderState>(
  (ref) => LoginProvider(
    ref.read,
    FirebaseAuth.instance,
  ),
);

class LoginProvider extends StateNotifier<LoginProviderState> {
  LoginProvider(
    this._read,
    this._auth,
  ) : super(LoginProviderState()) {
    if (kIsWeb) {
      _auth.setPersistence(Persistence.LOCAL);
    }

    _auth.authStateChanges().listen(
      (event) {
        state = state.copyWith(
          firebaseUser: AsyncValue.data(event),
        );
      },
    );
  }

  final Reader _read;
  final FirebaseAuth _auth;

  Future<UserCredential> create(String id, String password) =>
      _auth.createUserWithEmailAndPassword(
        email: id,
        password: password,
      );

  Future<void> login(String id, String password) =>
      _auth.signInWithEmailAndPassword(
        email: id,
        password: password,
      );

  Future<void> logout() => _auth.signOut();
}

@freezed
class LoginProviderState with _$LoginProviderState {
  factory LoginProviderState({
    @Default(AsyncValue<User?>.loading()) AsyncValue<User?> firebaseUser,
  }) = _LoginProviderState;

  LoginProviderState._();

  late final bool isloggedIn = firebaseUser.asData?.value != null;
}
