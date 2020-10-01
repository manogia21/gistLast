import 'package:dio/dio.dart';
import 'package:gist_newAndLast/model/gist.dart';

String keys = "2962becefecad7ab8ec17ebe448cd6fb33e3ae1c";
String url = "https://api.github.com/users/manogia21";

Future<List<GistData>> getHttp() async {
  List<GistData> permanent = List();
  BaseOptions options = BaseOptions(baseUrl: url, headers: {
    "Authorization": "token $keys",
  });
  Dio _dio = new Dio(options);
  int i = 1;

  // print(response.data.runtimeType);
  while (i > 0) {
    Response response = await _dio.get(
      "/gists?page=$i",
    );
    List<dynamic> data = response.data;
    if (data.length > 0) {
      for (int j = 0; j < data.length; j++) {
        permanent.add(GistData.fromJson(data[j]));
      }
      i++;
    } else {
      break;
    }
  }
  print(permanent.length);
  return permanent;
}

Future getLinks(String baseUrl) async {
  // BaseOptions options = BaseOptions(baseUrl: baseUrl);
  Dio _dio = new Dio();
  Response response = await _dio.get(baseUrl);
  return response.data;
}
