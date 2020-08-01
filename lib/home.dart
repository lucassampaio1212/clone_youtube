import 'package:flutter/material.dart';
import 'package:youtube/custom_search_delegate.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/em_alta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricao.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

    String _resultado = "";
    int _indiceAtual = 0;
  @override
  Widget build(BuildContext context) {
    
    List <Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset("imagens/yuotube.png",
       
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam,color: Colors.grey), 
            onPressed: (){}),
            IconButton(
            icon: Icon(Icons.search,color: Colors.grey,), 
            onPressed: ()async{
             String res = await showSearch(context: context, delegate: CustomSearchDelegate());
             setState(() {
               _resultado = res;
             });
             
            }),
            IconButton(
            icon: Icon(Icons.account_circle,color: Colors.grey), 
            onPressed: (){})
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            title: Text("Início"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            title: Text("Inscrição"),
            icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder)
          ),
        ],
      ),
    );
  }
}