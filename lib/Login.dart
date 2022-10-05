import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dio/dio.dart';
import 'package:testaxia/model/Liste_respose.dart';
import 'package:testaxia/model/login_respose.dart';
import 'package:testaxia/model/Listsocietes.dart';
import 'package:http/http.dart' as http;

import 'axiaListep.dart';
class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

 var emailController = TextEditingController();
 var passlController = TextEditingController();


 String? tokenText;
 String? userText;

 Listsocietes? selectedItem;

 List<Listsocietes> listSocietes = [];

 void getListSociete() async {
    try {
      var response = await Dio().get("http://172.0.1.23:85/api/getListSociete");
      listSocietes.addAll(Liste_respose.fromJson(response.data).listsocietes??[]);
      selectedItem = (Liste_respose.fromJson(response.data).listsocietes??[]).first;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
  // List<Listsocietes> postList = [] ;
  //
  // Future<List<Listsocietes>> getPostApi ()async{
  //   final resposne = await http.get(Uri.parse('http://172.0.1.23:85/api/getListSociete')) ;
  //   var data = jsonDecode(resposne.body.toString());
  //   if(resposne.statusCode == 200){
  //     postList.clear();
  //     for(Map i in data){
  //       postList.add(Listsocietes.fromJson(i));
  //     }
  //     return postList ;
  //   }else {
  //     return postList ;
  //   }





 Future<void> login() async{
   if (passlController.text.isNotEmpty&& emailController.text.isNotEmpty){
     var response = await Dio().post("http://172.0.1.23:85/api/login",
         data:{'email':emailController.text,
           'password':passlController.text,
           "societe" : selectedItem?.c_ID,
           "token_device": "eydgx",
         }
     );
     if (response.statusCode==200) {

       setState(() {
         tokenText = LoginRespose.fromJson(response.data).user?.token;
         userText = LoginRespose.fromJson(response.data).user?.pROT_User;
       });

       Navigator.push(context, MaterialPageRoute(builder: (context)=>
           MyaxiaListep(userText: userText, tokenText: tokenText,)));

     // Navigator.push(
     //   context, MaterialPageRoute(builder: (context)=>MyaxiaListep()));

     }  else{
       ScaffoldMessenger.of(context)
           .showSnackBar(SnackBar(content: const Text("Welcome user.")));

     }
   } else{

     ScaffoldMessenger.of(context)
         .showSnackBar(SnackBar(content: Text("Invalid Credntials.")));


   }
 }


 @override
  void initState() {
    getListSociete();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/ee.png'), fit: BoxFit.cover),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 150),
              height: 130,
              width: 167,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/aa.png')),

              ),
              child: const Text(
                'se connecter',
                style: TextStyle(color: Colors.orange, fontSize: 33),
              ),
            ),
              const SizedBox(height: 10,),
            Center(child:Container(

              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),


                  height: 510,
              width: 335,
               decoration: const BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                 boxShadow: [
                   BoxShadow(color: Colors.orange, spreadRadius: 3),
                 ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const SizedBox(height: 25,),
                       const Text("Se Connecter",
                    style: TextStyle(
                    fontSize: 29,
                    fontWeight:FontWeight.bold
                    ),),

                    const SizedBox(height: 10,),
                    const Text("Please Login to Your Account",
                    style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    ),),
                     SingleChildScrollView(
                     child: Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                        Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextField(

                              style: const TextStyle(color: Colors.black),
                              controller: emailController,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  prefixIcon: const Icon(Icons.email),
                                  filled: true,
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),

                            ),


                            const SizedBox(
                              height: 30,
                            ),
                            TextField(
                              style: const TextStyle(),
                              obscureText: true,
                              controller: passlController,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  prefixIcon: const Icon(Icons.password),

                                  filled: true,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 40,
                            ),





                            DropdownSearch<Listsocietes>(
                              selectedItem: selectedItem,
                              items: listSocietes,
                              itemAsString: (Listsocietes u) => "${u.c_INTITULE}",
                              onChanged: (Listsocietes? data) {
                                print(data?.c_INTITULE);
                              },
                            ),
                            const Divider(
                              height: 15,
                              thickness: 2,
                              indent: 20,
                              endIndent: 20,
                              color: Color(0xFFDBE2E7),
                            ),

                            Row(


                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:<Widget> [
                                FlatButton(
                                  onPressed: () {
                                    login();
                                     Navigator.pushNamed(context, 'axiaListep');
                                  },
                                  child:const Text ('Sing in  ',style: TextStyle (fontSize :20),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, 'register');
                                      },
                                      style: const ButtonStyle(),
                                      child: const Text(
                                        'Paranétrage',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            color: Color(0xff4c505b),
                                            fontSize: 18),
                                      ),
                                    ),

                                  ],

                                ),

                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: const Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.forward_outlined,
                                        size: 15,
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,

                            ),

                          ],
                        ),
                      )
                    ],
                  ),
              ),
            ),
          ],
        ),
                ),
      ),),
        ],
      ),
    )
    );
  }
}