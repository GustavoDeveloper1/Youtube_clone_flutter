import 'package:flutter/material.dart';
import 'package:test/Api.dart';
import 'package:test/model/video.dart';
import 'package:test/screens/YoutubePlayerScreen.dart';

class Inicio extends StatefulWidget {
  String pesquisa;

  Inicio(this.pesquisa);
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listVideo(String pesquisa) {
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listVideo(widget.pesquisa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  List<Video>? videos = snapshot.data;
                  Video video = videos![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YouTubePlayerScreen(
                            videoId: video.id, // Substitua pelo ID do vídeo
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage('${video.imagem}'))),
                        ),
                        ListTile(
                          title: Text('${video.titulo}'),
                          subtitle: Text('${video.canal}'),
                        ),
                        Container(
                          height: 30,
                        )
                      ],
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) => Divider(
                  height: 2,
                  color: Colors.grey,
                ),
              );
            } else {
              return const Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
            break;
        }
      },
    );
  }
}
