import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/services/services.dart';
import 'package:news_app/feature/News/presentation/components/search_results.dart';
import 'package:news_app/feature/News/presentation/controller/search/search_bloc.dart';

class SearchScreen extends StatefulWidget {
  final String value;

  const SearchScreen({super.key, required this.value});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.value;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: _searchController,
                          decoration: InputDecoration(
                            labelText: 'Search',
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () {
                                _searchController.clear();
                                context
                                    .read<SearchBloc>()
                                    .add(const GetSearchEvent(''));
                              },
                            ),
                          ),
                          onChanged: (value) {
                            context
                                .read<SearchBloc>()
                                .add(GetSearchEvent(value));
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SearchResults(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
