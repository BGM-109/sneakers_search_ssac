class Keywords {
  final String imageUrl;
  final String name;
  final Category category;

  Keywords(this.imageUrl, this.name, this.category);
}

enum Category {
  none,
  sneakers,
  clothes,
  acc,
  life,
  tech,
}


