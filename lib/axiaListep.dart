import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:rxdart/rxdart.dart';
import 'package:testaxia/recipe.dart';
import 'RecipeScreen.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart' ;
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'model/Project.dart';
import 'model/listedeProjet.dart';

class MyaxiaListep extends StatefulWidget {

  final String? tokenText;
  final String? userText;

  const MyaxiaListep({super.key, this.tokenText, this.userText});

  @override
  State<StatefulWidget> createState() {
    return MyaxiaListepState();
  }
}

class MyaxiaListepState extends State<MyaxiaListep> {
  // Map? data;
  // List ?userData;
  //
  // Future getData() async {
  //   http.Response response = await http.post(Uri.parse("http://172.0.1.23:85/api/getListProjectByUser?PROT_User=ADMINISTRATEUR"));
  //   setState(() {
  //     userData = data!["data"];
  //   });
  // }

  @override
  void initState() {
    super.initState();
    getListSociete();
  }


  final BehaviorSubject<listedeProjet> _subject = BehaviorSubject<listedeProjet>();

  BehaviorSubject<listedeProjet> get subject => _subject;

  Project? selectedItem;
  List<Project> listSocietes = [];
  Future getListSociete() async {
    try {
      var response = await Dio().get('http://172.0.1.23:85/api/getListProjectByUser',
      queryParameters: {"PROT_User" : widget.userText},
      options: Options(headers: {"Authorization" : "Bearer ${widget.tokenText}" }));
      listSocietes.addAll(listedeProjet.fromJson(response.data).listProject??[]);
      debugPrint("${response.data}");
      subject.sink.add(listedeProjet.fromJson(response.data));
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
  // Future<List<listedeProjet>>ReadJsonData() async{
  //   final jsondata = await rootBundle.rootBundle.loadString('http://172.0.1.23:85/api/getListProjectByUser?PROT_User=ADMINISTRATEUR');
  //   final list = json.decode(jsondata) as List<dynamic>;
  //
  //   return list.map((e) => listedeProjet.fromJson(e)).toList();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mes Listes"),
        ),
        body: StreamBuilder(
            stream: subject,
            builder: (context,  AsyncSnapshot<listedeProjet> snapshot) {
              if(snapshot.hasData){
                if(snapshot.data!.status){
                  return ListView.builder(
                      itemCount: snapshot.data?.listProject?.length,
                      itemBuilder: (context,index){
                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  //child: Image(image: NetworkImage(items[index].imageURL.toString()),fit: BoxFit.fill,),
                                ),
                                Expanded(child: Container(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Padding(padding: const EdgeInsets.only(left: 8,right: 8),
                                        child: Text("${snapshot.data?.listProject?.elementAt(index).D_Intitule}", style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                      ),),),
                                      Padding(padding: const EdgeInsets.only(left: 8,right: 8),
                                        child: Text("${snapshot.data?.listProject?.elementAt(index).D_DateDebut}"),)
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        );
                      }
                  );
                } else {
                  return const Center(child: Text("No Data ...."));
                }
              } else {
                return const Center(child: CircularProgressIndicator(),);
              }
            }
        ),


        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, 'test');
          },
          child: const Icon(Icons.add),
        )
    );
  }

}
//}

class RecipeItemWidget extends StatelessWidget {

  const RecipeItemWidget({Key? key, this.recipe}) : super(key: key);
  final Project? recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
          context,
          '/Project',
          arguments: recipe,
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Hero(
              tag: "imageRecipe${recipe?.D_Intitule}",
              child: CachedNetworkImage(
                imageUrl: "",
                //  imageUrl: "${recipe?.imageUrl}",
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 100,
                height: 100,
                fit: BoxFit.cover,


              ),

            ),

            Padding(
              padding: const EdgeInsets.all(10),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.65,
                    padding: const EdgeInsets.only(bottom: 8),

                    child: Text("${recipe?.D_Intitule}", maxLines: 2, overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),


                  Text("${recipe?.EMP_Code}",
                      style: TextStyle(color: Colors.grey[500], fontSize: 16)),

                ],
              ),
            )


          ],
        ),
      ),
    );
  }


}