class Video {
  String id;
  String? titulo;
  String? descricao;
  String? imagem;
  String? canal;

  Video(
      {required this.id, this.titulo, this.descricao, this.imagem, this.canal});

  // static convertJson(Map<String, dynamic> json) {
  //   return Video(
  //     id: json["id"]["videoId"],
  //     titulo: json["snippet"]["title"],
  //     imagem: json["snippet"]["thumbnails"]["hight"]["url"],
  //     canal: json["snippet"]["channelId"],
  //   );
  // }

  factory Video.fromJson(Map<String, dynamic> json) {
    print("veido ${json["snippet"]}");

    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelTitle"],
      descricao: json["snippet"]["description"],
    );
  }
}
