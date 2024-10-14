import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/services/services.dart';
import 'package:news_app/core/utils/enum.dart';
import 'package:news_app/feature/News/presentation/components/article_item.dart';
import 'package:news_app/feature/News/presentation/controller/sports/sports_bloc.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SportsBloc>()..add(GetSportsEvent()),
      child: Scaffold(
        body: BlocBuilder<SportsBloc, SportsState>(
          builder: (context, state) {
            switch (state.sportsState) {
              case RequestState.loading:
                return const SizedBox(
                  height: 400,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                );
              case RequestState.success:
                return ListView.separated(
                    separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsetsDirectional.only(start: 20),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey[300],
                          ),
                        ),
                    itemBuilder: (context, index) {
                      final sp = state.getSports[index];
                      return ArticleItem(
                        bs: sp,
                      );
                    },
                    itemCount: state.getSports.length);
              case RequestState.error:
                return SizedBox(
                  height: 400,
                  child: Center(
                    child: Text(state.sportsMessage),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
