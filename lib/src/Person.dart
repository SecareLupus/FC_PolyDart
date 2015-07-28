/// Person.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective

part of Party.dart;

/// This class depends on:
/// * Party.dart
///
/// Person
/// This class is used to create Person objects and methods for Person objects.
class Person extends Party {
  int _id;
  int _parentid;

  Person() {}

  /// getName returns the person's name.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns String of person's name.
  String getName() {
    //TODO: Implement getName in Person
    String people = new String();
    return people;
  }

  /// getGender returns the person's gender.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns String of person's gender.
  String getGender() {
    //TODO: Implement getGender in Person
    String people = new String();
    return people;
  }

  /// getid returns this person's ID.
  ///
  /// @returns The ID number of this person.
  int getid() {
    return this._id;
  }

  /// getAssociatedOrganizations returns the organizations associated with a person.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
  List<int> getAssociatedOrganizations() {
    //TODO: Implement getAssociatedOrganizations in Person
    List<int> people = new List<int>();
    return people;
  }

  /// getOrganizationRoles returns the organization roles of a person.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
  List<int> getOrganizationRoles() {
    //TODO: Implement getOrganizationRoles in Person
    List<int> people = new List<int>();
    return people;
  }

}
