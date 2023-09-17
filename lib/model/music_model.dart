class MusicCard{
  String? bgImage;
  String? title;
  String? author;
  String? url;
  MusicCard({required this.bgImage,required this.title,required this.author, required this.url});

  MusicCard.fromJson(Map<String, dynamic> json) {
    bgImage = json['bgImage'];
    title = json['title'];
    author = json['author'];
    url = json['url'];
  }
}