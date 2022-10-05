import 'package:testaxia/model/Liste_respose.dart';
class Listsocietes {

    String ?c_ID;
    String? c_INTITULE;
    String? dB_CHANTIER;
    String ?dB_driver;
    String ?dB_host;
    String ?dB_password;
    String ?dB_user;
    String? iD_APP;
    Listsocietes({this.c_ID, this.c_INTITULE, this.dB_CHANTIER, this.dB_driver, this.dB_host, this.dB_password, this.dB_user, this.iD_APP});
    factory Listsocietes.fromJson(Map<String, dynamic> json) {
        return Listsocietes(
            c_ID: json["C_ID"],
            c_INTITULE: json["C_INTITULE"],
            dB_CHANTIER: json["DB_CHANTIER"],
            dB_driver: json["DB_driver"],
            dB_host: json["DB_host"],
            dB_password: json["DB_password"],
            dB_user: json["DB_user"],
            iD_APP: json["ID_APP"] ,
        );
    }
    Map<String, dynamic> toJson() {
        final map = <String, dynamic>{};
        map['c_ID'] = c_ID;
        map['c_INTITULE'] = c_INTITULE;
        map['dB_CHANTIER'] = dB_CHANTIER;
        map['dB_driver'] = dB_driver;
        map['dB_host'] = dB_host;
        map['dB_password'] = dB_password;
        map['dB_user'] = dB_user;
        map['iD_APP'] = iD_APP;
        return map;
    }
    static List<Listsocietes> fromJsonList(List list) {
        return list.map((item) => Listsocietes.fromJson(item)).toList();

    }

    // Listsocietes.fromJson(dynamic json) {
    //     c_ID = json['c_ID'];
    //     c_INTITULE = json['c_INTITULE'];
    //     dB_CHANTIER = json['dB_CHANTIER'];
    //     dB_driver = json['dB_driver'];
    //     dB_host = json['dB_host'] ;
    //     dB_password = json['dB_password'];
    //     dB_user = json['dB_user'];
    //     iD_APP = json['iD_APP'] ;
    // }


}







