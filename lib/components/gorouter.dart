// Routerの定義。Providerで取得できるようにしておく。
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../screen/home.dart';
import '../screen/login.dart';
import '../screen/register.dart';
import 'loginprovider.dart';

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
        final isLoggedIn = ref.read(loginProvider).isloggedIn;
        final goingToLogin = state.subloc == '/login';

        final params = Uri.parse(state.location).queryParameters;
        final from = params['from'] ?? '';

        if (!isLoggedIn && !goingToLogin) {
          return '/login?from=${state.location}';
        }

        if (isLoggedIn && goingToLogin) {
          return from.isNotEmpty && from != '/' ? from : '/';
        }

        return null;
      },
    ));
