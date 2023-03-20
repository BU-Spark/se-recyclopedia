class ResourceArticle {
  final String title;

  ResourceArticle(this.title) {
    if (title.isEmpty) {
      throw ArgumentError("Words of WordPair cannot be empty. "
          "Received: '$title'");
    }
  }

  @override
  String toString() {
    return 'ResourceArticle(title: $title)';
  }
}
