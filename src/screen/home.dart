import 'package:flutter/material.dart';

import 'login.dart';
import 'register.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      Navigator.of(context).push<dynamic>(RegisterPage.route(
                        title: widget.title,
                      ));
                    },
                    child: const Text("ユーザー登録")),
              ),
              const SizedBox(width: 20),
              SizedBox(
                height: 50,
                width: 130,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push<dynamic>(LoginPage.route(
                        title: widget.title,
                      ));
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
