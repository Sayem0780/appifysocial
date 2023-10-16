import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appifysocial/data/data.dart';

import '../models/comment_model.dart';
import '../models/post_model.dart';
import '../models/user_model.dart';

class Contents extends ChangeNotifier{

  List<Post> postdata =[];
  List<String> postkey =[];
  List<String> rootkey =[];
  List<Comments> extractedComments=[];
  late Post editedPostData;
  void editData(Post post){
    editedPostData = post;
  }

  Future<void> uploadImage(File imageFile,String caption,{String imageUrl="",Color boxColor = Colors.white}) async {
    String filename = DateTime.now().microsecond.toString();
    String uploadUrl ="https://firebasestorage.googleapis.com/v0/b/shop-624d0.appspot.com/o/$filename.jpg?alt=media";
    try {
      final response = await http.post(
        Uri.parse(uploadUrl),
        body: imageFile.readAsBytesSync(),
        headers: {
          'Content-Type': 'image/jpeg', // Adjust based on your file type
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        String bucket = responseData['bucket'];
        String name = responseData['name'];
        String downloadTokens = responseData['downloadTokens'];

        String downloadUrl = 'https://firebasestorage.googleapis.com/v0/b/${bucket}/o/${Uri.encodeComponent(name)}?alt=media&token=${downloadTokens}';

        createPost(caption,imageUrl: downloadUrl,boxColor: boxColor);

      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error during upload: $e');
    }
  }

  Future<void> createPost(String caption,{String imageUrl="",Color boxColor = Colors.white}) async {
    try {

      // Replace 'your-custom-key' with the key you want to use
      String customKey = DateTime.now().millisecondsSinceEpoch.toString().substring(6,12);
      var response = await http.post(
        Uri.parse('https://shop-624d0-default-rtdb.firebaseio.com/faceook/$customKey.json'),
        body: jsonEncode(
            {
              "user": User(name: currentUser.name, imageUrl: currentUser.imageUrl).toMap(),
              "caption":caption,
              "timeAgo":DateTime.now().toString(),
              "imageUrl":imageUrl.toString(),
              "likes": 0,
              "shares":0,
              "boxColor": boxColor.toString()
            }),

      );
      if (response.statusCode == 200) {
        print("Data posted successfully");
      } else {
        print("Failed to post data. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> createtComment(String caption,String RootKey,String keyNode,{String imageUrl="",Color boxColor = Colors.white}) async {
    try {
      String akey = RootKey;
      String customKey = DateTime.now().millisecondsSinceEpoch.toString().substring(6,12);
      var response = await http.post(
        Uri.parse('https://shop-624d0-default-rtdb.firebaseio.com/faceook/$akey/$keyNode/comments/$customKey.json'),
        body: jsonEncode(
            {
              "user": User(name: currentUser.name, imageUrl: currentUser.imageUrl).toMap(),
              "caption":caption,
              "timeAgo":DateTime.now().toString(),
              "imageUrl":imageUrl.toString(),
              "likes": 0,
              "reply": 0,
            }),
      );
      if (response.statusCode == 200) {
        print("Data posted successfully");
      } else {
        print("Failed to post data. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> fetchAndPrintPosts() async {
    try {
      var response = await http.get(
        Uri.parse('https://shop-624d0-default-rtdb.firebaseio.com/faceook.json'),
      );

      if (response.statusCode == 200) {
        // Parse the response body
        Map<String, dynamic> data = jsonDecode(response.body);

        // Convert the map of posts to a list
        List<Map<String, dynamic>> posts = [];
        postdata.clear();
        postkey.clear();
        data.forEach((key, value) {
          rootkey.clear();
          posts.add(Map<String, dynamic>.from(value));
          rootkey.addAll(data.keys);
        });


        for (var post in posts) {

          User user = User(name: post.values.first["user"]["name"], imageUrl: post.values.first["user"]["imageUrl"]);
          int length =0;
          post.values.first["comments"]==null?length =0:length = post.values.first["comments"].values.length;
          Post extractedPost = Post(
              user: user,
              caption: post.values.first["caption"],
              timeAgo: post.values.first["timeAgo"],
              imageUrl: post.values.first["imageUrl"],
              likes: post.values.first["likes"],
              comments: length,
              shares: post.values.first["shares"],
              boxColor: post.values.first["boxColor"]
          );
          postdata.add(extractedPost);
          postkey.add(post.keys.first);
          notifyListeners();
        }

        return posts;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load posts');
    }
  }

  Future<List<Map<String, dynamic>>> fetchAndPrintComments(String RootKey,String keyNode) async {

    try {
      var response = await http.get(
        Uri.parse('https://shop-624d0-default-rtdb.firebaseio.com/faceook/$RootKey/$keyNode/comments.json'),
      );

      if (response.statusCode == 200) {
        // Parse the response body
        Map<String, dynamic> data = jsonDecode(response.body);

        // Convert the map of posts to a list
        List<Map<String, dynamic>> coms = [];
        data.forEach((key, value) {
          coms.add(Map<String, dynamic>.from(value));
        });
        extractedComments.clear();
        for (var com in coms) {

          User user = User(name: com.values.first["user"]["name"], imageUrl: com.values.first["user"]["imageUrl"]);
          Comments comments = Comments(
            user: user,
            caption: com.values.first["caption"],
            timeAgo: com.values.first["timeAgo"],
            imageUrl: com.values.first["imageUrl"],
            likes: com.values.first["likes"],
            reply: com.values.first["reply"],
          );
          extractedComments.add(comments);
          notifyListeners();
        }
        return coms;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load posts');
    }
  }

  Future<void> increaseLike(Post post, int like,String RootKey,String keyNode,{String imageUrl="",Color boxColor = Colors.white}) async {
    try {
      var response = await http.put(
        Uri.parse('https://shop-624d0-default-rtdb.firebaseio.com/faceook/$RootKey/$keyNode/.json'),
        body: jsonEncode(
            {
              "user": User(name: currentUser.name, imageUrl: currentUser.imageUrl).toMap(),
              "caption":post.caption,
              "timeAgo":post.timeAgo,
              "imageUrl":post.imageUrl,
              "likes": like,
              "shares": post.shares,
              "boxColor": post.boxColor
            }),
      );
      if (response.statusCode == 200) {
        print("Data posted successfully");
      } else {
        print("Failed to post data. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> editPost(Post post, String RootKey,String keyNode,) async {
    print(keyNode);
    try {
      var response = await http.put(
        Uri.parse('https://shop-624d0-default-rtdb.firebaseio.com/faceook/$RootKey/$keyNode.json'),
        body: jsonEncode(
            {
              "user": User(name: currentUser.name, imageUrl: currentUser.imageUrl).toMap(),
              "caption":post.caption,
              "timeAgo":post.timeAgo,
              "imageUrl":post.imageUrl,
              "likes": post.likes,
              "shares": post.shares,
              "boxColor": post.boxColor
            }),
      );
      if (response.statusCode == 200) {
        print("Data posted successfully");
      } else {
        print("Failed to post data. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> deletePost(Post post, String RootKey,String keyNode,) async {
    print(rootkey);
    print(RootKey);
    print(keyNode);
    try {
      final Url = Uri.parse('https://shop-624d0-default-rtdb.firebaseio.com/faceook/$RootKey/$keyNode.json');
      final response = await http.delete(Url);
      if (response.statusCode == 200) {
        print("Post Deleted successfully");
      } else {
        print("Failed to post data. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

}