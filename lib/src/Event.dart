/// Event.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective

/// Event
/// This class is used to create Event objects and methods for Event objects.
class Event {
  int _id;
  int _parentid;
  String _Name;
  String _Description;

  Event () {
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

  /// getParties returns a list of party objects.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of parties.
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

  /// getSchedules returns a list of schedules.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of schedules.
  List<int> getSchedules() {
    //TODO: Implement getSchedules in Event
    List<int> schedules = new List<int>();
    return schedules;
  }

  /// addParty adds a party to the event.
  ///
  /// @param name Placeholder for parameter name.
  void addParty () {
    //TODO: Implement addParty in Event
  }

  /// removeParty removes a party from an event.
  ///
  /// @param name Placeholder for parameter name.
  void removeParty () {
    //TODO: Implement removeParty in Event
  List<int> getEventStart() {
    //TODO: Implement getEventStart in Event
    List<int> group = new List<int>();
    return group;
  }

  /// addSchedule adds a schedule to the event.
  ///
  /// @param name Placeholder for parameter name.
  void addSchedule () {
    //TODO: Implement addSchedule for Event
  List<int> getEventEnd() {
    //TODO: Implement getEventEnd in Event
    List<int> group = new List<int>();
    return group;
  }

}
