class AuthData {
  bool? status;
  User? user;
  Department? department;
  String? accessToken;
  bool logged = false;

  AuthData({this.status, this.user, this.accessToken, this.department});

  AuthData.reset(){
    status = null;
    user = null;
    department = null;
    accessToken = null;
    logged = false;
  }

  
  AuthData.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    department = json['deptartament'] != null ?  Department.fromJson(json['deptartament']) : null;
 
 
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
if (this.department != null) {
      data['deptartment'] = this.department!.toJson();
    }

    data['accessToken'] = this.accessToken;
    return data;
  }

   void setLogged(bool b){
    logged = b;
  }

  bool isLogged(){
    return logged;
  }
}

class User {

  bool? isActive;
  String? sId;
  String? name;
  String? noControl;
  String? major;
  int? semester;
  bool? online;
  String? image;

 

  User(
      {this.isActive,
      this.sId,
      this.name,
      this.noControl,
      this.major,
      this.semester,
      this.online,
      this.image});

  User.fromJson(Map<String, dynamic> json) {

    isActive = json['isActive'];
    sId = json['_id'];
    name = json['name'];
    noControl = json['No_control'];
    major = json['major'];
    semester = json['semester'];
    online = json['online'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isActive'] = this.isActive;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['No_control'] = this.noControl;
    data['major'] = this.major;
    data['online'] = this.online;
    data['semester'] = this.semester;
    data['image'] = this.image;
    return data;
  }
}


class Department {

  String? sId;
  String? name;
  String? ubication;

 

  Department(
      {this.sId,
      this.name,
      this.ubication});

  Department.fromJson(Map<String, dynamic> json) {

    sId = json['_id'];
    name = json['name'];
    ubication = json['ubication'];
   }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['ubication'] = this.ubication;
    return data;
  }
}
