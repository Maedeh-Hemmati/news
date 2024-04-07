import 'package:go_router/go_router.dart';

import '../../presentation/views/breaking_news_view.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const BreakingNewsView(),
    ),
  ],
);