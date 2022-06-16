import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'firebase/firebase_options.dart';
import 'screen/home.dart';
import 'screen/login.dart';
import 'screen/register.dart';

Future<void> main() async {
  //runApp()の前にFlutterの機能を利用したい場合に宣言
  WidgetsFlutterBinding.ensureInitialized();

//Firebaseの初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

//URLパスから#を削除
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  //ProviderScopeでラップ。アプリ内のどこからでも全てのプロバイダーにアクセス可能にする
  runApp(const ProviderScope(child: BaseADM()));
}

/// ユーザープロバイダー
final userProvider = StateProvider((ref) {
  return FirebaseAuth.instance.currentUser;
});

// Routerの定義。Providerで取得できるようにしておく。
final routerProvider = Provider((ref) => GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [
        GoRoute(
            path: "/",
            builder: (context, state) => const HomePage(title: "BaseADM"),
            routes: [
              GoRoute(
                  path: "register",
                  builder: (context, state) =>
                      const RegisterPage(title: "BaseADM")),
              GoRoute(
                  path: "login",
                  builder: (context, state) =>
                      const LoginPage(title: "BaseADM")),
            ]),
      ],
      // ユーザーがログインしていない場合はログインページにリダイレクト
      redirect: (state) {
        // ユーザーがログインしていない場合はログインが必要
        final userInfo = ref.read(userProvider.state).state;
        final loggingIn = state.subloc == '/login';
        if (userInfo == null) {
          return loggingIn ? null : '/login';
        } else {
          if (loggingIn) return '/';
          // ユーザーがログインしているにも関わらず、まだログイン画面にいる場合は
          // ホーム画面に誘導する
        }
        // 一切リダイレクトが不要な場合
        return null;
      },
    ));

class BaseADM extends ConsumerWidget {
  const BaseADM({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'BaseADM',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blueGrey,
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
    );
  }
}
