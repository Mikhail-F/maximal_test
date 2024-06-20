class RepositoryItem {
  final String name;
  final String description;
  final String updatedAt;
  final String defaultBranch;
  final int forks;
  final int stargazersCount;
  final String language;

  RepositoryItem({
    required this.name,
    required this.description,
    required this.updatedAt,
    required this.defaultBranch,
    required this.forks,
    required this.stargazersCount,
    required this.language,
  });

  factory RepositoryItem.fromJson(Map<String, dynamic> json) {
    return RepositoryItem(
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      defaultBranch: json['default_branch'] ?? "",
      forks: json['forks'] ?? 0,
      stargazersCount: json['stargazers_count'] ?? 0,
      language: json['language'] ?? "",
    );
  }
}
