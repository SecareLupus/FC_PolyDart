/**
 * Party.dart
 * Friend Computer 2.0
 * Copyright 2015 Pioneer Valley Gamer Collective
 */
library Party;

part 'Organization.dart';
part 'Person.dart';
/**
 * Party
 * This class is used to create Party objects and methods for Party objects.
 */

class Party {
  int _id;
  int _parentid;

  Party() {}
  int getid() {
    return this._id;
  }
  String getDescription() {
    //TODO: Implement getDescription in Party
    String people = new String();
    return people;
  }
  List<Role> getRoles() {
    //TODO: Implement getRoles in Party
    List<Role> people = new List<Role>();
    return people;
  }
  List<Party> getRelationship() {
    //TODO: Implement getRelationship in Party
    List<Party> people = new List<Party>();
    return people;
  }
  List<String> getRelationshipNotes() {
    //TODO: Implement getRelationshipNotes in Party
    List<String> people = new List<String>();
    return people;
  }
  void addRelationship() {
    //TODO: Implement addRelationship in Party
  }
  void endRelationship() {
    //TODO: Implement endRelationship in Party
  }
  void addDescription() {
    //TODO: Implement addDescription in Party
  }
  void endDescription() {
    //TODO: Implement endDescription in Party
  }
  void addRole() {
    //TODO: Implement addRole in Party
  }
  void endRole() {
    //TODO: Implement endRole in Party
  }
  List<Shipments> getShipments() {
    //TODO: Implement getShipments in Party
    List<Shipments> people = new List<Shipments>();
    return people;
  }
  void addCommunicationMechanism() {
    //TODO: Implement addCommunicationMechanism in Party
  }
  List<int> getCommunicationMechanisms() {
    //TODO: Implement getCommunicationMechanism in Party
    List<int> people = new List<int>();
    return people;
  }
  void endCommunicationMechanism() {
    //TODO: Implement endCommunicationMechanism in Party
  }
  List<int> getCommunicationEvents() {
    //TODO: Implement getCommunicationEvents in Party
    List<int> people = new List<int>();
    return people;
  }
  void addEvent() {
    //TODO: Implement addEvents in Party
  }
  List<int> getEvents() {
    //TODO: Implement getEvents in Party
    List<int> people = new List<int>();
    return people;
  }
  void removeEvent() {
    //TODO: Implement removeEvents in Party
  }
}
