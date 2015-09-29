/// Party.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective

library Party;

part 'Organization.dart';
part 'Person.dart';

/// This class depends on:
/// * Organization.dart
/// * Person.dart
///
/// Party is a library used for the classes lorem, ipsum, and loremipsum, with
/// the goal of loremipsumming.
///
/// Party
/// This class is used to create Party objects and methods for Party objects.
class Party {

  int _id;
  int _parentid;

  Party () {
  }
  /// Returns the int [id] of [this].
  int getid() {
    return this._id;
  }

  /// getDescription returns the description of a party.
  ///
  /// Generates a [String] from the database. or an empty [String] if no parents exist.
  String getDescription() {
    //TODO: Implement getDescription in Party
    String people = new String();
    return people;
  }

  /// getRoles returns the roles of a party.
  ///
  /// Generates a [List<int>] of [Role] ids from [Party_Role] where
  ///   Party_id references [this], or an empty [List<int>] if no parents exist.
  List <int> getRoles() {
    //TODO: Implement getRoles in Party
    List<int> people = new List<int>();
    return people;
  }

  /// getRelationship returns the relationship of a party.
  ///
  /// Generates a [List<int>] of [Relationship] ids from [Party_Relationship] where
  ///   Party_id references [this], or an empty [List<int>] if no parents exist.
  List <int> getRelationships() {
    //TODO: Implement getRelationship in Party
    List<int> people = new List<int>();
    return people;
  }

  /// getRelationshipNotes returns the notes of a party relationship.
  ///
  /// Generates a [List<int>] of [RelationshipNote] ids from [Relationship_Note] where
  ///   Party_id references [this], or an empty [List<int>] if no parents exist.
  List <String> getRelationshipNotes() {
    //TODO: Implement getRelationshipNotes in Party
    List<String> people = new List<String>();
    return people;
  }

  /// addRelationship adds a relationship to a party.
  ///
  /// Takes an [int] id for a [Relationship], and creates an [Party_Relationship]
  ///   record referencing [this] and the given [Relationship]. Returns no value.
  void addRelationship(int id) {
    //TODO: Implement addRelationship in Party
  }

  /// endRelationship removes a party's relationship.
  ///
  /// Takes an [int] id for a [Relationship], and removes all [Party_Relationship]
  ///   records referencing [this] and the given [Relationship]. Returns no value.
  void endRelationship(int id) {
    //TODO: Implement endRelationship in Party
  }

  /// addDescription adds a description to a party.
  ///
  /// Takes an [int] id for a [Description], and creates an [Party_Description_Association]
  ///   record referencing [this] and the given [Description]. Returns no value.
  void addDescription(int id) {
    //TODO: Implement addDescription in Party
  }

  /// endDescription removes a party's description.
  ///
  /// Takes an [int] id for a [Description], and removes all [Party_Description_Association]
  ///   records referencing [this] and the given [Description]. Returns no value.
  void endDescription(int id) {
    //TODO: Implement endDescription in Party
  }

  /// addRole adds a role of a party.
  ///
  /// Takes an [int] id for a [Role], and creates an [Party_Role]
  ///   record referencing [this] and the given [Role]. Returns no value.
  void addRole(int id) {
    //TODO: Implement addRole in Party
  }

  /// endRole removes a party role.
  ///
  /// Takes an [int] id for a [Role], and removes all [Party_Role]
  ///   records referencing [this] and the given [Role]. Returns no value.
  void endRole(int id) {
    //TODO: Implement endRole in Party
  }

  /// getShipments returns a list of shipments.
  ///
  /// Generates a [List<int>] of [Shipment] ids from [Shipment] where
  ///   Party_id references [this], or an empty [List<int>] if no parents exist.
  List <int> getShipments() {
    //TODO: Implement getShipments in Party
    List<int> people = new List<int>();
    return people;
  }

  /// addCommunicationMechanism adds a communication mechanism to the party.
  ///
  /// Takes an [int] id for a [CommunicationMechanism], and creates an [Party_Communication_Association]
  ///   record referencing [this] and the given [CommunicationMechanism]. Returns no value.
  void addCommunicationMechanism(int id) {
    //TODO: Implement addCommunicationMechanism in Party
  }

  /// getDescription returns a list of the party's communication mechanisms.
  ///
  /// Generates a [List<int>] of [CommunicationMechanism] ids from [Party_Communication_Association] where
  ///   Party_id references [this], or an empty [List<int>] if no parents exist.
  List <int> getCommunicationMechanisms() {
    //TODO: Implement getCommunicationMechanism in Party
    List<int> people = new List<int>();
    return people;
  }

  /// endCommunicationMechanism removes a communication mechanism.
  ///
  /// Takes an [int] id for a [CommunicationMechanism], and removes all [Party_Communication_Association]
  ///   records referencing [this] and the given [CommunicationMechanism]. Returns no value.
  void endCommunicationMechanism(int id) {
    //TODO: Implement endCommunicationMechanism in Party
  }

  /// getCommunicationEvents a list of party communication events.
  ///
  /// Generates a [List<int>] of [CommunicationEvent] ids from [Communication_Event] where
  ///   Party_id references [this], or an empty [List<int>] if no parents exist.
  List <int> getCommunicationEvents() {
    //TODO: Implement getCommunicationEvents in Party
    List<int> people = new List<int>();
    return people;
  }

  /// addEvent adds an event to the party.
  ///
  /// Takes an [int] id for a [Event], and creates an [Event_Party_Association]
  ///   record referencing [this] and the given [Event]. Returns no value.
  void addEvent(int id) {
    //TODO: Implement addEvents in Party
  }

  /// getDescription returns a list of party events.
  ///
  /// Generates a [List<int>] of [Event] ids from [Event_Party_Association] where
  ///   Party_id references [this], or an empty [List<int>] if no parents exist.
  List <int> getEvents() {
    //TODO: Implement getEvents in Party
    List<int> people = new List<int>();
    return people;
  }

  /// getDescription removes a party event.
  ///
  /// Takes an [int] id for a [Event], and removes all [Event_Party_Association]
  ///   records referencing [this] and the given [Event]. Returns no value.
  void removeEvent(int id) {
    //TODO: Implement removeEvents in Party
  }

}
