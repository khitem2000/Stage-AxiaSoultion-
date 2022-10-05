import 'Project.dart';

class listedeProjet {
    List<Project>? listProject;
    String ?message;
    bool status;

    listedeProjet({this.listProject, this.message, this.status = false});

    factory listedeProjet.fromJson(Map<String, dynamic> json) {
        return listedeProjet(
            listProject: json['listProject'] != null ? (json['listProject'] as List).map((i) => Project.fromJson(i)).toList() : null, 
            message: json['message'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        final listProject = this.listProject;
        if (listProject != null) {
            data['listProject'] = listProject.map((v) => v.toJson()).toList();
        }
        return data;
    }
}