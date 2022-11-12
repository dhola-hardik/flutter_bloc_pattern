import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'infra/repository/book_repository.dart';
import 'ui/bloc/home_bloc.dart';
import 'ui/home_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc(BookRepository())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) {},
      child: MaterialApp(
        title: 'Flutter Bloc Pattern',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
      ),
    );
  }
}
