import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domains/entities/user/user_local_info.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(UserInfoInitial()) {
    on<UpdateUserInfo>((event, emit) {
      // TODO: implement event handler
    });
  }
}
