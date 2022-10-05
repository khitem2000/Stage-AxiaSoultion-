

class User {
    String? dbName;
    String? email;
    String? id;
    String? pROT_User;
    String? token;
    String? token_device;
    String? username;

    User({this.dbName, this.email, this.id, this.pROT_User, this.token, this.token_device, this.username});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            dbName: json['dbName'],
            email: json['email'], 
            id: json['id'], 
            pROT_User: json['pROT_User'], 
            token: json['token'], 
            token_device: json['token_device'], 
            username: json['username'], 
        );
    }
}