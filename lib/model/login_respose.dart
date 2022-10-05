import 'package:testaxia/model/user.dart';

class LoginRespose {

    String? message;
    bool status;
    User? user;

    LoginRespose({this.message, this.status = false, this.user});

    factory LoginRespose.fromJson(Map<String, dynamic> json) {
        return LoginRespose(
            message: json['message'], 
            status: json['status'], 
            user: json['user'] != null ? User.fromJson(json['user']) : null, 
        );
    }
    Map<String, dynamic> toJson() {
        final map = <String, dynamic>{};
        map['message'] = message;
        map['status'] = status;
        map['user'] = user;


        return map;
    }
}