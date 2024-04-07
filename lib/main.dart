import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

import 'config/router/app_router.dart';
import 'config/themes/app_themes.dart';
import 'core/constants/strings.dart';
import 'core/services/locator.dart';
import 'domain/usecases/get_breaking_news_articles_usecase.dart';
import 'presentation/cubits/remote_articles_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => RemoteArticleCubit(locator<GetBreakingNewsArticlesUseCase>(),)..getBreakingNewsArticles())],
        child: OKToast(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            title: appTitle,
            theme: AppTheme.light,
          ),
        ));
  }
}
