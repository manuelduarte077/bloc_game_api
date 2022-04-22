import 'package:bloc_api/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_api/bloc/blocs.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameDataBloc, GameDataState>(
        builder: (context, state) {
          if (state is GameDataInitialState) {
            context.read<GameDataBloc>().add(LoadGameDataEvent());
            return CircularProgressIndicator();
          } else if (state is GameDataLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GameDataLoadedState) {
            return BuildGameModel(apiResult: state.apiResult);
          } else if (state is GameDataErrorState) {
            return Center(
              child: Text('Uh oh! Something went wrong!'),
            );
          }
          return Text('Error');
        },
      ),
    );
  }
}
