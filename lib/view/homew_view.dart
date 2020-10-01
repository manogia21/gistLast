import 'package:flutter/material.dart';
import 'package:gist_newAndLast/model/gist.dart';
import 'package:gist_newAndLast/service/api_gist.dart';

class HomeView extends StatelessWidget {
  final List<GistData> gistLIst;
  const HomeView({Key key, this.gistLIst}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
            itemCount: gistLIst.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: gistLIst[index].files.filesData
                    .map((e) => FutureBuilder(
                        future: getLinks(e.rawUrl),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(snapshot.data + "\n");
                          }
                          return CircularProgressIndicator();
                        }))
                    .toList(),
              );
            }));
  }
}
