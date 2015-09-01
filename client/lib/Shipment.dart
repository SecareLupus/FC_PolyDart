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
  /// @param name Placeholder for parameter name.
  /// @returns A list of shipment types.
  ShipmentType getShipmentType() {
    //TODO: Implement getShipmentType in Shipment
    ShipmentType people = new ShipmentType();
    return people;
  }

  /// getItems returns the shipment items.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
  List<int> getItems() {
    //TODO: Implement getItems in Shipment
    List<int> people = new List<int>();
    return people;
  }

  /// addItem adds an item to the shipment.
  ///
  /// @param name Placeholder for parameter name.
  void addItem() {
    //TODO: Implement addItem in Shipment
  }

  /// removeItem removes an item from the shipment.
  ///
  /// @param name Placeholder for parameter name.
  void removeItem() {
    //TODO: Implement removeItem in Shipment
  }

  /// getStatusUpdates returns status updates.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
  List<int> getStatusUpdates() {
    //TODO: Implement getStatusUpdates in Shipment
    List<int> people = new List<int>();
    return people;
  }

  /// addStatusUpdate adds a status update to the shipment.
  ///
  /// @param name Placeholder for parameter name.
  void addStatusUpdate() {
    //TODO: Implement addStatusUpdate in Shipment
  }
}