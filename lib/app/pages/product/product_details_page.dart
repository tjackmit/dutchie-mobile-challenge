


class Product {
  Product(this.id, this.name, this.options, this.type, this.strainType,
    this.image, this.prices, this.flavors, this.effects,
    this.description, this.thcContent, this.cbdContent);
  
  final String id;
  final String name;
  final List<String> options;
  final String type;
  final String strainType;
  final String image;
  final List<String> prices;
  final List<String> flavors;
  final Map<String, String> effects;
  final String description;
  final String thcContent;
  final String cbdContent;

  getId() => this.id;
  getName() => this.name;
  getOPtions() => this.options;
  getype() => this.type;
  getStrainType() => this.strainType;
  getImage() => this.image;
  getPrices() => this.prices;
  getFlavors() => this.flavors;
  getEffects() => this.effects;
  getDescription() => this.description;
  getTHCContent() => this.thcContent;
  getCBDContent() => this.cbdContent;

}
