import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ユーザープロバイダー
final userProvider = StateProvider((ref) {
  return FirebaseAuth.instance.currentUser;
});
