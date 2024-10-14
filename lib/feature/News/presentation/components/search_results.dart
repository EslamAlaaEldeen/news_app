import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/utils/enum.dart';
import 'package:news_app/feature/News/presentation/controller/search/search_bloc.dart';
import 'package:news_app/feature/web_view/web_view_screen.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    var format = DateFormat.yMEd();
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        switch (state.searchState) {
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
            if (state.search.isEmpty) {
              return const Center(child: Text('No results found.'));
            }
            return ListView.separated(
                itemBuilder: (context, index) {
                  final search = state.search[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewScreen(search.url)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                child: search.backdropPath.isNotEmpty
                                    ? CachedNetworkImage(
                                        width: 160.0,
                                        height: 150,
                                        fit: BoxFit.cover,
                                        imageUrl: search.backdropPath,
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      )
                                    : Container(
                                        width: 160.0,
                                        height: 150,
                                        color: Colors.grey,
                                        child: const Icon(
                                            Icons.image_not_supported),
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      search.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    search.author, // Parse and format the date
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    format.format(DateTime.parse(search
                                        .date)), // Parse and format the date
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                itemCount: state.search.length);
          case RequestState.error:
            return SizedBox(
              height: 400,
              child: Center(
                child: Text(state.searchMessage),
              ),
            );
        }
      },
    );
  }
}
