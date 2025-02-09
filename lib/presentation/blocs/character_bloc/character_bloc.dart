import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/usecases/get_characters.dart';
import '../../../domain/usecases/search_characters.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacters getCharacters;
  final SearchCharacters searchCharacters;
  final List<Character> _cachedCharacters = [];
  bool _isSearching = false;

  CharacterBloc({
    required this.getCharacters,
    required this.searchCharacters,
  }) : super(CharacterInitial()) {
    on<FetchCharacters>((event, emit) async {
      if (_cachedCharacters.isNotEmpty && event.page == 1) {
        emit(CharacterLoaded(_cachedCharacters));
        return;
      }
      if (!_isSearching) {
        emit(CharacterLoading());

        final result = await getCharacters.call(page: event.page);
        result.fold(
          (failure) => emit(CharacterError()),
          (characters) {
            if (characters.isEmpty) {
              emit(CharacterEmpty());
            } else {
              _cachedCharacters.addAll(characters);
              emit(CharacterLoaded(_cachedCharacters));
            }
          },
        );
      }
    });

    on<SearchCharacter>((event, emit) async {
      _isSearching = true;
      emit(CharacterLoading());

      final result = await searchCharacters.call(event.query);
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

    on<CancelSearch>((event, emit) async {
      _isSearching = false;
      _cachedCharacters.clear();
      emit(CharacterLoading());
      print('herew');
      final result = await getCharacters.call(page: 1);
      result.fold(
        (failure) => emit(CharacterError()),
        (characters) {
          if (characters.isEmpty) {
            emit(CharacterEmpty());
          } else {
            _cachedCharacters.addAll(characters);
            emit(CharacterLoaded(_cachedCharacters));
          }
        },
      );
    });
  }
}
