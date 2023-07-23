class ThreadModel {
  final int id;
  final String? icon;
  final DateTime createdAt;
  final String content;

  ThreadModel({
    required this.id,
    this.icon,
    required this.createdAt,
    required this.content,
  });
}
