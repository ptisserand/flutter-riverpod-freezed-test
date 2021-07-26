import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_freezed_test/src/features/jokes/data/models/joke_model.dart';

part 'jokes_state.freezed.dart';

// Extension method for easy comparaison
extension JokesGetters on JokesState {
  bool get isLoading => this is _JokesStateLoading;
}

@freezed
abstract class JokesState with _$JokesState {
  // Initial
  const factory JokesState.initial() = _JokesStateInitial;

  // Loading
  const factory JokesState.loading() = _JokesStateLoading;

  // Data
  const factory JokesState.data({required JokeModel joke}) = _JokesStateData;

  // Error
  const factory JokesState.error([String? error]) = _JokesStateError;
}
