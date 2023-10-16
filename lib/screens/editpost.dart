import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../config/palette.dart';
import '../data/data.dart';
import '../models/post_model.dart';
import '../providers/contents.dart';
import '../widgets/postag.dart';
import '../widgets/profile_avatar.dart';
import 'home_screen.dart';
import '../widgets/colorbox.dart';
class EditPost extends StatefulWidget {
  static const routeName = "edit";
  const EditPost({Key? key}) : super(key: key);

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  TextEditingController postcontroller = TextEditingController();
  Color textColor = Colors.white;
  FontWeight textWeight = FontWeight.bold;
  Color boxColor = Palette.Purple;
  bool isInit = true;
   var editedPost;

  @override
  Widget build(BuildContext context) {
    List arg = ModalRoute.of(context)!.settings.arguments as List;
   Post post = arg[0];
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                  onPressed: (){Navigator.of(context).pop();
                  }, icon: Icon(Icons.arrow_back,color: Palette.CreateBlack,)),
              backgroundColor: Colors.white,
              title: Text(
                'Create Post',
                style: TextStyle(
                    color: Palette.CreateBlack,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2),
              ),
              centerTitle: false,
              floating: true,
              actions: [
                TextButton(
                    onPressed: (){
                      Provider.of<Contents>(context,listen: false).editPost(editedPost, arg[1], arg[2]).whenComplete(() => Navigator.of(context).pushNamed(HomeScreen.routeName)
                      );
                    }, child: Text("Save",style: TextStyle(color: Colors.black54),))
              ], systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),

              sliver: SliverToBoxAdapter(
                child: Container(
                  height: 100,
                  color: Colors.white,
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5.0,
                        ),
                        ProfileAvatar(imageUrl: currentUser.imageUrl),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15,),
                            Text(
                              currentUser.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                            SizedBox(height:7),
                            Row(
                              children: [
                                PostTag(icon: Icons.public,title: 'Public',),
                                SizedBox(width: 10,),
                                PostTag(icon: Icons.add, title: "Album"),
                                SizedBox(width: 10,),
                                PostTag(icon: Icons.add_a_photo_outlined, title: "Off"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.35,
                    width: MediaQuery.of(context).size.width,
                    color: boxColor,
                    child: TextFormField(
                      style: TextStyle(color: textColor,fontSize: 20,fontWeight: textWeight),
                      maxLines: 5,
                      initialValue: post.caption,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding: EdgeInsets.symmetric(vertical:15,horizontal: 20,),
                      ),
                      onChanged: (text) {
                        setState(() {
                          // Update the color based on the text length
                          boxColor = text.length > 50 ? Colors.white : boxColor;
                          textColor = boxColor==Colors.white?Colors.black : Colors.white;
                          textWeight = text.length > 50 ? FontWeight.normal : textWeight;

                          editedPost = Post(user: post.user, caption: text.toString(), timeAgo: post.timeAgo, imageUrl: post.imageUrl, likes: post.likes, comments: post.comments, shares: post.shares,boxColor: post.boxColor);

                        });
                      },
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      height: MediaQuery.of(context).size.height*.27,
                      width: MediaQuery.of(context).size.width,
                      child: post.imageUrl != ""? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CachedNetworkImage(imageUrl: post.imageUrl),
                      ):
                      SizedBox(height: MediaQuery.of(context).size.height*.27,),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: post.imageUrl=="",
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: Center(child: Icon(Icons.arrow_back_ios_new,size: 30,weight: 50,),),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white
                              ),
                            ),
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    boxColor = Colors.white;
                                  });
                                },
                                child: ColorBox(color: Colors.white,)),
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    boxColor = Palette.Red;
                                  });
                                },
                                child: ColorBox(color: Palette.Red,)),
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    boxColor = Palette.Purple;
                                  });
                                },
                                child: ColorBox(color: Palette.Purple,)),
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    boxColor = Palette.Blue;
                                  });
                                },
                                child: ColorBox(color: Palette.Blue,)),
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    boxColor = Palette.facebookSharpBlue;
                                  });
                                },
                                child: ColorBox(color: Palette.facebookSharpBlue,)),
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    boxColor = Palette.online;
                                  });
                                },
                                child: ColorBox(color: Palette.online,)),
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    boxColor = Palette.facebookBlue;
                                  });
                                },
                                child: ColorBox(color: Palette.facebookBlue,)),

                          ],
                        ),
                      ),
                      SizedBox(height: 25,),
                      Divider(height: 1,),

                    ],
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
