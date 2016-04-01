import "dart:async";
import "dbObject.dart";
import "DateUtil.dart";

export "dbObject.dart";

class libRelationship {
  /*
   * CREATE
   * - createRelationship
   * - addNote
   */

  static Future<Party_Relationship> createRelationship(
      int party1_id, int party2_id,
      {DateTime from: null, DateTime thru: null, String comment: ""}) {
    from ??= DateUtil.today;

    Dev.message("Entering createRelationship()");
    Dev.message("ID_1: $party1_id");
    Dev.message("ID_2: $party2_id");
    Dev.message("Date_From: $from");
    Dev.message("Date_Thru: $thru");
    Dev.message("Comment: $comment");

    Party_Relationship rel = new Party_Relationship();
    rel
      ..Party_id_1 = party1_id
      ..Party_id_2 = party2_id
      ..from_date = DateUtil.tokenize(from)
      ..thru_date = DateUtil.tokenize(thru)
      ..comment = comment;

    return db.avo.create(rel).then((relPK) {
      Dev.message("Party_Relationship created, ID $relPK");
      return getRelationship(relPK);
    });
  }

  static Future<Relationship_Note> addNote(int id, String note,
      {DateTime timestamp: null}) {
    timestamp ??= DateTime.now();

    Dev.message("Entering libRelationship.addNote()");
    Dev.message("ID: $id");
    Dev.message("Note: $note");
    Dev.message("Timestamp: $timestamp");

    Relationship_Note newNote = new Relationship_Note();
    newNote
      ..Party_Relationship_id = id
      ..note = note
      ..timestamp = DateUtil.tokenize(timestamp);
    return db.avo.create(newNote).then((notePK) {
      Dev.message("Relationship_note created, ID $notePK");
      return db.avo.readById(Relationship_Note, notePK);
    });
  }

  /*
   * READ
   * - getRelationship
   * - getRelationships
   * - getParties
   * - getNotes
   */

  static Future<Party_Relationship> getRelationship(int id) {
    Dev.message("Entering libRelationship.getRelationship()");
    Dev.message("ID: $id");

    return db.avo.readById(Party_Relationship, id);
  }

  static Future<List<Party_Relationship>> getRelationships({filters: null}) {
    Dev.message("Entering libRelationship.getRelationships()");
    Dev.message("Filters: " + filters.toString());

    if (filters == null) {
      Dev.message("Returning all Relationships");
      return db.avo.read(Party_Relationship);
    }
    Dev.message("Returning relationships matching filters");
    return db.avo.read(Party_Relationship, filters: filters);
  }

  static Future<List<Party>> getParties(int id) {
    return getRelationship(id).then((tar) {
      return [tar.party_1, tar.party_2];
    });
  }

  static Future<List<Relationship_Note>> getNotes(int id) {
    return db.avo
        .readById(Party_Relationship, id)
        .then((Party_Relationship rel) {
      return rel.relationship_notes;
    });
  }

  /*
   * UPDATE
   * - setParty(which = (1 || 2))
   * - setNote()
   */

  static Future<bool> setParty(int rel_id, int which, int party_id) {
    return db.avo
        .readById(Party_Relationship, rel_id)
        .then((Party_Relationship r) {
      if (which == 1) {
        r.Party_id_1 = party_id;
      } else if (which == 2) {
        r.Party_id_2 = party_id;
      }
      return r.update().then((v) => true).catchError((e) {
        print("Error E($e)");
      });
    });
  }

  static Future<bool> setNote(int note_id, String newNote) {
    return db.avo
        .readById(Relationship_Note, note_id)
        .then((Relationship_Note n) {
      n.note = newNote;
      return n.update().then((v) => true).catchError((e) {
        print("Error ($e)");
      });
    });
  }

  static Future<bool> setNoteTS(int note_id, {DateTime timestamp: null}) {
    timestamp ??= new DateTime.now();

    return db.avo
        .readById(Relationship_Note, note_id)
        .then((Relationship_Note n) {
      n.timestamp = DateUtil.tokenize(timestamp);
      return n.update().then((v) => true).catchError((e) {
        print("Error ($e)");
      });
    });
  }

  /*
   * DELETE
   * - dropRelationship()
   * - dropNote()
   */

  static Future<bool> dropRelationship(int id) {
    return db.avo.deleteById(Party_Relationship, id).then((v) => true);
  }

  static Future<bool> dropNote(int id) {
    return db.avo.deleteById(Relationship_Note, id).then((v) => true);
  }
}
