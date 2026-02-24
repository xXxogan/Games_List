enum CollectionType { favorite, completed, planned, dropped }

class CollectionItem {
  const CollectionItem({
    required this.id,
    required this.name,
    required this.type,
    required this.addedAt,
    this.image,
  });

  final int id;
  final String name;
  final String? image;
  final CollectionType type;
  final DateTime addedAt;

  CollectionItem copyWith({
    int? id,
    String? name,
    String? image,
    CollectionType? type,
    DateTime? addedAt,
  }) {
    return CollectionItem(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      type: type ?? this.type,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}
