/// OrderItem.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective

/// OrderItem
/// This class is used to create OrderItem objects and methods for OrderItem objects.
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

  /// getOrderItemType returns the type of order item.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns An OrderItemType object.
  OrderItemType getOrderItemType() {
    //TODO: Implement getOrderItemType in OrderItem
    OrderItemType people = new OrderItemType();
    return people;
  }

  /// getProduct returns a product.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns An integer.
  int getProduct() {
    //TODO: Implement getProduct in OrderItem
    int people = 0;
    return people;
  }

  /// getFeature returns a feature.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns An integer.
  int getFeature() {
    //TODO: Implement getFeature in OrderItem
    int people = 0;
    return people;
  }
}