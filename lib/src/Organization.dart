/// Organization.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective
part of Party.dart;

/// This class depends on:
/// * Party.dart
///
/// Organization
/// This class is used to create Organization objects and methods for accessing Organization objects.
class Organization extends Party {
  int _id;
  int _parentid;

  Organization() {

  /// getid returns this party's ID.
  ///
  /// @returns The ID number of this party.
  int getid() {
    return this._id;
  }

  /// getName returns the name of an organization.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns String of organization name.
  String getName() {
    //TODO: Implement getName in Organization
    String people = new String();
    return people;
  }

  /// getName returns the facilities of an organization.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns List of integers.
  List <int> getFacilities() {
    //TODO: Implement getFacilities in Organization
    List<int> people = new List<int>();
    return people;
  }

  /// getPersons returns the people in an organization.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns List of integers.
  List <int> getPersons() {
    //TODO: Implement getPersons in Organization
    List<int> people = new List<int>();
    return people;
  }

  /// addPerson adds a person to an organization.
  ///
  /// @param name Placeholder for parameter name.
  void addPerson() {
    //TODO: Implement addPersons in Organization
  }

  /// termPerson removes a person from an organization.
  ///
  /// @param name Placeholder for parameter name.
  void termPerson() {
    //TODO: Implement termPersons in Organization
  }

  /// addFacility adds a facility to an organization.
  ///
  /// @param name Placeholder for parameter name.
  void addFacility() {
    //TODO: Implement addFacility in Organization
  }

  /// removeFacility removes a facility from an organization.
  ///
  /// @param name Placeholder for parameter name.
  void removeFacility() {
    //TODO: Implement removeFacility in Organization
  }

}
