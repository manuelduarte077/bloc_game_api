import 'package:bloc_api/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_api/bloc/blocs.dart';
import 'package:bloc_api/repositories/game_repository.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => GameDataBloc(
        GameRepository(),
      ),
      child: const GameApp(),
    ),
  );
}
