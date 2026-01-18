class Post {
  // propriete de lka clkasse
  final int id;
  final String title;
  final String content;
// constructeur
  Post({required this.id, required this.title, required this.content});
// la function factory  est une methode qui deserilaisiser ou bien de cionvertir des donnees json en objet dart 
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String
    );
  }
}
