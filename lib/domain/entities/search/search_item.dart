class SearchItem {
  final String login;
  final String? imageUrl;
  final String? followersUrl;
  final String reposUrl;
  int? followersCount;

  SearchItem({
    required this.login,
    this.imageUrl,
    this.followersUrl,
    this.followersCount,
    required this.reposUrl,
  });

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
      imageUrl: json['avatar_url'],
      login: json['login'] ?? "",
      followersUrl: json['followers_url'],
      reposUrl: json['repos_url'],
    );
  }
}
