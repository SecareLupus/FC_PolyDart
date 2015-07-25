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
  
  Party (){
  }

  /// getid returns this party's ID.
  ///
  /// @returns The ID number of this party.
  int getid(){
    return this._id;
  }

  /// getDescription returns the description of a party.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns Description of people.
  String getDescription(){
    //TODO: Implement getDescription in Party
    String people = new String();
    return people;
  }

  /// getRoles returns the roles of a party.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns Roles of people.
  List <Role> getRoles(){
    //TODO: Implement getRoles in Party
    List<Role> people = new List<Role>();
    return people;
  }

  /// getRelationship returns the relationship of a party.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns Relationship of people.
  List <Party> getRelationship(){
    //TODO: Implement getRelationship in Party
    List<Party> people = new List<Party>();
    return people;
  }

  /// getRelationshipNotes returns the notes of a party relationship.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns Relationship notes of people.
  List <String> getRelationshipNotes(){
    //TODO: Implement getRelationshipNotes in Party
    List<String> people = new List<String>();
    return people;
  }

  /// addRelationship adds a relationship to a party.
  ///
  /// @param name Placeholder for parameter name.
  void addRelationship(){
    //TODO: Implement addRelationship in Party
  }

  /// endRelationship removes a party's relationship.
  ///
  /// @param name Placeholder for parameter name.
  void endRelationship(){
    //TODO: Implement endRelationship in Party
  }

  /// addDescription adds a description to a party.
  ///
  /// @param name Placeholder for parameter name.
  void addDescription(){
    //TODO: Implement addDescription in Party
  }

  /// endDescription removes a party's description.
  ///
  /// @param name Placeholder for parameter name.
  void endDescription(){
    //TODO: Implement endDescription in Party
  }

  /// addRole adds a role of a party.
  ///
  /// @param name Placeholder for parameter name.
  void addRole(){
    //TODO: Implement addRole in Party
  }

  /// endRole removes a party role.
  ///
  /// @param name Placeholder for parameter name.
  void endRole(){
    //TODO: Implement endRole in Party
  }

  /// getShipments returns a list of shipments.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of shipments.
  List <Shipments> getShipments(){
    //TODO: Implement getShipments in Party
    List<Shipments> people = new List<Shipments>();
    return people;
  }

  /// addCommunicationMechanism adds a communication mechanism to the party.
  ///
  /// @param name Placeholder for parameter name.
  void addCommunicationMechanism(){
    //TODO: Implement addCommunicationMechanism in Party
  }

  /// getDescription returns a list of the party's communication mechanisms.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of communication mechanisms.
  List <int> getCommunicationMechanisms(){
    //TODO: Implement getCommunicationMechanism in Party
    List<int> people = new List<int>();
    return people;
  }

  /// endCommunicationMechanism removes a communication mechanism.
  ///
  /// @param name Placeholder for parameter name.
  void endCommunicationMechanism(){
    //TODO: Implement endCommunicationMechanism in Party
  }

  /// getCommunicationEvents a list of party communication events.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of communication events.
  List <int> getCommunicationEvents(){
    //TODO: Implement getCommunicationEvents in Party
    List<int> people = new List<int>();
    return people;
  }

  /// addEvent adds an event to the party.
  ///
  /// @param name Placeholder for parameter name.
  void addEvent(){
    //TODO: Implement addEvents in Party
  }

  /// getDescription returns a list of party events.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of events.
  List <int> getEvents(){
    //TODO: Implement getEvents in Party
    List<int> people = new List<int>();
    return people;
  }

  /// getDescription removes a party event.
  ///
  /// @param name Placeholder for parameter name.
  void removeEvent(){
    //TODO: Implement removeEvents in Party
  }

}