class Photo {
  final String userName;
  final String categoryId;
  final String? createdDate;
  final String? modifiedDate;
  final String photoId;
  final String photoName;
  final String photoUrl;
  final double? price;
  final String categoryName;
  final String photoDescription;
  final double rating;

  Photo({
    required this.userName,
    required this.categoryId,
    this.createdDate,
    this.modifiedDate,
    required this.photoId,
    required this.photoName,
    required this.photoUrl,
    this.price,
    required this.categoryName,
    required this.photoDescription,
    required this.rating,
  });

  isEqual(Photo object) {
    if (object.userName == userName &&
        object.photoId == photoId &&
        object.photoUrl == photoUrl &&
        object.photoName == photoName &&
        object.categoryId == categoryId &&
        object.price == price &&
        object.createdDate == createdDate &&
        object.modifiedDate == modifiedDate &&
        object.photoDescription == photoDescription &&
        object.rating == rating) {
      return true;
    } else {
      return false;
    }
  }
}
