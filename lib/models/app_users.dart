import 'package:json_annotation/json_annotation.dart';

part 'app_users.g.dart';

@JsonSerializable()
class AppUsers {
  final String uid;
  final String email;
  final String? name;

  @JsonKey(name: 'profile_pic_url')
  final String? profilePicUrl;

  @JsonKey(name: 'user_type')
  final List<String> userType;

  @JsonKey(name: 'age_of_learners')
  final List<String> ageOfLearners;

  AppUsers({
    required this.uid,
    required this.email,
    this.name,
    this.profilePicUrl,
    this.userType = const [],
    this.ageOfLearners = const [],
  });

  factory AppUsers.fromJson(Map<String, dynamic> json) =>
      _$AppUsersFromJson(json);

  Map<String, dynamic> toJson() => _$AppUsersToJson(this);

  AppUsers copyWith({
    String? uid,
    String? email,
    String? name,
    String? profilePicUrl,
    List<String>? userType,
    List<String>? ageOfLearners,
  }) {
    return AppUsers(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      userType: userType ?? this.userType,
      ageOfLearners: ageOfLearners ?? this.ageOfLearners,
    );
  }
}
