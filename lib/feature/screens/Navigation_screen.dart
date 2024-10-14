import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/services/services.dart';
import 'package:news_app/feature/News/presentation/controller/main/main_bloc.dart';
import 'package:news_app/feature/News/presentation/controller/search/search_bloc.dart';
import 'package:news_app/feature/News/presentation/screen/business_screen.dart';
import 'package:news_app/feature/News/presentation/screen/science_screen.dart';
import 'package:news_app/feature/News/presentation/screen/search_screen.dart';
import 'package:news_app/feature/News/presentation/screen/sports_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const BusinessScreen(),
      const SportScreen(),
      const ScienceScreen(),
    ];

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('News'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => sl<SearchBloc>(),
                                child: const SearchScreen(value: ''),
                              )));
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                icon: const Icon(Icons.brightness_6),
                onPressed: () {
                  context.read<MainBloc>().add(const ToggleThemeEvent());
                },
              ),
            ],
          ),
          body: screens[state.index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: (index) {
              context.read<MainBloc>().add(ChangeNavigationBarEvent(index));
            },
            selectedItemColor: Colors.red,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science),
                label: 'Science',
              ),
            ],
          ),
        );
      },
    );
  }
}
