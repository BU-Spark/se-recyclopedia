class Resource {
  String title;
  String description;
  String link;
  String image;
  Resource(this.title, this.description, this.link, this.image);

  factory Resource.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'];
    return Resource(
      attributes['title'],
      attributes['description'],
      attributes['link'],
      attributes['image'],
    );
  }
}
