/// Order.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective

/// Order
/// This class is used to create Order objects and methods for Order objects.
class Order {
  int _id;
  int parent_id;
  DateTime orderDate;
  DateTime entryDate;

  Order () {}

  /// getOrderType returns the order type.
  ///
  /// Returns an [OrderType] from the database.
  OrderType getOrderType() {
    //TODO: Implement getOrderType in Order
    OrderType type = OrderType.PurchaseOrder;
    type = OrderType.SalesOrder;
    return type;
  }

  /// getItems returns the items of an order.
  ///
  /// Generates a [List<int>] of [Item] ids from [Order_Item_Association] where
  ///   Order_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getItems() {
    //TODO: Implement getItems in Order
    List<int> people = new List<int>();
    return people;
  }

  /// addItem adds an item to an order.
  ///
  /// Takes an [int] id for an [Item], and creates an [Order_Item_Association]
  ///   record referencing [this] and the given [Item]. Returns no value.
  void addItem(int id) {
    //TODO: Implement addItem in Order
  }

  /// removeItem removes an item from an order.
  ///
  /// Takes an [int] id for an [Item], and removes all [Order_Item_Association]
  ///   records referencing [this] and the given [Item]. Returns no value.
  void removeItem(int id) {
    //TODO: Implement RemoveItem in Order
  }

  /// getRoles returns the roles of the order.
  ///
  /// Generates a [List<int>] of [Role] ids from [Order_Item_Role] where
  ///   Order_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getRoles() {
    //TODO: Implement getRoles in Order
    List<int> people = new List<int>();
    return people;
  }

  /// addRole returns a role from an order.
  ///
  /// Takes an [int] id for a [Role], and creates an [Order_Item_Role]
  ///   record referencing [this] and the given [Role]. Returns no value.
  void addRole(int id) {
    //TODO: Implement addRole in Order
  }

  /// removeRole removes a role from an order.
  ///
  /// Takes an [int] id for a [Role], and removes all [Order_Item_Role]
  ///   records referencing [this] and the given [Role]. Returns no value.
  void removeRole(int id) {
    //TODO: Implement removeRole in Order
  }

  /// getCommunicationMechanism returns the communication mechanisms of an order.
  ///
  /// Generates a [List<int>] of [CommunicationMechanism] ids from [Order_Item_Communication_Mechanism] where
  ///   Order_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getCommunicationMechanisms() {
    //TODO: Implement getCommunicationMechanisms in Order
    List<int> people = new List<int>();
    return people;
  }

  /// addCommunicationMechanism adds a communication mechanism to an order.
  ///
  /// Takes an [int] id for a [CommunicationMechanism], and creates an [Order_Item_Communication_Mechanism]
  ///   record referencing [this] and the given [CommunicationMechanism]. Returns no value.
  void addCommunicationMechanism(int id) {
    //TODO: Implement addCommunicationMechanism in Order
  }

  /// removeCommunicationMechanism removes a communication mechanism from an order.
  ///
  /// Takes an [int] id for a [CommunicationMechanism], and removes all [Order_Item_Communication_Mechanism]
  ///   records referencing [this] and the given [CommunicationMechanism]. Returns no value.
  void removeCommunicationMechanism(int id) {
    //TODO: Implement removeCommunicationMechanism in Order
  }

  /// getTerms returns the terms of an order.
  ///
  /// Generates a [List<int>] of Term] ids from Order_Term where
  ///   Order_id references [this]
  List<int> getTerms() {
    //TODO: Implement getTerms in Order
    List<int> people = new List<int>();
    return people;
  }

  /// addTerm adds a term to an order.
  ///
  /// Generates an Order_Term table In the database
  void addTerm(int id) {
    //TODO: Implement addTerm in Order
  }

  /// getStatus returns the status of an order.
  ///
  /// Generates a [List<int>] of [Status] ids from Order_Status where
  ///   Order_id references [this]
  List<int> getStatus() {
    //TODO: Implement getStatus in Order
    List<int> people = new List<int>();
    return people;
  }

  /// addStatus adds a status to an order.
  ///
  /// Takes an [int] id for a [Status], and creates an [Order_Status]
  ///   record referencing [this] and the given [Status]. Returns no value.
  void addStatus(int id) {
    //TODO: Implement addStatus in Order
  }
}

enum OrderType {
  PurchaseOrder,
  SalesOrder
}