import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/character_repository.dart';
import 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository repository;

  CharacterCubit(this.repository) : super(CharacterInitial());

  void fetchCharacters() async {
    emit(CharacterLoading());
    try {
      final characters = await repository.fetchCharacters();
      emit(CharacterLoaded(characters));
    } catch (e) {
      emit(CharacterError('Failed to load characters'));
    }
  }
}
