class Sneakers {
  Sneakers({
    required this.thumbnailUrl,
    required this.name,
    required this.price,
    required this.productNumber,
    required this.engName,
    required this.recentPrice,
    required this.variant,
    required this.buy,
    required this.sell,
    required this.modelNumber,
  });
  late final String thumbnailUrl;
  late final String name;
  late final String price;
  late final String productNumber;
  late final String engName;
  late final String recentPrice;
  late final String variant;
  late final String buy;
  late final String sell;
  late final String modelNumber;

  Sneakers.fromJson(Map<String, dynamic> json){
    thumbnailUrl = json['thumbnail_url'];
    name = json['name'];
    price = json['price'];
    productNumber = json['product_number'];
    engName = json['eng_name'];
    recentPrice = json['recent_price'];
    variant = json['variant'];
    buy = json['buy'];
    sell = json['sell'];
    modelNumber = json['model_number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['thumbnail_url'] = thumbnailUrl;
    _data['name'] = name;
    _data['price'] = price;
    _data['product_number'] = productNumber;
    _data['eng_name'] = engName;
    _data['recent_price'] = recentPrice;
    _data['variant'] = variant;
    _data['buy'] = buy;
    _data['sell'] = sell;
    _data['model_number'] = modelNumber;
    return _data;
  }
}