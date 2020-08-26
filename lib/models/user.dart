enum UserStatus { Active, InActive }

class User {
  String id;
  final String avatarUrl;
  final String email;
  final String username;
  final List<String> friends;

  User({this.id, this.avatarUrl, this.email, this.username, this.friends});

  static List<String> _friendsListFrom(List<dynamic> items) {
    return items.map((item) => item.toString()).toList();
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        avatarUrl: json['avatar_url'],
        email: json['email'],
        username: json['username'],
        friends: _friendsListFrom(json['friend_ids']));
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar_url': this.avatarUrl,
      'email': this.email,
      'username': this.username,
      'friend_ids': this.friends,
    };
  }
}
