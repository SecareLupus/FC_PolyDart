/**
 * Order.dart
 * Friend computer 2.0
 * copyright 2015 Pioneer Valley Gamer Collective
 */
/**
 * Order
 * This class is used to create Order objects and methods for Order objects.
 */
class Order {
  int _id;
  int parent_id;
  DateTime orderDate;
  DateTime entryDate;

  OrderType getOrderType() {
    //TODO: Implement getProduct in Order
    OrderType people = new OrderType();
    return people;
  }
  List<int> getItems() {
    //TODO: Implement getItems in Order
    List<int> people = new List<int>();
    return people;
  }
  void addItem(int) {
    //TODO: Implement addItem in Order
  }
  void RemoveItem(int) {
    //TODO: Implement RemoveItem in Order
  }
  List<int> getRoles() {
    //TODO: Implement getRoles in Order
    List<int> people = new List<int>();
    return people;
  }
  void addRole(int) {
    //TODO: Implement addRole in Order
  }
  void removeRole(int) {
    //TODO: Implement removeRole in Order
  }
  List<int> getCommunicationMechanisms() {
    //TODO: Implement getCommunicationMechanisms in Order
    List<int> people = new List<int>();
    return people;
  }
  void addCommunicationMechanism(int) {
    //TODO: Implement addCommunicationMechanism in Order
  }
  void removeCommunicationMechanism(int) {
    //TODO: Implement removeCommunicationMechanism in Order
  }
  List<int> getTerms() {
    //TODO: Implement getTerms in Order
    List<int> people = new List<int>();
    return people;
  }
  void addTerm(int) {
    //TODO: Implement addTerm in Order
  }
  List<int> getStatus() {
    //TODO: Implement getStatus in Order
    List<int> people = new List<int>();
    return people;
  }
  void addStatus(int) {
    //TODO: Implement addStatus in Order
  }
}