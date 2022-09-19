class OrderModel{

  int? id;
  String? name;
  DateTime? createdAt;

  OrderModel({this.id,this.name,this.createdAt});

  factory OrderModel.fromJson(Map<String,dynamic> json)=> OrderModel(
    id: json['id'],
    name: json['name'],
    createdAt: json['createdAt'],
  );

}