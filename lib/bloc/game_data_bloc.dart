import 'package:bloc/bloc.dart';
import 'package:bloc_api/model/data_model.dart';
import 'package:bloc_api/repositories/game_repository.dart';
import 'package:equatable/equatable.dart';

part 'game_data_event.dart';
part 'game_data_state.dart';

class GameDataBloc extends Bloc<GameDataEvent, GameDataState> {
  final GameRepository gameRepository;

  GameDataBloc(this.gameRepository) : super(GameDataInitialState()) {
    on<GameDataEvent>((event, emit) async {
      if (event is LoadGameDataEvent) {
        emit(GameDataLoadingState());
        List<DataModel>? apiResult = await gameRepository.getGamesData();
        if (apiResult == null) {
          emit(GameDataErrorState());
        } else {
          emit(GameDataLoadedState(apiResult));
        }
      }
    });
  }
}
