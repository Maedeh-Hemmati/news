import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'config/router/app_router.dart';

void main() {
  runApp(OKToast(
    child: MaterialApp.router(
      routerConfig: AppRouter().config(),
    ),
  ));
}
