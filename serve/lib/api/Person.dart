/// Person.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective
import "Party.dart";

///
/// This class depends on:
/// * Party.dart
///
/// Person
/// This class is used to create Person objects and methods for Person objects.
class Person implements Party {
  Person() {}

  /// getName returns the person's name.
  ///
  /// Generates a [String] containing the [Person's] name from the database, or an empty [String] if no parents exist.
  String getName([DateTime when = null]) {
    //TODO: Implement getName in Person
    String people = "";
    //return people;
    //*****************************
    if (when == null) {
      when = new DateTime.now();
    }
    when = new DateTime(when.year, when.month, when.day);
    String sql = "SELECT name FROM Person_Name WHERE" +
        "Person_id=${this.getid()} AND " +
        "from_date<=${when} AND " +
        "(thru_date>=${when} OR thru_date IS NULL)";
    //*****************************
    return "";
  }

  /// getGender returns the person's gender.
  ///
  /// Generates a [String] from the database, or an empty [String] if no parents exist.
  String getGender([DateTime when = null]) {
    //TODO: Implement getGender in Person
    String people = "";
    //*****************************
    if (when == null) {
      when = new DateTime.now();
    }
    when = new DateTime(when.year, when.month, when.day);
    String sql = "SELECT Gender_Type.name, Gender_Type.description FROM " +
    "(Gender_Association INNER JOIN Gender_Type ON Gender_Association.Gender_Type_id=Gender_Type.id)" +
    " WHERE Gender_Association.Person_id=${this.getid()} AND " +
    "from_date<=${when} AND " +
    "(thru_date>=${when} OR thru_date IS NULL)";
    //*****************************
    return people;
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
