import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:youtube/model/video.dart';



const Chave_API_YUOTUBE = "AIzaSyAPY31Mf8UeqCCvX2Q1NdSJDlYODXgU610";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";
const ID_CANAL = "UCt_4wzTQqmcUvemNkeO0plA";



class Api {
 Future<List<Video>>pesquisar(String pesquisa)async{
    http.Response response = await http.get(
      URL_BASE + "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$Chave_API_YUOTUBE"
           "&channelId=$ID_CANAL"
            "&q=$pesquisa"
    );

    if(response.statusCode == 200){
      

      Map<String, dynamic> dadosJson = json.decode(response.body);

        /*for(var videos in dadosJson["items"]){
          print("resultado:" + videos["snippet"]["channelId"].toString());
        }*/

      List<Video> videos = dadosJson["items"].map<Video>(
        (map){
          return Video.fromJson(map);
          
        }
      ).toList();
     // print("resultado:" + videos.toString());
      return videos;
      
    }else{
      
    }
 
 }

}