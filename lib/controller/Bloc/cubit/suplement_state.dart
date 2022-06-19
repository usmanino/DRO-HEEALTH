part of 'suplement_cubit.dart';

@immutable
abstract class SuplementState {}

class SuplementInitial extends SuplementState {}

class SuplementLoading extends SuplementState {
  SuplementLoading();
}

class SuplementError extends SuplementState {
  SuplementError(this.errorMessage);
  final String errorMessage;
}

class SuplementSuccess extends SuplementState {
  SuplementSuccess({required this.suplementList});
  final List<SupplementModle> suplementList;
}
