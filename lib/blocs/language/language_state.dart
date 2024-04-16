part of 'language_bloc.dart';

@immutable
abstract class LanguageState {
  final String? locale;

  const LanguageState({this.locale});
}

class LanguageInitial extends LanguageState {}

class LanguageFailure extends LanguageState {}

class LanguageSuccess extends LanguageState {
  const LanguageSuccess({super.locale});
}
