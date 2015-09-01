/// Facility.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective

/// Facility
/// This class is used to create Facility objects and methods for Facility objects.
class Facility {
  int _id;
  int parent_id;

  /// Returns the int [id] of [this].
  int getid(){
    return this._id;
  }

  /// Returns the [FacilityType] of [this].
  ///
  /// Generates and returns a [FacilityType] object with value
  ///   BUILDING if [this] is a Building, or a [FacilityType] object with value
  ///   ROOM if [this] is a Room.
  FacilityType getFacilityType() {
    //TODO: Implement getFacilityType in Facility
    FacilityType people = new FacilityType();
    return people;
  }

  /// Returns the int [id] of the child [Building] of [this].
  ///
  /// Generates and returns the int [id] of the child [Building]
  ///   object, or [null] if [this] is not the parent of a [Building]
  int getBuilding() {
    //TODO: Implement getBuilding in Facility
    int people = 0;
    return people;
  }

  /// Returns the [int] id of the child [Room] of [this].
  ///
  /// When called on [this], it returns the [int] id of the child [Room]
  ///   object, or [null] if [this] is not the parent of a [Room]
  int getRoom() {
    //TODO: Implement getRoom in Facility
    int people = 0;
    return people;
  }

  /// Returns a list of [Facility] ids which are children of [this].
  ///
  /// Generates a [List<int>] of child ids from [Facility_Rollup] where parent id
  ///   references [this], or an empty [List<int>] if no children exist.
  List<int> getChildFacilities() {
    //TODO: Implement getChildFacilities in Facility
    List<int> people = new List<int>();
    return people;
  }

  /// Returns a list of [Facility] ids which are parents of [this].
  ///
  /// Generates a [List<int>] of parent ids from [Facility_Rollup] where child id
  ///   references [this], or an empty [List<int>] if no parents exist.
  List<int> getParentFacilities() {
    //TODO: Implement getParentFacilities in Facility
    List<int> people = new List<int>();
    return people;
  }

  /// Adds another [Facility] as a child of [this].
  ///
  /// Takes an [int] id of another Facility, and creates a [Facility_Rollup] association
  ///   record, with [this] as parent_id, and [id] as child_id. Returns no value.
  void addChildFacility (int id){
    //TODO: Implement addChildFacility in Facility
  }

  /// Adds another [Facility] as a parent of [this].
  ///
  /// Takes an [int] id of another Facility, and creates a [Facility_Rollup] association
  ///   record, with [id] as parent_id, and [this] as child_id. Returns no value.
  void addParentFacility (int id){
    //TODO: Implement addParentFacility in Facility
  }

  /// Returns a list of [Organization] ids which are associated with [this].
  ///
  /// Generates a [List<int>] of [Organization] ids from [Organization_Facility_Association] where
  ///   facility_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getOrganizations() {
    //TODO: Implement getOrganizations in Facility
    List<int> people = new List<int>();
    return people;
  }

  /// Adds an association between an [Organization] and [this] in the database.
  ///
  /// Takes an [int] id for an [Organization], and creates an [Organization_Facility_Association]
  ///   record referencing [this] and the given [Organization]. Returns no value.
  void addOrganization (int id){
    //TODO: Implement addOrganization in Facility
  }

  /// Deletes all associations between an [Organization] and [this] from the database.
  ///
  /// Takes an [int] id for an [Organization], and removes all [Organization_Facility_Association]
  ///   records referencing [this] and the given [Organization]. Returns no value.
  void removeOrganization (int id){
    //TODO: Implement removeOrganization in Facility
  }

  /// Returns a [List<int>] of [CommunicationMechanism] objects associated with [this].
  ///
  /// Generates a [List<int>] of [CommunicationMechanism] ids from
  ///   [Facility_Communication_Association] where facility_id references [this],
  ///   or an empty [List<int>] if no associations exist.
  List<int> getCommunicationMechanisms() {
    //TODO: Implement getCommunicationMechanisms in Facility
    List<int> people = new List<int>();
    return people;
  }

  /// Adds an association between a [CommunicationMechanism] and [this] in the database.
  ///
  /// Takes an [int] id for a [CommunicationMechanism], and creates a
  ///   [Facility_Communication_Association] record referencing [this] and the given
  ///   [CommunicationMechanism]. Returns no value.
  void addCommunicationMechanism (int id){
    //TODO: Implement addCommunicationMechanism in Facility
  }

  /// Deletes all associations between a [CommunicationMechanism] and [this] from the database.
  ///
  /// Takes an [int] id for a [CommunicationMechanism], and removes all
  ///   [Facility_Communication_Association] records referencing [this] and the given
  ///   [CommunicationMechanism]. Returns no value.
  void removeCommunicationMechanism (int id){
    //TODO: Implement removeCommunicationMechanism in Facility
  }
}