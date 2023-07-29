class ThreadModel {
  final int id;
  final DateTime createdAt;
  final String? emoji;
  final String? title;
  final String content;

  ThreadModel({
    required this.id,
    required this.createdAt,
    this.emoji,
    this.title,
    required this.content,
  });
}
