import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          Image.asset('images/mkdf_logoBK-L.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 130,
                child: ElevatedButton(
                    onPressed: () {
                      context.go('/register');
                    },
                    child: const Text("ユーザー登録")),
              ),
              const SizedBox(width: 20),
              SizedBox(
                height: 50,
                width: 130,
                child: ElevatedButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: const Text("ログイン")),
              ),
            ],
          )
        ]),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
