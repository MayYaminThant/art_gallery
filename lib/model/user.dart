class User {
  final String userId;
  final String userName;
  final String? userStatus;
  final String? createdDate;
  final String? modifiedDate;

  User({
    required this.userId,
    required this.userName,
    this.userStatus,
    this.createdDate,
    this.modifiedDate,
  });
}
