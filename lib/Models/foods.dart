class Foods {
  int? id;
  String? title;
  String? type;
  num? price;
  String? description;
  String? shop;
  String? image;

  Foods({
    required this.id,
    required this.title,
    required this.type,
    required this.price,
    required this.description,
    required this.shop,
    required this.image,
});
  Foods.fromJson(Map<String,dynamic> json){
    id=json['id'];
    title=json['title'];
    type=json['type'];
    price=json['price'];
    description=json['description'];
    shop=json['shop'];
    image=json['image'];
  }
}