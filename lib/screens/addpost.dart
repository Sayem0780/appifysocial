import 'dart:io';

import 'package:appifysocial/models/post_model.dart';
import 'package:appifysocial/providers/contents.dart';
import 'package:appifysocial/screens/home_screen.dart';
import 'package:appifysocial/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../config/palette.dart';
import '../data/data.dart';
import '../methods/toast.dart';
import '../widgets/colorbox.dart';
import '../widgets/postag.dart';

class AddPost extends StatefulWidget {
  static const routeName = "addPost";
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  File? _image;
  final picker = ImagePicker();

  Color boxColor = Palette.Purple;
  void dialog(context){
    showDialog(context: context, builder: (BuildContext){
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Container(
          height: 120,
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  getCamera();
                  boxColor = Colors.white;
                  Navigator.pop(context);
                },
                child: ListTile(
                  leading: Icon(Icons.camera),
                  title: Text("Camera"),
                ),
              ),
              GestureDetector(
                onTap: (){
                  getGallery();
                  boxColor = Colors.white;
                  Navigator.pop(context);
                },
                child: ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text("Gallery"),
                ),
              )
            ],
          ),
        ),
      );
    },);
  }
  Future getCamera()async{
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if(pickedImage!=null){
        _image=File(pickedImage.path);
      }else{
        toastMassage("No image selected");
      }
    });
  }
  Future getGallery()async{
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(pickedImage!=null){
        _image=File(pickedImage.path);
      }else{
        toastMassage("No image selected");
      }
    });
  }
  TextEditingController postcontroller = TextEditingController();
  Color textColor = Colors.white;
  FontWeight textWeight = FontWeight.bold;
  @override
  Widget build(BuildContext context) {

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

                       _image==null?Provider.of<Contents>(context,listen: false).createPost(postcontroller.text.toString(),boxColor: boxColor).whenComplete(() => Navigator.of(context).pushNamed(HomeScreen.routeName)):
                       Provider.of<Contents>(context,listen: false).uploadImage(_image!,postcontroller.text.toString(),boxColor: boxColor).whenComplete(() => Navigator.of(context).pushNamed(HomeScreen.routeName)
                  );
                }, child: Text("Next",style: TextStyle(color: Colors.black54),))
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
                    child: TextField(
                      style: TextStyle(color: textColor,fontSize: 20,fontWeight: textWeight),
                      controller: postcontroller,
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: 'What\'s on your mind?',
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
                        });
                      },
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      height: MediaQuery.of(context).size.height*.27,
                      width: MediaQuery.of(context).size.width,
                      child: _image != null?ClipRRect(
                        child: Image.file(
                          _image!.absolute,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fitWidth,
                        ),
                      ):
                      SizedBox(height: MediaQuery.of(context).size.height*.27,),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: _image==null,
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
                      Visibility(
                          visible: _image!=null,
                          child: SizedBox(height: 25,)),
                      Divider(height: 1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(onPressed: (){
                            dialog(context);
                          }, icon: Icon(Icons.photo_library,color: Colors.green,size: 40,weight: 80,)),
                          Icon(Icons.account_box_rounded,color: Palette.facebookBlue,size: 40,weight: 80,),
                          Icon(Icons.tag_faces_outlined,color: Colors.yellow,size: 40,weight: 80,),
                          Icon(Icons.edit_location_rounded,color: Colors.red,size: 40,weight: 80,),
                          Icon(Icons.more,color: Colors.black,size: 40,weight: 80,),
                        ],
                      )
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





