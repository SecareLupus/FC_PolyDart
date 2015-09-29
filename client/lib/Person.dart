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
  /// Generates a [String] containing the [Person's] name from the database, or an empty [String] if no parents exist.
  String getName() {
    //TODO: Implement getName in Person
    String people = new String();
    return people;
  }

  /// getGender returns the person's gender.
  ///
  /// Generates a [String] from the database, or an empty [String] if no parents exist.
  String getGender() {
    //TODO: Implement getGender in Person
    String people = new String();
    return people;
  }

  /// Returns the int [id] of [this].
  int getid() {
    return this._id;
  }

  /// getAssociatedOrganizations returns the organizations associated with a person.
  ///
  /// Generates a [List<int>] of associated [Organization] ids from [Organization_Person_Association] where
  ///   Person_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getAssociatedOrganizations() {
    //TODO: Implement getAssociatedOrganizations in Person
    List<int> people = new List<int>();
    return people;
  }

  /// getOrganizationRoles returns the organization roles of a person.
  ///
  /// Generates a [List<int>] of [Role] ids from [Person_Role] where
  ///   Person_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getOrganizationRoles() {
    //TODO: Implement getOrganizationRoles in Person
    List<int> people = new List<int>();
    return people;
  }

}
