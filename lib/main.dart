import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/presentation/bloc/bloc/movie_bloc.dart';
import 'package:quote_app/presentation/pages/home.dart';
import 'package:quote_app/presentation/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getTheme(),
      home: BlocProvider<MovieBloc>(
        create: (context) => MovieBloc()..add(MovieGetRandomEvent()),
        child: const HomePage(),
      ),
    );
  }
}
