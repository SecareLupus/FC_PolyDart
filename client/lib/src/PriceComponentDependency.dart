/// PriceComponentDependency.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective

/// PriceComponentDependency
/// This class is used to create different kinds of PriceComponentDependency objects and methods for accessing
/// PriceComponentDependency objects.
class PriceComponentDependency {
  int _id;
  int _parentid;

  PriceComponentDependencyType getDepType(){
    //TODO: Implement getDepType in PriceComponentDependency
    PriceComponentDependencyType people = new PriceComponentDependencyType();
    return people;
  }
  PriceCategoryDependency getCategoryDep(){
    //TODO: Implement getCategoryDep in PriceComponentDependency
    PriceCategoryDependency people = new PriceCategoryDependency();
    return people;
  }
  PricePartyDependency getPartyDep(){
    //TODO: Implement getPartyDep in PriceComponentDependency
    PricePartyDependency people = new PricePartyDependency();
    return people;
  }
  PriceOrderValueDependency getOrderValueDep(){
    //TODO: Implement getOrderValueDep in PriceComponentDependency
    PriceOrderValueDependency people = new PriceOrderValueDependency();
    return people;
  }
  PriceQuantityDependency getQuantityDep(){
    //TODO: Implement getQuantityDep in PriceComponentDependency
    PriceQuantityDependency people = new PriceQuantityDependency();
    return people;
  }
  PriceSaleTypeDependency getSaleTypeDep(){
    //TODO: Implement getSaleTypeDep in PriceComponentDependency
    PriceSaleTypeDependency people = new PriceSaleTypeDependency();
    return people;
  }
/// PriceSaleTypeDependency
/// This class is used to create different kinds of PriceSaleTypeDependency objects and methods for accessing
/// PriceSaleTypeDependency objects.
}
class PriceSaleTypeDependency extends PriceComponentDependency {
  int _id;
  int parentid;

  String getSaleType() {
    //TODO: Implement getSaleType in PriceComponentDependency
    String people = new String();
    return people;
  }

  void setSaleType() {
    //TODO: Implement setSaleType in PriceComponentDependency
  }
}
/// PriceOrderValueDependency
/// This class is used to create different kinds of PriceOrderValueDependency objects and methods for accessing
/// PriceOrderValueDependency objects.
class PriceOrderValueDependency extends PriceComponentDependency {
  int _id;
  int parentid;

  num getMinValue() {
    //TODO: Implement getMinValue in PriceComponentDependency
    num people = new num();
    return people;
  }
  void setMinValue() {
    //TODO: Implement setMinValue in PriceComponentDependency
  }
  num getMaxValue() {
    //TODO: Implement getMaxValue in PriceComponentDependency
    num people = new num();
    return people;
  }
  num setMaxValue() {
    //TODO: Implement setMaxValue in PriceComponentDependency
  }
  boolean isLegalValue() {
    //TODO: Implement isLegalValue in PriceComponentDependency
    return true;
  }
}
/// PriceQuantityDependency
/// This class is used to create different kinds of PriceQuantityDependency objects and methods for accessing
/// PriceQuantityDependency objects.
class PriceQuantityDependency extends PriceComponentDependency {
  int _id;
  int parentid;

  num getMinQty() {
    //TODO: Implement getMinQty in PriceComponentDependency
    num people = new num();
    return people;
  }
  void setMinQty() {
    //TODO: Implement setMinQty in PriceComponentDependency
  }
  num getMaxQty() {
    //TODO: Implement getMaxQty in PriceComponentDependency
    num people = new num();
    return people;
  }
  num setMaxQty() {
    //TODO: Implement setMaxQty in PriceComponentDependency
  }
  boolean isLegalQty() {
    //TODO: Implement isLegalQty in PriceComponentDependency
    return true;
  }
}

