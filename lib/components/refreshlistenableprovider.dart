import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'loginprovider.dart';

final refreshListenableProvider = Provider(
  (ref) => Listenable.merge(
    [
      ValueNotifier(ref.watch(loginProvider).isloggedIn),
    ],
  ),
);
