library Party;
part 'Organization.dart';
part 'Person.dart';


class Party {
  int _id;
  int _parentid;
  
  Party (){
    
  }
  int getid(){
    return this._id;
  }
  String getDescription();
  List <Role> getRoles();
  List <Party> getRelationship();
  List <String> getRelationshipNotes();
  void addRelationship();
  void endRelationship();
  void addDescription();
  void endDescription();
  void addRole();
  void endRole();
  List <Shipments> getShipments();
  void addCommunicationMechanism();
  List <int> getCommunicationMechanisms();
  void endCommunicationMechanism();
  List <int> getCommunicationEvents();
  void addEvent();
  List <int> getEvents();
  void removeEvent();
}