/**
 * CommunicationMechanism.dart
 * Friend computer 2.0
 * copyright 2015 Pioneer Valley Gamer Collective
 */

/**
 * CommunicationMechanism
 * This class is used to create CommunicationMechanism objects and methods for CommunicationMechanism objects.
 */
class CommunicationMechanism {
  int _id;

  int getid() {
    return this._id;
  }
  List<Party> getPartyAssociations() {
    //TODO: Implement getPartyAssociations in CommunicationMechanism
    List<Party> people = new List<Party>();
    return people;
  }
  void addPartyAssociation() {
    //TODO: Implement addPartyAssociations in CommunicationMechanism
  }
  void endPartyAssociation() {
    //TODO: Implement endPartyAssociations in CommunicationMechanism
  }
  List<Facility> getFacilityAssociation() {
    //TODO: Implement getFacilityAssociation in CommunicationMechanism
    List<Facility> people = new List<Facility>();
    return people;
  }
  void addFacilityAssociation() {
    //TODO: Implement addFacilityAssociation in CommunicationMechanism
  }
  void endFacilityAssociation() {
    //TODO: Implement endFacilityAssociation in CommunicationMechanism
  }
}

class Address extends CommunicationMechanism {
  int _id;

  int getid() {
    return this._id;
  }
  List <int> getPartyAssociation(Date){
    //TODO: Implement search in CommunicationMechanism
    List<int> people = new List<int>();
    return people;
  }
  String getAddress() {
    //TODO: Implement getAddress in CommunicationMechanism
    String people = new String();
    return people;
  }
  List<String> getFullAddress() {
    //TODO: Implement getFullAddress in CommunicationMechanism
    List<String> people = new List<String>();
    return people;
  }
}
class Email_Address extends CommunicationMechanism {
  int _id;

  int getid() {
    return this._id;
  }
  String getEMail() {
    //TODO: Implement getEMail in CommunicationMechanism
    String people = new String();
    return people;
  }
}
class Phone_Number extends CommunicationMechanism {
  int _id;

  int getid() {
    return this._id;
  }
  String getPhoneNumber() {
    //TODO: Implement getPhoneNumber in CommunicationMechanism
    String people = new String();
    return people;
  }
}
