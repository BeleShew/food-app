class RegistrationModel {
 late String name;
 late String email;
 late String website;
 late String phoneNumber;
  RegistrationModel(this.name,this.email,this.website, this.phoneNumber);
  RegistrationModel.fromJson(Map<String, dynamic> json){
      name = json['Restaurant_Name'];
      email = json['Email'];
      website = json['website'];
      phoneNumber = json['PhoneNumber'];
  }

   Map<String, dynamic> toJson() => {'Restaurant_Name':name, 'Email':email, 'website':website, 'PhoneNumber':phoneNumber};
}