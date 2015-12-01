/// Organization.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective
import "Party.dart";
import "ObjectCache.dart";

/// This class depends on:
/// * Party.dart
///
/// Organization
/// This class is used to create Organization objects and methods for accessing Organization objects.
class Organization implements Party {
  static OrganizationCache _cache = new OrganizationCache();

  Organization._create() {
    //Create object in db, and then fill in any values we can, like id, etc.
  }

  factory Organization(int id) {
    //If exists in cache, return that.
    //Else create new one.
    //Drag data out of db, put in object, flag object for updates.
    Organization fetchCache = null;
    if (id != -1)
      fetchCache = _cache.getFromCache(id);
    if (fetchCache == null) {
      fetchCache = new Organization._create();
    }
    return fetchCache;
  }

  /// getName returns the name of an organization.
  ///
  /// Generates a [String] from the database where the [DateTime] matches the [DateTime] in the database,
  /// or an empty [String] if no parents exist.
  String getName(DateTime Date) {
    //TODO: Implement getName in Organization
    String people = "";
    return people;
  }

  /// getName returns the facilities of an organization.
  ///
  /// Generates a [List<int>] of [Facility] ids from [Facility_Organization_Association] where
  ///   Organization_id references [this], or an empty [List<int>] if no parents exist.
  List <int> getFacilities() {
    //TODO: Implement getFacilities in Organization
    List<int> people = new List<int>();
    return people;
  }

  /// getPersons returns the people in an organization.
  ///
  /// Generates a [List<int>] of [Person] ids from [Organization_Person_Association] where
  ///   the [DateTime] matches the [DateTime] in the database; Organization_id references [this],
  ///   or an empty [List<int>] if no parents exist.
  List <int> getPersons(DateTime Date) {
    //TODO: Implement getPersons in Organization
    List<int> people = new List<int>();
    return people;
  }

  /// addPerson adds a person to an organization.
  ///
  /// Takes an [int] id for a [Person], and creates an [Organization_Person_Association]
  ///   record referencing [this] and the given [Person]. Returns no value.
  void addPerson(int id) {
    //TODO: Implement addPersons in Organization
  }

  /// termPerson removes a person from an organization.
  ///
  /// Takes an [int] id for a [Person], and removes all [Organization_Person_Association]
  ///   records referencing [this] and the given [Person]. Returns no value.
  void termPerson(int id) {
    //TODO: Implement termPersons in Organization
  }

  /// addFacility adds a facility to an organization.
  ///
  /// Takes an [int] id for a [Facility], and creates an [Facility_Organization_Association]
  ///   record referencing [this] and the given [Facility]. Returns no value.
  void addFacility(int id) {
    //TODO: Implement addFacility in Organization
  }

  /// removeFacility removes a facility from an organization.
  ///
  /// Takes an [int] id for a [Facility], and removes all [Facility_Organization_Association]
  ///   records referencing [this] and the given [Facility]. Returns no value.
  void removeFacility(int id) {
    //TODO: Implement removeFacility in Organization
  }
}

class OrganizationCache extends ObjectCache<Organization> {}
