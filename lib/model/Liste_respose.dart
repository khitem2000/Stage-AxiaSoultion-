
import 'dart:convert';

import 'package:testaxia/model/Listsocietes.dart';

class Liste_respose {
    List<Listsocietes>? listsocietes;
    String ?message;
    bool ?status;

    Liste_respose({required this.listsocietes, required this.message, this.status});

    factory Liste_respose.fromJson(Map<String, dynamic> json) {
        return Liste_respose(
            listsocietes: json['Listsocietes'] != null ? (json['Listsocietes'] as List).map((i) => Listsocietes.fromJson(i)).toList() : null,
            message: json['message'], 
            status: json['status'], 
        );
    }
    List<Liste_respose> analyseCars(String responseBody){
        final parsedJson = json.decode(responseBody).cast<Map<String, dynamic>>();
        return parsedJson.map<Liste_respose>((json) => Liste_respose.fromJson(json)).toList();
    }

}