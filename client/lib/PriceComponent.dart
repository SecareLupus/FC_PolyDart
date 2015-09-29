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

  PriceComponent() {}

  /// getAssocProducts returns the Products associated with a PriceComponent.
  ///
  /// Generates a [List<int>] of associated [Product] ids from [Price_Component_Product_Association] where
  ///   PriceComponent_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getAssocProducts() {
    //TODO: Implement getAssocProducts in PriceComponent
    List<int> people = new List<int>();
    return people;
  }

  /// addAssocProducts adds an associated Product to an PriceComponent.
  ///
  /// Takes an [int] id for an associated [Product], and creates an [Price_Component_Product_Association]
  ///   record referencing [this] and the given [Product]. Returns no value.
  void addAssocProducts(int id) {
    //TODO: Implement addAssocProducts in PriceComponent
  }

  /// removeAssocProducts removes an associated Product from an PriceComponent.
  ///
  /// Takes an [int] id for an associated [Product], and removes all [Price_Component_Product_Association]
  ///   records referencing [this] and the given [Product]. Returns no value.
  void removeAssocProducts(int id) {
    //TODO: Implement removeAssocProducts in PriceComponent
  }

  /// getAssocFeatures returns the Features associated with a PriceComponent.
  ///
  /// Generates a [List<int>] of associated [Feature] ids from [Price_Component_Feature_Association] where
  ///   PriceComponent_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getAssocFeatures() {
    //TODO: Implement getAssocFeatures in PriceComponent
    List<int> people = new List<int>();
    return people;
  }

  /// addAssocFeatures adds an associated Feature to an PriceComponent.
  ///
  /// Takes an [int] id for an associated [Feature], and creates an [Price_Component_Feature_Association]
  ///   record referencing [this] and the given [Feature]. Returns no value.
  void addAssocFeatures(int id) {
    //TODO: Implement addAssocFeatures in PriceComponent
  }

  /// removeAssocFeatures removes an associated Feature from an PriceComponent.
  ///
  /// Takes an [int] id for an associated [Feature], and removes all [Price_Component_Feature_Association]
  ///   records referencing [this] and the given [Feature]. Returns no value.
  void removeAssocFeatures(int id) {
    //TODO: Implement removeAssocFeatures in PriceComponent
  }

  /// getAssocDependencies returns the Dependencies associated with a PriceComponent.
  ///
  /// Generates a [List<int>] of associated [Dependency] ids from [Price_Component_Party_Dependency] where
  ///   PriceComponent_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getAssocDependencies(int id) {
    //TODO: Implement getAssocDependencies in PriceComponent
    List<int> people = new List<int>();
    return people;
  }

  /// addAssocDependencies adds an associated Dependency to an PriceComponent.
  ///
  /// Takes an [int] id for an associated [Dependency], and creates an [Price_Component_Party_Dependency]
  ///   record referencing [this] and the given [Dependency]. Returns no value.
  void addAssocDependencies(int id) {
    //TODO: Implement addAssocDependencies in PriceComponent
  }

  /// removeAssocDependencies removes an associated Dependency from an PriceComponent.
  ///
  /// Takes an [int] id for an associated [Dependency], and removes all [Price_Component_Party_Dependency]
  ///   records referencing [this] and the given [Dependency]. Returns no value.
  void removeAssocDependencies(int id) {
    //TODO: Implement removeAssocDependencies in PriceComponent
  }
}