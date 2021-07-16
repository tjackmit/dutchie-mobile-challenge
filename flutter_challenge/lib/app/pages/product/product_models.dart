
class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.brandName,
    required this.strainType,
    required this.image,
    required this.price,
    required this.thcContent,
    required this.cbdContent,
  });

  final String id;
  final String name;
  final String brandName;
  final String strainType;
  final String image;
  final String price;
  final int thcContent;
  final int cbdContent;

  String getId() => id;
  String getName() => name;
  String getBrandName() => brandName;
  String getStrainType() => strainType;
  String getImage() => image;
  String getPrice() => price;
  int getTHCContent() => thcContent;
  int getCBDContent() => cbdContent;
  
}

class DetailedProductModel {
  DetailedProductModel({
    required this.id,
    required this.name,
    required this.brandName,
    required this.options,
    required this.type,
    required this.strainType,
    required this.image,
    required this.prices,
    required this.flavors,
    required this.effects,
    required this.description,
    required this.thcContent,
    required this.cbdContent
  });
  
  final String id;
  final String name;
  final String brandName;
  final List<String> options;
  final String type;
  final String strainType;
  final String image;
  final List<num> prices;
  final List<String> flavors;
  final Map<String, num> effects;
  final String description;
  final String thcContent;
  final String cbdContent;

  String getId() => id;
  String getName() => name;
  String getBrandName() => brandName;
  List<String> getOPtions() => options;
  String getype() => type;
  String getStrainType() => strainType;
  String getImage() => image;
  List<num> getPrices() => prices;
  List<String> getFlavors() => flavors;
  Map<String, num> getEffects() => effects;
  String getDescription() => description;
  String getTHCContent() => thcContent;
  String getCBDContent() => cbdContent;

}
