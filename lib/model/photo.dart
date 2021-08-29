class Photo {
  final String? artistId;
  final String categoryId;
  final String? createdDate;
  final String? modifiedDate;
  final String photoId;
  final String photoName;
  final String photoUrl;
  final double? price;
  final String categoryName;

  Photo({
    this.artistId,
    required this.categoryId,
    this.createdDate,
    this.modifiedDate,
    required this.photoId,
    required this.photoName,
    required this.photoUrl,
    this.price,
    required this.categoryName,
  });

  isEqual(Photo object) {
    if (object.artistId == artistId &&
        object.photoId == photoId &&
        object.photoUrl == photoUrl &&
        object.photoName == photoName &&
        object.categoryId == categoryId &&
        object.price == price &&
        object.createdDate == createdDate &&
        object.modifiedDate == modifiedDate) {
      return true;
    } else {
      return false;
    }
  }
}
