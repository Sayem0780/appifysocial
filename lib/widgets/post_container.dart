import 'dart:ui';

import 'package:appifysocial/providers/contents.dart';
import 'package:appifysocial/screens/comment_screen.dart';
import 'package:appifysocial/screens/editpost.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:appifysocial/config/palette.dart';
import 'package:appifysocial/models/models.dart';
import 'package:appifysocial/widgets/profile_avatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../methods/formation.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  final String rootkey;
  final String keyNode;

  PostContainer({
    required this.post,
    required this.rootkey,
    required this.keyNode,
  }) : super();

  @override
  Widget build(BuildContext context) {
    int code = int.parse(post.boxColor.substring(6, 16));
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostHeader(post: post,rootKey: rootkey,keyNode: keyNode,),
                const SizedBox(
                  height: 4.0,
                ),
                Visibility(
                    visible: post.imageUrl == "",
                    child: Container(
                        height: 250,
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        color: Color(code),
                        child: Center(
                            child: Text(
                          post.caption,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )))),
                Visibility(
                  visible: post.imageUrl != "",
                  child: Container(
                      color: Color(code),
                      child: Text(
                        post.caption,
                      )),
                ),
                post.imageUrl != ""
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 6.0,
                      ),
              ],
            ),
          ),
          post.imageUrl != ""
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: PostStats(
              post: post,
              rootkey: rootkey,
              keyNode: keyNode,
            ),
          )
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final Post post;
  final String rootKey;
  final String keyNode;
  const PostHeader({
    required this.post,
    required this.rootKey,
    required this.keyNode,
  }) : super();

  @override
  Widget build(BuildContext context) {
    DateTime a = DateTime.parse(post.timeAgo);
    String timeAgo = formatDuration(DateTime.now().difference(a));
    Contents provider = Provider.of<Contents>(context);
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () {
            showDialog(context: context, builder: (BuildContext){
              return AlertDialog(
                alignment: Alignment.centerRight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  content: Container(
                    height: 120,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                            Navigator.of(context).pushNamed(EditPost.routeName,arguments: [post,rootKey,keyNode]);
                          },
                          child: ListTile(
                            leading: Icon(Icons.edit),
                            title: Text("Edit"),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            provider.deletePost(post, rootKey, keyNode);
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            leading: Icon(Icons.delete),
                            title: Text("Delete"),
                          ),
                        )
                      ],
                    ),
                  )
              );
            });
          },
        ),

      ],
    );
  }
}

class PostStats extends StatefulWidget {
  final Post post;
  final String rootkey;
  final String keyNode;
  PostStats({
    required this.post,
    required this.rootkey,
    required this.keyNode,
  }) : super();

  @override
  State<PostStats> createState() => _PostStatsState();
}

class _PostStatsState extends State<PostStats> {
  bool changed = false;
  bool longPress = false;
  @override
  Widget build(BuildContext context) {
    int like = widget.post.likes + 1;
    int unlike = widget.post.likes - 1;
    Contents a = Provider.of<Contents>(context);
    return Column(
      children: [
        Row(
          children: [
            Visibility(
              visible: widget.post.likes != 0,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Palette.facebookBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.thumb_up,
                  size: 10.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Visibility(
              visible: widget.post.likes != 0,
              child: Expanded(
                child: Text(
                  '${widget.post.likes}',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: widget.post.comments != 0,
              child: Text(
                '${widget.post.comments} Comments',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Visibility(
              visible: widget.post.shares != 0,
              child: Text(
                '${widget.post.shares} Shares',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1,
        ),
        const Divider(
          height: 1,
        ),
        SizedBox(
          height: 1,
        ),
        Visibility(
          visible: longPress,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.grey[250],
            height: 50,
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .89,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  longPress = !longPress;
                                  changed
                                      ? a.increaseLike(widget.post, like,
                                          widget.rootkey, widget.keyNode)
                                      : a.increaseLike(widget.post, unlike,
                                          widget.rootkey, widget.keyNode);
                                  changed =!changed;
                                }
                                );
                              },
                              child: Icon(
                                Icons.thumb_up,
                                color: Colors.blueAccent,
                              )),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  longPress = !longPress;
                                  changed
                                      ? a.increaseLike(widget.post, like,
                                          widget.rootkey, widget.keyNode)
                                      : a.increaseLike(widget.post, unlike,
                                          widget.rootkey, widget.keyNode);
                                  changed =!changed;
                                });
                              },
                              child: Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                              )),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  longPress = !longPress;
                                  changed
                                      ? a.increaseLike(widget.post, like,
                                          widget.rootkey, widget.keyNode)
                                      : a.increaseLike(widget.post, unlike,
                                          widget.rootkey, widget.keyNode);
                                  changed =!changed;
                                });
                              },
                              child: Icon(
                                Icons.face_retouching_natural_sharp,
                                color: Colors.amberAccent,
                              )),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  longPress = !longPress;
                                  changed
                                      ? a.increaseLike(widget.post, like,
                                          widget.rootkey, widget.keyNode)
                                      : a.increaseLike(widget.post, unlike,
                                          widget.rootkey, widget.keyNode);
                                  changed =!changed;
                                });
                              },
                              child: Icon(
                                Icons.tag_faces_outlined,
                                color: Colors.limeAccent,
                              ))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onLongPress: () {
                setState(() {
                  longPress = true;
                });
              },
              child: PostButton(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: changed ? Palette.facebookBlue : Colors.grey[600],
                  size: 20.0,
                ),
                label: 'Like',
                onTap: () {
                  setState(() {
                    changed = !changed;
                  });
                  changed
                      ? a.increaseLike(
                          widget.post, like, widget.rootkey, widget.keyNode)
                      : a.increaseLike(
                          widget.post, unlike, widget.rootkey, widget.keyNode);
                },
              ),
            ),
            PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              onTap: () => Navigator.of(context)
                  .pushNamed(CommentScreen.routeName, arguments: [
                widget.rootkey,
                widget.keyNode,
              ]),
            ),
            PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'Share',
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}

class PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final void Function() onTap;

  const PostButton({
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          height: 25.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 4.0,
              ),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
