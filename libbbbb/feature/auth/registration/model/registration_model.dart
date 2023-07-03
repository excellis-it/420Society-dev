

class RegisterationModel {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? confirmPassword;

  RegisterationModel(
      {this.name, this.email, this.phone, this.password, this.confirmPassword});

  RegisterationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    return data;
  }
}