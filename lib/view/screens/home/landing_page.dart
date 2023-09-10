import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_api/view/widgets/widgets.dart';
import 'package:bloc_api/bloc/blocs.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  static const routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LandingPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Power'),
      ),
      body: BlocBuilder<GameDataBloc, GameDataState>(
        builder: (context, state) {
          if (state is GameDataInitialState) {
            context.read<GameDataBloc>().add(LoadGameDataEvent());
            return const CircularProgressIndicator();
          } else if (state is GameDataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GameDataLoadedState) {
            return BuildGameModel(apiResult: state.apiResult);
          } else if (state is GameDataErrorState) {
            return const Center(
              child: Text('Uh oh! Something went wrong!'),
            );
          }
          return const Text('Error');
        },
      ),
    );
  }
}
