part of Partyrepository.dart;

class PersonRepository{
  
  Person fetch();
  List<Person> fetchAll();
  List<int> search();
  List<int> searchByName();
  List<int> searchByOrganization();
  List<int> searchByOrganizationRole();
}