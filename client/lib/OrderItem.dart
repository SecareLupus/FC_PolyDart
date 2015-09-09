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

  OrderItem () {}

  /// getOrderItemType returns the type of order item.
  ///
  /// Generates a [OrderItemType] from the database.
  OrderItemType getOrderItemType() {
    //TODO: Implement getOrderItemType in OrderItem
    OrderItemType people = new OrderItemType();
    return people;
  }

  /// getProduct returns a product id.
  ///
  /// Generates an [int] of a [Product] id from [Product_OrderItem_Association] where
  ///   OrderItem_id references [this], or an empty [int] if no parents exist.
  int getProduct() {
    //TODO: Implement getProduct in OrderItem
    int people = 0;
    return people;
  }

  /// getFeature returns a feature id.
  ///
  /// Generates an [int] of a [Feature] id from [Feature_OrderItem_Association] where
  ///   OrderItem_id references [this], or an empty [int] if no parents exist.
  int getFeature() {
    //TODO: Implement getFeature in OrderItem
    int people = 0;
    return people;
  }
}