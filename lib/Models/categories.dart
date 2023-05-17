class Categories {
  int? id;
  String? title;
  String? image;

  Categories({required this.id, required this.title, required this.image});
  Categories.fromJson(Map<String,dynamic> json){
    id=json['id'];
    title=json['title'];
    image=json['image'];
  }
}
