/**
 * Product.dart
 * Friend computer 2.0
 * copyright 2015 Pioneer Valley Gamer Collective
 */
/**
 * Product
 * This class is used to create Product objects and methods for Product objects.
 */
class Product {
  int _id;
  int parent_id;
  Sting name;
  DateTime introductionDate;
  DateTime discontinuationDate;
  DateTime eolDate;
  String comment;

  List<int> getCategories() {
    //TODO: Implement getCategories in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> getPrimaryCategories() {
    //TODO: Implement getPrimaryCategories in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> getFeatures() {
    //TODO: Implement getFeatures in Product
    List<int> people = new List<int>();
    return people;
  }
  ProductType getProductType() {
    //TODO: Implement getProductType in Product
    ProductType people = new ProductType();
    return people;
  }
  Good getGood() {
    //TODO: Implement getGood in Product
    Good people = new Good();
    return people;
  }
  Service getService() {
    //TODO: Implement getService in Product
    Service people = new Service();
    return people;
  }
  List<int> getSupplierLinks() {
    //TODO: Implement getSupplierLinks in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> getComponents() {
    //TODO: Implement getComponents in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> isComponentOf() {
    //TODO: Implement isComponentOf in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> getSubstitutes() {
    //TODO: Implement getSubstitutes in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> substitutesFor() {
    //TODO: Implement substitutesFor in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> replacedBy() {
    //TODO: Implement replacedBy in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> supercedes() {
    //TODO: Implement supercedes in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> complimentedBy() {
    //TODO: Implement complimentedBy in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> incompatibleWith() {
    //TODO: Implement incompatibleWith in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> getPriceComponents() {
    //TODO: Implement getPriceComponents in Product
    List<int> people = new List<int>();
    return people;
  }
  void addCategory() {
    //TODO: Implement addCategory in Product
  }
  void endCategory() {
    //TODO: Implement endCategory in Product
  }
  void makeCategoryPrimary() {
    //TODO: Implement makeCategoryPrimary in Product
  }
  void addFeature() {
    //TODO: Implement addFeature in Product
  }
  void endFeature() {
    //TODO: Implement endFeature in Product
  }
  void addSupplier() {
    //TODO: Implement addSupplier in Product
  }
  void endSupplier() {
    //TODO: Implement endSupplier in Product
  }
  void addComponent() {
    //TODO: Implement addComponent in Product
  }
  void endComponent() {
    //TODO: Implement endComponent in Product
  }
  void addSubstitute() {
    //TODO: Implement addSubstitute in Product
  }
  void endSubstitute() {
    //TODO: Implement endSubstitute in Product
  }
  void addReplacement() {
    //TODO: Implement addReplacement in Product
  }
  void addCompliment() {
    //TODO: Implement addCompliment in Product
  }
  void endCompliment() {
    //TODO: Implement endCompliment in Product
  }
  void addIncompatibility() {
    //TODO: Implement addIncompatibility in Product
  }
  void endIncompatibility() {
    //TODO: Implement endIncompatibility in Product
  }
  void addPriceComponent() {
    //TODO: Implement addPriceComponent in Product
  }
  void endPriceComponent() {
    //TODO: Implement endPriceComponent in Product
  }
}
/**
 * Service
 * This class is used to create Service objects and methods for Service objects.
 */
class Service extends Product {
  int _id;
  int parent_id;
}
/**
 * Good
 * This class is used to create Good objects and methods for Good objects.
 */
class Good extends Product {
  int _id;
  int parent_id;

  List<int> getInventoryItems() {
    //TODO: Implement getInventoryItems in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> getRecorderingGuidelines() {
    //TODO: Implement getRecorderingGuidelines in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> getIdentifications() {
    //TODO: Implement getIdentifications in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> getItemsShipments() {
    //TODO: Implement getItemsShipments in Product
    List<int> people = new List<int>();
    return people;
  }
  List<int> getReceivedShipments() {
    //TODO: Implement getReceivedShipments in Product
    List<int> people = new List<int>();
    return people;
  }
  void addInventoryItem() {
    //TODO: Implement addInventoryItem in Product
  }
  void addReorderGuideline() {
    //TODO: Implement addReorderGuideline in Product
  }
  void endReorderGuideline() {
    //TODO: Implement endReorderGuideline in Product
  }
  void addIdentification() {
    //TODO: Implement addIdentification in Product
  }
  void addShipment() {
    //TODO: Implement addShipment in Product
  }
  void addShipmentReceipt() {
    //TODO: Implement addShipmentReceipt in Product
  }
}

