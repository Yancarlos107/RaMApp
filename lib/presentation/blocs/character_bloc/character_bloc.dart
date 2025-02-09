import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_characters.dart';
import '../../../domain/entities/character.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacters getCharacters;

  CharacterBloc({required this.getCharacters}) : super(CharacterInitial()) {
    on<FetchCharacters>((event, emit) async {
      emit(CharacterLoading());
      final result = await getCharacters.call(page: event.page);
      result.fold(
        (failure) => emit(CharacterError()),
        (characters) {
          if (characters.isEmpty) {
            emit(CharacterEmpty());
          } else {
            emit(CharacterLoaded(characters));
          }
        },
      );
    });
  }
}
