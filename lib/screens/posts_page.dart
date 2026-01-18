import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:l3_json/models/post.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  // future qyi retournera la liste des posts

  late Future<List<Post>> futurePosts;
  @override
  void initSate() {
    super.initState();
    futurePosts = _loadPosts();
  }

  Future<List<Post>> _loadPosts() async {
    // omn recupere le contenu brut du fichier json
    final String response =
        await rootBundle.loadString('assets/data/post.json');

    // on va sdecoder le contenu en liste dynamique
    final List<dynamic> data = jsonDecode(response);
    // on va convertir chaque element  en objet Post
    return data.map((json) => Post.fromJson(json)).toList();
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
