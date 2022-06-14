import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'firebase/firebase_options.dart';
import 'screen/home.dart';
import 'screen/login.dart';
import 'screen/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(const ProviderScope(child: BaseADM()));
}

// Routerの定義。Providerで取得できるようにしておく。
final routerProvider = Provider(
  (ref) => GoRouter(
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
                builder: (context, state) => const LoginPage(title: "BaseADM")),
          ])
    ],
  ),
);

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
