import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'recipe.dart';

class RecipeScreen extends StatelessWidget {

  const RecipeScreen({Key? key, this.recipe}) : super(key: key);
  final Recipe? recipe;
@override
Widget build(BuildContext context) {
  Widget titleSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text("${recipe?.projet}",
                        style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  Text("${recipe?.type}",
                      style: TextStyle(color: Colors.grey[500], fontSize: 16))
                ],
              )),

        ],
      ));

  Widget buttonSection = Container(
    padding: const EdgeInsets.all(8),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _buildButtonColumn(Colors.blue, Icons.comment, "COMMENT"),
      _buildButtonColumn(Colors.blue, Icons.share, "SHARE")
    ]),
  );

  Widget descriptionSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      "${recipe?.colo}",
      softWrap: true,
    ),
  );
  Widget builddate = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      "${recipe?.val}",
      softWrap: true,
    ),
  );

return Container (

    child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Mes Liste"),
        ),
        body: ListView(
            children: [
              Hero(
                tag: "imageRecipe" + "${recipe?.projet}",
                child: CachedNetworkImage(
                  imageUrl: "${recipe?.imageUrl}",
                  placeholder: (context, url) => const Center(child:CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
              titleSection,
              buttonSection,
              descriptionSection,
              builddate,

            ])),
  );
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Icon(icon, color: color)),
      Text(label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: color,
          ))
    ],
  );
}


}