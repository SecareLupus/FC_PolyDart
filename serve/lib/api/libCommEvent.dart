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

    if (status_type_string != null) {
      _createStatusType(status_type_string)
          .then((Communication_Event_Status_Type t) {
        status_type_id = t.id;
      });
    }

    if (mechanism_type_string != null) {
      _createMechanismType(mechanism_type_string)
          .then((Communication_Mechanism_Type t) {
        mechanism_type_id = t.id;
      });
    }

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

  static Future<Communication_Mechanism_Type> _createMechanismType(
      String description) {
    return db.avo.read(Communication_Mechanism_Type,
            filters: [new Filter('description', description)])
        .then((List<Communication_Mechanism_Type> c) {
      if (c.length == 0) {
        Communication_Mechanism_Type newTyp = new Communication_Mechanism_Type()
          ..description = description;
        return db.avo.create(newTyp).then((pk) {
          return db.avo.readById(Communication_Mechanism_Type, pk);
        });
      }
      return c.first;
    });
  }

  static Future<Communication_Event_Status_Type> _createStatusType(
      String description) {
    return db.avo.read(Communication_Event_Status_Type,
            filters: [new Filter('description', description)])
        .then((List<Communication_Event_Status_Type> c) {
      if (c.length == 0) {
        Communication_Event_Status_Type newTyp =
            new Communication_Event_Status_Type()..description = description;
        return db.avo.create(newTyp).then((pk) {
          return db.avo.readById(Communication_Event_Status_Type, pk);
        });
      }
      return c.first;
    });
  }

  static Future<Communication_Event_Purpose_Type> _createPurposeType(
      String description) {
    return db.avo.read(Communication_Event_Purpose_Type,
            filters: [new Filter('description', description)])
        .then((List<Communication_Event_Purpose_Type> c) {
      if (c.length == 0) {
        Communication_Event_Purpose_Type newTyp =
            new Communication_Event_Purpose_Type()..description = description;
        return db.avo.create(newTyp);
      }
      return c.first;
    });
  }

  static Future<Communication_Event_Role_Type> _createRoleType(
      String description) {
    return db.avo.read(Communication_Event_Role_Type,
            filters: [new Filter('description', description)])
        .then((List<Communication_Event_Role_Type> c) {
      if (c.length == 0) {
        Communication_Event_Role_Type newTyp =
            new Communication_Event_Role_Type()..description = description;
        return db.avo.create(newTyp);
      }
      return c.first;
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
   * - set mechanism type by string, optionally create if necessary
   * - set status type by id
   * - set status type by string, optionally create if necessary
   * - add purpose type by id
   * - add purpose type by string, optionally create if necessary
   * - remove purpose type by id
   * - remove purpose type by string
   * - add role type by id
   * - add role type by string, optionally create if necessary
   * - remove role type by id
   * - remove role type by string
   * X set startdate
   * X set enddate
   * X set note
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

  static Future<bool> setMechanismType(int eve_id, int newMechTyp,
      {String byString: null}) {
    if (byString != null) {
      _createMechanismType(byString).then((Communication_Mechanism_Type t) {
        newMechTyp = t.id;
      });
    }

    return db.avo
        .readById(Communication_Event, eve_id)
        .then((Communication_Event event) {
      event.Communication_Mechanism_Type_id = newMechTyp;
      return event.update().then((v) => true).catchError((e) {
        print("Error ($e)");
      });
    });
  }

  static Future<bool> setStatusType(int eve_id, int newStatTyp,
      {String byString: null}) {
    if (byString != null) {
      _createStatusType(byString).then((Communication_Event_Status_Type t) {
        newStatTyp = t.id;
      });
    }

    return db.avo
        .readById(Communication_Event, eve_id)
        .then((Communication_Event event) {
      event.Communication_Event_Status_Type_id = newStatTyp;
      return event.update().then((v) => true).catchError((e) {
        print("Error ($e)");
      });
    });
  }

  static Future<bool> addPurposeType(int eve_id, int newPurpTyp,
      {String byString: null, comments: null}) {
    if (byString != null) {
      _createPurposeType(byString).then((Communication_Event_Purpose_Type t) {
        newPurpTyp = t.id;
      });
    }

    Communication_Event_Purpose p = new Communication_Event_Purpose()
      ..Communication_Event_id = eve_id
      ..Communication_Event_Purpose_Type_id = newPurpTyp
      ..comment = comments;
    return db.avo.create(p).then((pkVal) {
      return true;
    });
  }

  static Future<bool> removePurposeType(int eve_id, int purpTypID,
      {String byString: null}) {
    if (byString != null) {
      _createPurposeType(byString).then((Communication_Event_Purpose_Type t) {
        purpTypID = t.id;
      });
    }

    List<Filter> filters = [
      new Filter('Communication_Event_id', eve_id),
      new Filter('Communication_Event_Purpose_Type_id', purpTypID)
    ];
    return db.avo
        .read(Communication_Event_Purpose, filters: filters)
        .then((List<Communication_Event_Purpose> p) {
      p.forEach((subP) {
        db.avo.deleteById(Communication_Event_Purpose, subP.id);
      });
      return true;
    });
  }

  static Future<bool> addRoleType(int eve_id, int newRoleTyp,
      {String byString: null}) {
    if (byString != null) {
      _createRoleType(byString).then((Communication_Event_Role_Type t) {
        newRoleTyp = t.id;
      });
    }

    Communication_Event_Role r = new Communication_Event_Role()
      ..Communication_Event_id = eve_id
      ..Communication_Event_Role_Type_id = newRoleTyp;
    return db.avo.create(r).then((pkVal) {
      return true;
    });
  }

  static Future<bool> removeRoleType(int eve_id, int roleTypID,
      {String byString: null}) {
    if (byString != null) {
      _createRoleType(byString).then((Communication_Event_Role_Type t) {
        roleTypID = t.id;
      });
    }

    List<Filter> filters = [
      new Filter('Communication_Event_id', eve_id),
      new Filter('Communication_Event_Role_Type_id', roleTypID)
    ];
    return db.avo
        .read(Communication_Event_Role, filters: filters)
        .then((List<Communication_Event_Role> r) {
      r.forEach((subR) {
        db.avo.deleteById(Communication_Event_Role, subR.id);
      });
      return true;
    });
  }

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
