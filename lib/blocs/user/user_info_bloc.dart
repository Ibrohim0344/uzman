import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/storage/local_storage.dart';
import '../../domains/entities/user/user_local_info.dart';

part 'user_info_event.dart';

part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(UserInfoInitial()) {
    on<UpdateUserInfo>((event, emit) {
      try {
        final updatedUser = LocalStorage.getUser().copyWith(
          fullName: event.fullName,
          email: event.email,
          dateOfBirth: event.dateOfBirth,
          phone: event.phone,
          gender: event.gender,
          address: event.address,
        );
        LocalStorage.saveUser(updatedUser);
        log("updatedUser ===>>> $updatedUser");
        emit(
          UserInfoUpdateSuccess(fullName: event.fullName, email: event.email),
        );
      } catch (e) {
        log("UserInfoUpdateFailure ===>>> $e");
        emit(UserInfoUpdateFailure());
      }
    });
  }
}
