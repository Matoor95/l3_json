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
  void initState() {
    super.initState();
    futurePosts = loadPosts();
  }

  // Methode pour charger le json dans les assets
  Future<List<Post>> loadPosts() async {
    // charger le fichier json
    final String response =
        await rootBundle.loadString('assets/data/post.json');
    // on decode le contenu en liste dynamique
    final List<dynamic> data = jsonDecode(response);
    // on convertit la liste dynamique en liste de post
    return data.map((json) => Post.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: FutureBuilder<List<Post>>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                final post=posts[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.content),
                  ),

                );
              },
            );

          }
        },
      ),
    );
  }
}
