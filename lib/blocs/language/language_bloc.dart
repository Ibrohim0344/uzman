import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<ChangeLanguage>((event, emit) {
      try {
        emit(LanguageSuccess(locale: event.locale));
      } catch (e) {
        log("change language failure ===> $e");
        emit(LanguageFailure());
      }
    });
  }
}
