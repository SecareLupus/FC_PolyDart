part of Party.dart;

class Person extends Party {
  int _id;
  int _parentid;
  
  Person(){
    
  }
  String getName();
  String getGender();
  int getid(){
    return this._id;
  }
  List <int> getAssociatedOrganizations();
  List <int> getOrgaanizationRoles();
}