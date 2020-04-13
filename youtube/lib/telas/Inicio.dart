import 'package:flutter/material.dart';
import 'package:youtube/API.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Inicio extends StatefulWidget {
  String pesquisa;
  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String pesquisa) {
    API api = API();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _listarVideos(this.widget.pesquisa),
      builder: (context, snapshot) {
        var retorno;

        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            retorno = Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              retorno = ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        FlutterYoutube.playYoutubeVideoById(
                            apiKey: CHAVE_YOUTUBE_API,
                            videoId: snapshot.data["items"][index]["id"]
                                ["videoId"],
                            autoPlay: true);
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(snapshot.data["items"]
                                            [index]["snippet"]["thumbnails"]
                                        ["high"]["url"]))),
                          ),
                          ListTile(
                            title: Text(snapshot.data["items"][index]["snippet"]
                                ["title"]),
                            subtitle: Text(snapshot.data["items"][index]
                                ["snippet"]["channelTitle"]),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 30,
                        color: Colors.grey,
                      ),
                  itemCount: snapshot.data.length);
            } else {
              retorno = Center(
                child: Text("Nenhum dado a ser exibido"),
              );
            }
            break;
        }

        return retorno;
      },
    );
  }
}
