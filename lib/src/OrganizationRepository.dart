part of Partyrepository.dart;

class OrganizationRepository{
  
  Organization fetch();
  List<Organization> fetchAll();
  List<int> search();
  List<int> searchByName();
  List<int> searchByPerson();
  List<int> searchByFacility();
}