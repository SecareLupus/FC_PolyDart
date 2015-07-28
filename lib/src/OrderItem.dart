/**
 * OrderItem.dart
 * Friend computer 2.0
 * copyright 2015 Pioneer Valley Gamer Collective
 */
/**
 * OrderItem
 * This class is used to create OrderItem objects and methods for OrderItem objects.
 */
class OrderItem {
  int _id;
  int parent_id;
  int order;
  int orderedWith;
  int qty;
  num unitPrice;
  DateTime estDelivery;
  String shippingInstructions;
  String description;
  String comment;

  OrderItemType getOrderItemType() {
    //TODO: Implement getOrderItemType in OrderItem
    OrderItemType people = new OrderItemType();
    return people;
  }
  int getProduct() {
    //TODO: Implement getProduct in OrderItem
    int people = new int();
    return people;
  }
  int getFeature() {
    //TODO: Implement getFeature in OrderItem
    int people = new int();
    return people;
  }
}