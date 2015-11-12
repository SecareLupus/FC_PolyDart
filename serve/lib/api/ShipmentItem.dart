/// ShipmentItem.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective

/// ShipmentItem
/// This class is used to create ShipmentItem objects and methods for ShipmentItem objects.
class ShipmentItem {
  int _id;
  int parent_id;
  int good;
  int shipment;
  int response;
  int qty;
  String description;

  /// getFeatures returns the features of a shipment item.
  ///
  /// Generates a [List<int>] of [Feature] ids from [Shipment_Item_Feature] where
  ///   ShipmentItem_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getFeatures() {
    //TODO: Implement getFeatures in ShipmentItem
    List<int> people = new List<int>();
    return people;
  }

  /// addFeature adds a feature to a shipment item.
  ///
  /// Takes an [int] id for a [Feature], and creates an [Shipment_Item_Feature]
  ///   record referencing [this] and the given [Feature]. Returns no value.
  void addFeature() {
    //TODO: Implement addFeature in ShipmentItem
  }

  /// removeFeature removes a feature from a shipment item.
  ///
  /// Takes an [int] id for a [Feature], and removes all [Shipment_Item_Feature]
  ///   records referencing [this] and the given [Feature]. Returns no value.
  void removeFeature() {
    //TODO: Implement removeFeature in ShipmentItem
  }

  /// getResponses returns the responses of a shipment item.
  ///
  /// Generates a [List<int>] of [Response] ids from [Shipment_Item] where
  ///   ShipmentItem_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getResponses() {
    //TODO: Implement getResponses in ShipmentItem
    List<int> people = new List<int>();
    return people;
  }

  /// addResponseItem adds a response item to a shipment item.
  ///
  /// Takes an [int] id for a [Response], and creates a [Shipment_Item]
  ///   record referencing [this] and the given [Response]. Returns no value.
  void addResponseItem() {
    //TODO: Implement addResponseItem in ShipmentItem
  }

  /// getOrderItems returns the order items of a shipment item.
  ///
  /// Generates a [List<int>] of [OrderItem] ids from [Order_Shipment] where
  ///   ShipmentItem_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getOrderItems() {
    //TODO: Implement getOrderItems in ShipmentItem
    List<int> people = new List<int>();
    return people;
  }

  /// addOrderItem adds an order item to a shipment item.
  ///
  /// Takes an [int] id for a [OrderItem], and creates an [Order_Shipment]
  ///   record referencing [this] and the given [OrderItem]. Returns no value.
  void addOrderItem() {
    //TODO: Implement addOrderItem in ShipmentItem
  }

  /// removeOrderItem removes an order item from a shipment item.
  ///
  /// Takes an [int] id for a [OrderItem], and removes all [Order_Shipment]
  ///   records referencing [this] and the given [OrderItem]. Returns no value.
  void removeOrderItem() {
    //TODO: Implement removeOrderItem in ShipmentItem
  }

  /// getIssuances returns the issuance of a shipment item.
  ///
  /// Generates a [List<int>] of [Issuance] ids from [Item_Issuance] where
  ///   ShipmentItem_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getIssuances() {
    //TODO: Implement getIssuances in ShipmentItem
    List<int> people = new List<int>();
    return people;
  }

  /// addIssuance adds an issuance to a shipment item.
  ///
  /// Takes an [int] id for a [Issuance], and creates an [Item_Issuance]
  ///   record referencing [this] and the given [Feature]. Returns no value.
  void addIssuance() {
    //TODO: Implement addIssuance in ShipmentItem
  }

  /// getPackages returns the packages of a shipment item.
  ///
  /// Generates a [List<int>] of [Package] ids from [Packaging_Content] where
  ///   ShipmentItem_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getPackages() {
    //TODO: Implement getPackages in ShipmentItem
    List<int> people = new List<int>();
    return people;
  }

  /// addPackage adds a package to a shipment item.
  ///
  /// Takes an [int] id for a [Package], and creates an [Packaging_Content]
  ///   record referencing [this] and the given [Package]. Returns no value.
  void addPackage() {
    //TODO: Implement addPackage in ShipmentItem
  }
}