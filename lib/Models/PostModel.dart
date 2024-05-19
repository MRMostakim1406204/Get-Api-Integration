class PostModel {
 final int id;
 final String name;
 final String username;
 final String email;

  PostModel(
      {
        required this.id,
        required this.name,
        required this.username,
        required this.email,
      });
  factory PostModel.fromJson (Map<String,dynamic> json){
  return PostModel(
    id: json["id"], 
    name: json["name"], 
    username: json["username"], 
    email: json["email"]
    );
  }    
}