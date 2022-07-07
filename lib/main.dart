import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'components/gorouter.dart';
import 'components/refreshlistenableprovider.dart';
import 'firebase/firebase_options.dart';

Future<void> main() async {
  //runApp()の前にFlutterの機能を利用したい場合に宣言
  WidgetsFlutterBinding.ensureInitialized();

//Firebaseの初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

//GoRouter URLパスから#を削除
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

//ProviderScopeでラップ。アプリ内のどこからでも全てのプロバイダーにアクセス可能にする
  runApp(const ProviderScope(child: BaseADM()));
}

class BaseADM extends ConsumerWidget {
  const BaseADM({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    ref.listen(
      refreshListenableProvider,
      (Listenable? prevListenable, Listenable newListenable) =>
          ref.read(routerProvider).refresh(),
    );

    return MaterialApp.router(
      title: 'BaseADM',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blueGrey,
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
