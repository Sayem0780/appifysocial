import 'package:appifysocial/config/palette.dart';
import 'package:appifysocial/data/data.dart';
import 'package:appifysocial/models/comment_model.dart';
import 'package:appifysocial/providers/auth.dart';
import 'package:appifysocial/providers/contents.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../methods/formation.dart';
import '../models/post_model.dart';
import '../widgets/post_container.dart';
import '../widgets/profile_avatar.dart';
class CommentScreen extends StatefulWidget {
  static const routeName ="comments";
  const CommentScreen({Key? key,}) : super(key: key);


  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {

  TextEditingController commentText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Contents a = Provider.of<Contents>(context,listen: false);
    List arg = ModalRoute.of(context)!.settings.arguments as List;
   String rootkey = arg[0].toString();
   String keyNode = arg[1].toString();
   a.fetchAndPrintComments(rootkey, keyNode);
   List<Comments> commentList = a.extractedComments;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            Icon(
                              MdiIcons.thumbUpOutline,
                              color: Palette.facebookBlue,
                              size: 20.0,
                            ),
                            Icon(
                              Icons.favorite_sharp,
                              color: Palette.Red,
                              size: 20.0,
                            ),
                            Text("Md Sayem Muhaimin and 10 others",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            SizedBox(width: 5,),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 20.0,
                            ),

                          ],
                        ),
                        Icon(
                          MdiIcons.thumbUpOutline,
                          color: Colors.black38,
                          size: 30.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text("Most relevant",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                      Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black,),
                    ],),
                  ),
                ],
              ),
            ],
        ),
          ),
          SliverFillRemaining(
            hasScrollBody: false, // Set to false if you don't want the scrolling effect
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    for (var comment in commentList)
                      comment_post(comments: comment),
                  ],
                ),
                Column(
                  children: [
                    Divider(color: Colors.black26,height: 1,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: TextFormField(
                          controller: commentText,
                          maxLines: 2,
                          decoration: InputDecoration(
                              hintText: "Write a comment...",
                              helperStyle: TextStyle(fontSize: 20),
                              contentPadding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                  onPressed: (){
                                    a.createtComment(commentText.text.toString(), rootkey,keyNode).whenComplete(() => Navigator.of(context).pop());
                                  }, icon: Icon(Icons.play_arrow,color: Palette.facebookBlue,size: 35,))
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]
      ),
    );
  }
}

class comment_post extends StatelessWidget {
  final Comments comments;
  const comment_post({
    super.key,
    required this.comments
  });

  @override
  Widget build(BuildContext context) {
    DateTime a = DateTime.parse(comments.timeAgo);
    String timeAgo = formatDuration(DateTime.now().difference(a));
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 5),
            child: ProfileAvatar(imageUrl: comments.user.imageUrl)),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    Container(

                      margin:EdgeInsets.fromLTRB(0, 8, 18, 2),
                      child: Text(
                        comments.user.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                        margin:EdgeInsets.fromLTRB(8, 2, 12, 8),
                        child: Text(comments.caption)
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6,),
              Row(
                children: [
                  Text(
                    '${timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "Like",
                    style: TextStyle( color: Colors.grey[600],
                      fontSize: 12.0,),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "Reply",
                    style: TextStyle( color: Colors.grey[600],
                      fontSize: 12.0,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
