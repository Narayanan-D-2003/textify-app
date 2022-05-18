class Text {
  final String type;
  final String name;
  final String content;

  Text({
    required this.type,
    required this.name,
    required this.content,
  });

  factory Text.fromJson(Map<String, dynamic> json) {
    return Text(
      type: json['content_type'] as String,
      name: 'Not now',
      content: json['content_data'] as String,
    );
  }
}
