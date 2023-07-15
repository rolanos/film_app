import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/presentation/bloc/bloc/movie_bloc.dart';
import 'package:quote_app/presentation/widgets/downloading.dart';
import 'package:quote_app/presentation/pages/info.dart';
import 'package:quote_app/presentation/widgets/loaded.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        final bloc = context.read<MovieBloc>();
        return GestureDetector(
          onVerticalDragEnd: (endDetails) {
            double? velocity = endDetails.primaryVelocity;
            velocity = velocity ?? 0;
            if (velocity < 0) {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => BlocProvider.value(
                        value: bloc,
                        child: const InfoPage(),
                      ),
                  backgroundColor: Colors.transparent);
            }
          },
          child: ScaffoldMessenger(
            child: Scaffold(
              body: SafeArea(
                child: Center(
                  child: Builder(
                    builder: (context) {
                      if (state is MovieErrorState) {
                        return const Center(
                          child: Text("Error"),
                        );
                      }
                      if (state is MovieEmptyState) {
                        return downloading(context);
                      }
                      if (state is MovieLoadingState) {
                        return downloading(context);
                      }
                      if (state is MovieLoadedState) {
                        return const Loaded();
                      }
                      return const CircularProgressIndicator(
                        color: Colors.red,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
