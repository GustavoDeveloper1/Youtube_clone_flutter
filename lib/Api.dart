import 'package:http/http.dart' as http;
import 'package:test/model/video.dart';
import 'dart:convert';

const CHAVE_YOUTUBE_API = "AIzaSyBJ3WbG6UnDYdqQLe7AkJNDz9tyQW5rA_w";
const ID_CANAL = "UCPX0gLduKAfgr-HJENa7CFw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    List<Video> videos;
    final url = Uri.parse(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=${CHAVE_YOUTUBE_API}"
            "&channelId=${ID_CANAL}"
            "&q=$pesquisa");

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      // print("resposta: ${dadosJson["items"]}");

      videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();
      return videos;
    } else {
      print("error");
      return [];
    }
  }
}
