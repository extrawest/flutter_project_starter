class Item {
  String name;
  int id;

  Item({
    this.name,
    this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "id": id == null ? null : id,
      };

  @override
  String toString() {
    return 'Item{name: $name, id: $id}';
  }
}
