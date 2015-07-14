/**
 * Person.dart
 * Friend computer 2.0
 * copyright 2015 Pioneer Valley Gamer Collective
 */
part of Party.dart;
/**
 * Person
 * This class is used to create Person objects and methods for Person objects.
 */
class Person extends Party {
  int _id;
  int _parentid;
  
  Person(){
    
  }
  String getName(){
    //TODO: Implement getName in Person
    String people = new String();
    return people;
  }
  String getGender(){
    //TODO: Implement getGender in Person
    String people = new String();
    return people;
  }
  int getid(){
    return this._id;
  }
  List <int> getAssociatedOrganizations(){
    //TODO: Implement getAssociatedOrganizations in Person
    List<int> people = new List<int>();
    return people;
  }
  List <int> getOrganizationRoles(){
    //TODO: Implement getOrganizationRoles in Person
    List<int> people = new List<int>();
    return people;
  }
}