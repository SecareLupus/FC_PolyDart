/// Shipment.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective

/// Shipment
/// This class is used to create Shipment objects and methods for Shipment objects.
class Shipment {
  int _id;
  int parent_id;
  int originParty;
  int originAddress;
  int destinationParty;
  int destinationAddress;
  DateTime estShip;
  DateTime estReady;
  DateTime estArrival;
  num estShipCost;
  num actualShipCost;
  DateTime cancelBy;
  String handlingInstructions;
  DateTime updated;

  /// getShipmentType returns the type of shipment.
  ///
  /// Generates a [ShipmentType] from the database, or an empty [ShipmentType] if no parents exist.
  ShipmentType getShipmentType() {
    //TODO: Implement getShipmentType in Shipment
    ShipmentType people = new ShipmentType();
    return people;
  }

  /// getItems returns the shipment items.
  ///
  /// Generates a [List<int>] of [Item] ids from [Shipment_Item] where
  ///   Shipment_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getItems() {
    //TODO: Implement getItems in Shipment
    List<int> people = new List<int>();
    return people;
  }

  /// addItem adds an item to the shipment.
  ///
  /// Takes an [int] id for a [Item], and creates an [Shipment_Item]
  ///   record referencing [this] and the given [Item]. Returns no value.
  void addItem() {
    //TODO: Implement addItem in Shipment
  }

  /// removeItem removes an item from the shipment.
  ///
  /// Takes an [int] id for a [Item], and removes all [Shipment_Item]
  ///   records referencing [this] and the given [Item]. Returns no value.
  void removeItem() {
    //TODO: Implement removeItem in Shipment
  }

  /// getStatusUpdates returns status updates.
  ///
  /// Generates a [List<int>] of [StatusUpdate] ids from [Shipment_Status_Type] where
  ///   Shipment_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getStatusUpdates() {
    //TODO: Implement getStatusUpdates in Shipment
    List<int> people = new List<int>();
    return people;
  }

  /// addStatusUpdate adds a status update to the shipment.
  ///
  /// Takes an [int] id for a [StatusUpdate], and creates an [Shipment_Status_Type]
  ///   record referencing [this] and the given [StatusUpdate]. Returns no value.
  void addStatusUpdate() {
    //TODO: Implement addStatusUpdate in Shipment
  }
}