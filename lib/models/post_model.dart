
import 'package:appifysocial/models/comment_model.dart';
import 'package:appifysocial/models/models.dart';

class Post {
  final User user;
  final String caption;
  final String timeAgo;
  final String imageUrl;
  final int likes;
  final int comments;
  final int shares;
  final String boxColor ;

  const Post({
    required this.user,
    required this.caption,
    required this.timeAgo,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
   this.boxColor ="",
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'caption': caption,
      'timeAgo': timeAgo,
      'imageUrl': imageUrl,
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'boxColor': boxColor,
    };
  }
  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      user: User.fromMap(map['user']),
      caption: map['caption'],
      timeAgo: map['timeAgo'],
      imageUrl: map['imageUrl'],
      likes: map['likes'],
      comments: map['comments'],
      shares: map['shares'],
      boxColor: map['boxColor'],
    );
  }
}
