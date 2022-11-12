import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<HomeBloc>(),
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(FetchBooksData(homeBloc.state.page ?? 0));
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !(homeBloc.state.isLoading ?? false)) {
      homeBloc.add(FetchBooksData((homeBloc.state.page ?? 0) + 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}
