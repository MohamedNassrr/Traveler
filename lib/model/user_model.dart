class UserRegisterModel{
  String? name;
  String? email;
  String? uId;

  UserRegisterModel({
    this.name,
    this.email,
    this.uId,
});
  UserRegisterModel.fromJson(Map<String, dynamic>json){
    name = json['name'];
    email = json['email'];
    uId = json['uId'];
  }
  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
  }
}