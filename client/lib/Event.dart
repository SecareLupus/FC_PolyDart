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

  Event (int id) {}


  /// getid returns this party's ID.
  ///
  /// @returns The ID number of this event.
  int getid() {
    return this._id;
  }

  /// getName returns the name of this event.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns The name of this event.
  String getName() {
    return this._Name;
  }

  /// getDescription returns this event's description.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns The description of this event.
  String getDescription() {
    return this._Description;
  }

  /// setName changes the name of an event.
  ///
  /// @param newName An event name.
  void setName(String newName) {
    this._Name = newName as String;
  }

  /// setDescription changes the description of an event.
  ///
  /// @param newDescription A description name.
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

  /// addParty adds a Party object.
  ///
  /// @param name Placeholder for parameter name.
  void addParty(int id) {
    //TODO: Implement addPartyAssociations in Event
  }

  /// removeParty removes a Party object.
  ///
  /// @param name Placeholder for parameter name.
  void removeParty(int id) {
    //TODO: Implement endPartyAssociations in Event
  }

  /// getPartyAssociationRoles returns a list of party association roles.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
  List<int> getPartyAssociationRoles() {
    //TODO: Implement getPartyAssociationRoles in Event
    List<String> group = new List<int>();
    return group;
  }

  /// getSchedules returns a list of schedules.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
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
  }

  /// getEventStart returns the start of the event.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
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
  }

  /// getEventEnd returns the end of the event.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
  List<int> getEventEnd() {
    //TODO: Implement getEventEnd in Event
    List<int> group = new List<int>();
    return group;
  }

}
