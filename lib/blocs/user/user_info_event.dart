part of 'user_info_bloc.dart';

@immutable
abstract class UserInfoEvent extends Equatable {
  const UserInfoEvent();

  @override
  List<Object?> get props => [];
}

class UpdateUserInfo extends UserInfoEvent {
  final String fullName;
  final String email;
  final String dateOfBirth;
  final String phone;
  final Gender gender;
  final String address;

  const UpdateUserInfo({
    required this.fullName,
    required this.email,
    required this.dateOfBirth,
    required this.phone,
    required this.gender,
    required this.address,
  });

  @override
  List<Object?> get props =>
      [fullName, email, dateOfBirth, phone, gender, address];
}
