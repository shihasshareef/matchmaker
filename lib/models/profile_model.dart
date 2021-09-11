class ProfileModel {
  ProfileModel({
    this.id,
    this.name,
    this.age,
    this.place,
    this.image,
  });

  String id = '';
  String name = '';
  int age = 0;
  String place = '';
  String image = '';

  factory ProfileModel.fromJson(Map<dynamic, dynamic> json) => ProfileModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        place: json["place"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "place": place,
        "image": image,
      };
}
