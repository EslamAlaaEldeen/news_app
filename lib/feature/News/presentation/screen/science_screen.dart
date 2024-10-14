import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/services/services.dart';
import 'package:news_app/core/utils/enum.dart';
import 'package:news_app/feature/News/presentation/components/article_item.dart';
import 'package:news_app/feature/News/presentation/controller/science/science_bloc.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ScienceBloc>()..add(GetScienceEvent()),
      child: Scaffold(
        body: BlocBuilder<ScienceBloc, ScienceState>(
          builder: (context, state) {
            switch (state.scienceState) {
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
                      final sc = state.getScience[index];
                      return ArticleItem(
                        bs: sc,
                      );
                    },
                    itemCount: state.getScience.length);
              case RequestState.error:
                return SizedBox(
                  height: 400,
                  child: Center(
                    child: Text(state.scienceMessage),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
