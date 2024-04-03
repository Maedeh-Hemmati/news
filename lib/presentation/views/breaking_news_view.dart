import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../cubits/remote_articles_cubit.dart';

class BreakingNewsView extends HookWidget{
  const BreakingNewsView({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    final remoteArticlesCubit = BlocProvider.of<RemoteArticleCubit>(context);
    final scrollController = useScrollController();

    useEffect(() {
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News',style: TextStyle(color: Colors.black),),
      ),
      body: BlocBuilder<RemoteArticlesCubit,RemoteArticlesState>(
        builder: (_, state){
          switch(state.runtimeType){
        },
      )
    );
  }

}