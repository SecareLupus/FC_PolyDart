part of Party.dart;

class Organization extends Party {
  int _id;
  int _parentid;
  
  Organization(){
    
  }
  int getid(){
    return this._id;
  }
  String getName();
  List <int> getFacilities();
  List <int> getPersons();
  void addperson();
  void termPerson();
  void addFacility();
  void removeFacility();
}