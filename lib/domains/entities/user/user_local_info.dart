enum Gender {
  male,
  female;

  String toJson() => name;

  static Gender fromJson(String json) => values.byName(json);
}

class UserLocalInfo {
  final String? uid;
  final String? fullName;
  final String? email;
  final String? password;
  final String? phone;
  final String? dateOfBirth;
  final Gender gender;
  final String? address;
  final String? imagePath;

  UserLocalInfo({
    this.uid,
    this.fullName,
    this.email,
    this.password,
    this.phone,
    this.dateOfBirth,
    this.gender = Gender.male,
    this.address,
    this.imagePath,
  });

  factory UserLocalInfo.fromJson(Map<String, Object?> json) => UserLocalInfo(
        uid: json['uid'] as String?,
        fullName: json['fullName'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        phone: json['phone'] as String?,
        dateOfBirth: json['dateOfBirth'] as String?,
        gender: Gender.fromJson(json['gender'].toString()),
        address: json['address'] as String?,
        imagePath: json['imagePath'] as String?,
      );

  Map<String, Object?> toJson() => {
        "uid": uid,
        "fullName": fullName,
        "email": email,
        "password": password,
        "phone": phone,
        "dateOfBirth": dateOfBirth,
        "gender": gender.toJson(),
        "address": address,
        "imagePath": imagePath,
      };

  UserLocalInfo copyWith({
    String? uid,
    String? fullName,
    String? email,
    String? password,
    String? phone,
    String? dateOfBirth,
    Gender? gender,
    String? address,
    String? imagePath,
  }) =>
      UserLocalInfo(
        uid: uid ?? this.uid,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        imagePath: imagePath ?? this.imagePath,
      );

  @override
  String toString() => '''
   UserLocalInfo{
        "uid": $uid,
        "fullName": $fullName,
        "email": $email,
        "password": $password,
        "phone": $phone,
        "dateOfBirth": $dateOfBirth,
        "gender": ${gender.name},
        "address": $address,
        "imagePath": $imagePath
      };
  ''';
}
