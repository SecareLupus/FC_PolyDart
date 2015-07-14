/**
 * Organization.dart
 * Friend computer 2.0
 * copyright 2015 Pioneer Valley Gamer Collective
 */
part of Party.dart;
/**
 * OrganizationRepository
 * This class is used to create Organization objects and methods for Organization objects.
 */
class Organization extends Party {
  int _id;
  int _parentid;
  
  Organization(){
    
  }
  int getid(){
    return this._id;
  }
  String getName(){
    //TODO: Implement getName in Organization
    String people = new String();
    return people;
  }
  List <int> getFacilities(){
    //TODO: Implement getFacilities in Organization
    List<int> people = new List<int>();
    return people;
  }
  List <int> getPersons(){
    //TODO: Implement getPersons in Organization
    List<int> people = new List<int>();
    return people;
  }
  void addperson(){
    //TODO: Implement addPersons in Organization
  }
  void termPerson(){
    //TODO: Implement termPersons in Organization
  }
  void addFacility(){
    //TODO: Implement addFacility in Organization
  }
  void removeFacility(){
    //TODO: Implement removeFacility in Organization
  }
}