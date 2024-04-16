part of 'user_info_bloc.dart';

@immutable
abstract class UserInfoState {
  final String? fullName;
  final String? email;

  const UserInfoState({this.fullName, this.email});
}

class UserInfoInitial extends UserInfoState {}

class UserInfoUpdateSuccess extends UserInfoState {
  const UserInfoUpdateSuccess({super.fullName, super.email});
}

class UserInfoUpdateLoading extends UserInfoState {}

class UserInfoUpdateFailure extends UserInfoState {}
