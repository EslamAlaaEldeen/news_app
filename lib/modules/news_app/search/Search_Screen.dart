import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchcontroller,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Search must not empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefix: Icon(Icons.search),
                    labelText: 'search',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Expanded(child: articlebuilder(list, context, issearch: true)),
            ],
          ),
        );
      },
    );
  }
}
