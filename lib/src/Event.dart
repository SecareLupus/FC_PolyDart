/**
 * Event.dart
 * Friend computer 2.0
 * copyright 2015 Pioneer Valley Gamer Collective
 */
/**
 * Person
 * This class is used to create Event objects and methods for Event objects.
 */
class Event {
  int _id;
  String _Name;
  String _Description;

  int getid() {
    return this._id;
  }
  String getName() {
    return this._Name;
  }
  String getDescription() {
    return this._Description;
  }
  void setName(String newName) {
    this._Name = newName as String;
  }
  void setDescription(String newDescription) {
    this._Description = newDescription as String;
  }
  List<int> getParties() {
    //TODO: Implement getPartyAssociations in Event
    List<int> group = new List<int>();
    return group;
  }
  void addParty(int id) {
    //TODO: Implement addPartyAssociations in Event
  }
  void removeParty(int id) {
    //TODO: Implement endPartyAssociations in Event
  }
  List<int> getPartyAssociationRoles() {
    //TODO: Implement getPartyAssociationRoles in Event
    List<String> group = new List<int>();
    return group;
  }
  List<int> getSchedules() {
    //TODO: Implement getEventSchedule in Event
    List<int> group = new List<int>();
    return group;
  }
  void addSchedule(int id) {
    //TODO: Implement addSchedule in Event
  }
  List<int> getEventStart() {
    //TODO: Implement getEventStart in Event
    List<int> group = new List<int>();
    return group;
  }
  List<int> getEventEnd() {
    //TODO: Implement getEventEnd in Event
    List<int> group = new List<int>();
    return group;
  }
}
