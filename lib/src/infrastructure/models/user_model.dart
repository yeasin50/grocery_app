class UserModel {
  const UserModel({
    required this.name,
    required this.avatar,
    required this.token,
  });

  final String name;
  final String avatar;

  //use auth repo for this
  final String token;

  static const UserModel ui = UserModel(
    name: "Yeasin",
    avatar: "https://avatars.githubusercontent.com/u/46500228?v=4",
    token: "token",
  );
}
