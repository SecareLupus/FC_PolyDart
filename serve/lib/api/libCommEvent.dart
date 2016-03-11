import "dart:async";
import "dbObject.dart";
import "DateUtil.dart";

class libCommEvent {
  /*
   * CREATE
   * - Create new communicaition_event from a given relationship.
   */

  static Future<Communication_Event> createCommunicationEvent(
      int relationship_id,
      {DateTime from: null,
      DateTime thru: null,
      String note: "",
      int status_type_id: null,
      String status_type_string: "",
      int mechanism_type_id: null,
      String mechanism_type_string: ""}) {
    from ??= new DateTime.now();

    Dev.message("Entering createCommunicationEvent()");
    Dev.message("Relationhsip ID: $relationship_id");
    Dev.message("Date_From: $from");
    Dev.message("Date_Thru: $thru");
    Dev.message("Note: $note");
    Dev.message("Status Type #$status_type_id, \"$status_type_string\"");
    Dev.message(
        "Mechanism Type #$mechanism_type_id, \"$mechanism_type_string\"");

    //if status_type_string or mechanism_type_string are set, search the
    //  correlated table for the string. create a new type if you need to
    //  set status_type_id to either the id of the status type you found, or
    //  the statuts_type you created. The process is repeated for
    //  mechanism_type_id.

    Communication_Event commeve = new Communication_Event()
      ..Party_Relationship_id = relationship_id
      ..datetime_start = DateUtil.tokenize(from)
      ..datetime_end = DateUtil.tokenize(thru)
      ..note = note
      ..Communication_Event_Status_Type_id = status_type_id
      ..Communication_Mechanism_Type_id = mechanism_type_id;

    return db.avo.create(commeve).then((cePK) {
      Dev.message("Communication_Event created, ID $cePK");
      return getCommunicationEvent(cePK);
    });
  }

  /*
   * READ
   * - Get list of Communication_Mechanism_Type objects
   * - Get list of Communication_Event_Status_Type objects
   * - Get list of Communication_Event_Purpose_Type objects
   * - Get list of Communication_Event_Purpose objects by Communication_Event
   */

  static Future<Communication_Event> getCommunicationEvent(int id) {
    Dev.message("Entering libCommEvent.getCommunicationEvent()");
    Dev.message("ID: $id");

    return db.avo.readById(Communication_Event, id);
  }

  static Future<List<Communication_Event>> getCommunicationEvents(
      {filters: null}) {
    Dev.message("Entering libCommEvent.getCommunicationEvents()");
    Dev.message("Filters: " + filters.toString());

    if (filters == null) {
      Dev.message("Returning all Communication_Events");
      return db.avo.read(Communication_Event);
    }
    Dev.message("Returning Communication_Events matching filters");
    return db.avo.read(Communication_Event, filters: filters);
  }

  static Future<Communication_Mechanism_Type> getMechanismType(int id) {
    return getCommunicationEvent(id).then((Communication_Event eve) {
      return eve.communication_mechanism_type;
    });
  }

  static Future<List<Communication_Mechanism_Type>> getMechanismTypes(
      {filters: null}) {
    if (filters == null) return db.avo.read(Communication_Mechanism_Type);
    return db.avo.read(Communication_Mechanism_Type, filters: filters);
  }

  static Future<Communication_Event_Status_Type> getStatusType(int id) {
    return getCommunicationEvent(id).then((Communication_Event eve) {
      return eve.communication_event_status_type;
    });
  }

  static Future<List<Communication_Event_Status_Type>> getStatusTypes(
      {filters: null}) {
    if (filters == null) return db.avo.read(Communication_Event_Status_Type);
    return db.avo.read(Communication_Event_Status_Type, filters: filters);
  }

  static Future<List<Communication_Event_Purpose>> getPurposes(int id) {
    return getCommunicationEvent(id).then((Communication_Event eve) {
      return eve.communication_event_purposes;
    });
  }

  static Future<List<Communication_Event_Purpose_Type>> getPurposeTypes(
      {filters: null}) {
    if (filters == null) return db.avo.read(Communication_Event_Purpose_Type);
    return db.avo.read(Communication_Event_Purpose_Type, filters: filters);
  }

  static Future<List<Communication_Event_Role>> getRoles(int id) {
    return getCommunicationEvent(id).then((Communication_Event eve) {
      return eve.communication_event_roles;
    });
  }

  static Future<List<Communication_Event_Role_Type>> getRoleTypes(
      {filters: null}) {
    if (filters == null) return db.avo.read(Communication_Event_Role_Type);
    return db.avo.read(Communication_Event_Role_Type, filters: filters);
  }

  /*
   * UPDATE
   * - change the referenced relationship
   * - set mechanism type by id
   * X set mechanism type by string, optionally create if necessary
   * - set status type by id
   * X set status type by string, optionally create if necessary
   * X add purpose type by id
   * X add purpose type by string, optionally create if necessary
   * X remove purpose type by id
   * X remove purpose type by string
   * X add role type by id
   * X add role type by string, optionally create if necessary
   * X remove role type by id
   * X remove role type by string
   * - set startdate
   * - set enddate
   * - set note
   */

  static Future<bool> setRelationship(int eve_id, int newRel) {
    return db.avo
        .readById(Communication_Event, eve_id)
        .then((Communication_Event event) {
      event.Party_Relationship_id = newRel;
      return event.update().then((v) => true).catchError((e) {
        print("Error ($e)");
      });
    });
  }

  static Future<bool> setMechanismType(int eve_id, int newMechTyp) {
    return db.avo
        .readById(Communication_Event, eve_id)
        .then((Communication_Event event) {
      event.Communication_Mechanism_Type_id = newMechTyp;
      return event.update().then((v) => true).catchError((e) {
        print("Error ($e)");
      });
    });
  }

  //static Future<bool> setMechanismTypeByString(int eve_id, String newMechTyp);

  static Future<bool> setStatusType(int eve_id, int newStatTyp) {
    return db.avo
        .readById(Communication_Event, eve_id)
        .then((Communication_Event event) {
      event.Communication_Event_Status_Type_id = newStatTyp;
      return event.update().then((v) => true).catchError((e) {
        print("Error ($e)");
      });
    });
  }

  //static Future<bool> setStatusTypeByString(int eve_id, String newStatTyp);

  //static Future<bool> addPurpose(int eve_id, int newPurpTyp);
  //static Future<bool> setPurposeByString(int eve_id, String newPurpTyp);

  /*
   * DELETE
   * - drop communication event
   * - drop communication mechanism type
   * - drop communication event status type
   * - drop communication event purpose type
   * - drop communication event role type
   */

  static Future<bool> dropCommunicationEvent(int id) {
    return db.avo.deleteById(Communication_Event, id).then((v) => true);
  }

  static Future<bool> dropMechanismType(int id) {
    return db.avo
        .deleteById(Communication_Mechanism_Type, id)
        .then((v) => true);
  }

  static Future<bool> dropStatusType(int id) {
    return db.avo
        .deleteById(Communication_Event_Status_Type, id)
        .then((v) => true);
  }

  static Future<bool> dropPurposeType(int id) {
    return db.avo
        .deleteById(Communication_Event_Purpose_Type, id)
        .then((v) => true);
  }

  static Future<bool> dropRoleType(int id) {
    return db.avo
        .deleteById(Communication_Event_Role_Type, id)
        .then((v) => true);
  }
}
