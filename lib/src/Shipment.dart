/**
 * Shipment.dart
 * Friend computer 2.0
 * copyright 2015 Pioneer Valley Gamer Collective
 */
/**
 * Shipment
 * This class is used to create Shipment objects and methods for Shipment objects.
 */
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

  ShipmentType getShipmentType() {
    //TODO: Implement getShipmentType in Shipment
    ShipmentType people = new ShipmentType();
    return people;
  }
  List<int> getItems() {
    //TODO: Implement getItems in Shipment
    List<int> people = new List<int>();
    return people;
  }
  void addItem() {
    //TODO: Implement addItem in Shipment
  }
  void removeItem() {
    //TODO: Implement removeItem in Shipment
  }
  List<int> getStatusUpdates() {
    //TODO: Implement getStatusUpdates in Shipment
    List<int> people = new List<int>();
    return people;
  }
  void addStatusUpdate() {
    //TODO: Implement addStatusUpdate in Shipment
  }
}