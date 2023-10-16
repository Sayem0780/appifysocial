import 'package:appifysocial/providers/contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:appifysocial/config/palette.dart';
import 'package:appifysocial/data/data.dart';
import 'package:appifysocial/models/models.dart';
import 'package:appifysocial/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class HomeScreen extends StatelessWidget {
  static const routeName ="Home";
  @override
  Widget build(BuildContext context) {
    Provider.of<Contents>(context,).fetchAndPrintPosts();
    List<Post> fetchposts = Provider.of<Contents>(context).postdata;
    List<String> fetchkey = Provider.of<Contents>(context).postkey;
    List<String> fetchrootkey = Provider.of<Contents>(context).rootkey;
   Auth provider= Provider.of<Auth>(context);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: Text(
            'facebook',
            style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed:(){}),
            CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30.0,
                onPressed: (){}),
            IconButton(onPressed: (){
              provider.logOut();
            }, icon: Icon(Icons.logout,color: Colors.black26,))
          ], systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        //OBS: Como estamos em um array de Sliver, então é necesário ter o "SliverToBoxAdapter"
        SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser)),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),
        SliverList(
          // SliverChildBuilderDelegate é equivalente ao LISTVIEW.BUILDER
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if(fetchposts.length!=0){
                return PostContainer(post: fetchposts[index],keyNode: fetchkey[index],rootkey: fetchrootkey[index],);
              }else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              };
            },
            childCount: fetchposts.length,
          ),
        )
      ],
    ));
  }
}
