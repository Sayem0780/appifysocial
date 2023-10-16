import 'package:appifysocial/models/models.dart';

class Comments {
  final User user;
  final String caption;
  final String timeAgo;
  final String imageUrl;
  final int likes;
  final int reply;

  const Comments({
    required this.user,
    required this.caption,
    required this.timeAgo,
    required this.imageUrl,
    required this.likes,
    required this.reply,

  });

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'caption': caption,
      'timeAgo': timeAgo,
      'imageUrl': imageUrl,
      'likes': likes,
      'comments': reply,
    };
  }
  factory Comments.fromMap(Map<String, dynamic> map) {
    return Comments(
      user: User.fromMap(map['user']),
      caption: map['caption'],
      timeAgo: map['timeAgo'],
      imageUrl: map['imageUrl'],
      likes: map['likes'],
      reply: map['reply'],
    );
  }
}
