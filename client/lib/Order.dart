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
    //TODO: Implement getProduct in Order
    OrderType people = new OrderType();
    return people;
  }

  /// getItems returns the items of an order.
  ///
  /// Generates a [List<int>] of [Item] ids from [Item_Order_Association] where
  ///   Order_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getItems() {
    //TODO: Implement getItems in Order
    List<int> people = new List<int>();
    return people;
  }

  /// addItem adds an item to an order.
  ///
  /// Takes an [int] id for an [Item], and creates an [Item_Order_Association]
  ///   record referencing [this] and the given [Item]. Returns no value.
  void addItem(int id) {
    //TODO: Implement addItem in Order
  }

  /// removeItem removes an item from an order.
  ///
  /// Takes an [int] id for an [Item], and removes all [Item_Order_Association]
  ///   records referencing [this] and the given [Item]. Returns no value.
  void removeItem(int id) {
    //TODO: Implement RemoveItem in Order
  }

  /// getRoles returns the roles of the order.
  ///
  /// Generates a [List<int>] of [Role] ids from [Role_Order_Association] where
  ///   Order_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getRoles() {
    //TODO: Implement getRoles in Order
    List<int> people = new List<int>();
    return people;
  }

  /// addRole returns a role from an order.
  ///
  /// Takes an [int] id for a [Role], and creates an [Role_Order_Association]
  ///   record referencing [this] and the given [Role]. Returns no value.
  void addRole(int id) {
    //TODO: Implement addRole in Order
  }

  /// removeRole removes a role from an order.
  ///
  /// Takes an [int] id for a [Role], and removes all [Role_Order_Association]
  ///   records referencing [this] and the given [Role]. Returns no value.
  void removeRole(int id) {
    //TODO: Implement removeRole in Order
  }

  /// getCommunicationMechanism returns the communication mechanisms of an order.
  ///
  /// Generates a [List<int>] of [CommunicationMechanism] ids from [CommunicationMechanism_Order_Association] where
  ///   Order_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getCommunicationMechanisms() {
    //TODO: Implement getCommunicationMechanisms in Order
    List<int> people = new List<int>();
    return people;
  }

  /// addCommunicationMechanism adds a communication mechanism to an order.
  ///
  /// Takes an [int] id for a [CommunicationMechanism], and creates an [CommunicationMechanism_Order_Association]
  ///   record referencing [this] and the given [CommunicationMechanism]. Returns no value.
  void addCommunicationMechanism(int id) {
    //TODO: Implement addCommunicationMechanism in Order
  }

  /// removeCommunicationMechanism removes a communication mechanism from an order.
  ///
  /// Takes an [int] id for a [CommunicationMechanism], and removes all [CommunicationMechanism_Order_Association]
  ///   records referencing [this] and the given [CommunicationMechanism]. Returns no value.
  void removeCommunicationMechanism(int id) {
    //TODO: Implement removeCommunicationMechanism in Order
  }

  /// getTerms returns the terms of an order.
  ///
  /// Generates a [List<int>] of [Term] ids from [Term_Order_Association] where
  ///   Order_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getTerms() {
    //TODO: Implement getTerms in Order
    List<int> people = new List<int>();
    return people;
  }

  /// addTerm adds a term to an order.
  ///
  /// Takes an [int] id for a [Term], and creates an [Term_Order_Association]
  ///   record referencing [this] and the given [Term]. Returns no value.
  void addTerm(int id) {
    //TODO: Implement addTerm in Order
  }

  /// getStatus returns the status of an order.
  ///
  /// Generates a [List<int>] of [Status] ids from [Status_Order_Association] where
  ///   Order_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getStatus() {
    //TODO: Implement getStatus in Order
    List<int> people = new List<int>();
    return people;
  }

  /// addStatus adds a status to an order.
  ///
  /// Takes an [int] id for a [Status], and creates an [Status_Order_Association]
  ///   record referencing [this] and the given [Status]. Returns no value.
  void addStatus(int id) {
    //TODO: Implement addStatus in Order
  }
}