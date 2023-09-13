class UserModel {
   String name = "";
   String email = "";
   String phone = "";

   UserModel({
     required this.name,
     required this.email,
     required this.phone,
});
 // لو هستقبلك
   UserModel.fromJson(Map<String , dynamic> json)
   {
      name : json['name'];
      email : json['email'];
      phone : json['phone'];
   }
   // لو هوديك
   Map<String , dynamic>  toMap()
   {
     return
       {
         'name' : name,
         'email' : email,
         'phone' : phone,
       };
   }
}