/// PriceComponent.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective

/// PriceComponent
/// This class is used to create different kinds of PriceComponent objects and methods for accessing PriceComponent objects.
class PriceComponent{
  int _id;
  int _parentid;
  PriceComponentType componenttype;
  num price;
  num percent;
  date datestart;
  date datethrough;
  String comment;

  List<int> getAssocProducts() {
    //TODO: Implement getAssocProducts in PriceComponent
    List<int> people = new List<int>();
    return people;
  }
  Void addAssocProducts() {
    //TODO: Implement addAssocProducts in PriceComponent
  }
  Void removeAssociatedProducts() {
    //TODO: Implement removeAssociatedProducts in PriceComponent
  }
  List<int> getAssocFeatures() {
    //TODO: Implement getAssocFeatures in PriceComponent
    List<int> people = new List<int>();
    return people;
  }
  Void addAssocFeatures() {
    //TODO: Implement addAssocFeatures in PriceComponent
  }
  Void removeAssocFeatures() {
    //TODO: Implement removeAssocFeatures in PriceComponent
  }
  List<int> getAssocDependencies() {
    //TODO: Implement getAssocDependencies in PriceComponent
    List<int> people = new List<int>();
    return people;
  }
  Void addAssocDependencies() {
    //TODO: Implement addAssocDependencies in PriceComponent
  }
  Void removeAssocDependencies() {
    //TODO: Implement removeAssocDependencies in PriceComponent
  }
}