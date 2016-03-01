import "dart:async";
import "dbObject.dart";
import "DateUtil.dart";

class libCommunications {
  /*
   *  CREATE
   */

  static Future<Email_Address> createEmailMechanism() {
    Dev.message("Entering libComm.createEmailMechanism()");

    Communication_Mechanism mcnsm = new Communication_Mechanism();
    return db.avo.create(mcnsm).then((mcnsmPK) {
      Dev.message("Communication_Mechanism created, ID $mcnsmPK");
      Email_Address email = new Email_Address()
        ..Communication_Mechanism_id = mcnsmPK;
      return db.avo.create(email).then((emailPK) {
        Dev.message("Email_Address created, ID $emailPK");
        return getEmail(emailPK);
      });
    });
  }

  static Future<Address> createAddressMechanism() {
    Dev.message("Entering libComm.createAddressMechanism()");

    Communication_Mechanism mcnsm = new Communication_Mechanism();
    return db.avo.create(mcnsm).then((mcnsmPK) {
      Dev.message("Communication_Mechanism created, ID $mcnsmPK");
      Address address = new Address()..Communication_Mechanism_id = mcnsmPK;
      return db.avo.create(address).then((addressPK) {
        Dev.message("Address created, ID $addressPK");
        return getAddress(addressPK);
      });
    });
  }

  static Future<Phone_Number> createPhoneMechanism() {
    Dev.message("Entering libComm.createPhoneMechanism()");

    Communication_Mechanism mcnsm = new Communication_Mechanism();
    return db.avo.create(mcnsm).then((mcnsmPK) {
      Dev.message("Communication_Mechanism created, ID $mcnsmPK");
      Phone_Number phone = new Phone_Number()
        ..Communication_Mechanism_id = mcnsmPK;
      return db.avo.create(phone).then((phonePK) {
        Dev.message("Phone_Number created, ID $phonePK");
        return getPhone(phonePK);
      });
    });
  }

  /*
   *  READ
   */

  static Future<Email_Address> getEmail(int id) {
    Dev.message("Entering libComm.getEmail()");
    Dev.message("ID: $id");

    return db.avo.readById(Email_Address, id);
  }

  static Future<Phone_Number> getPhone(int id) {
    Dev.message("Entering libComm.getPhone()");
    Dev.message("ID: $id");

    return db.avo.readById(Phone_Number, id);
  }

  static Future<Address> getAddress(int id) {
    Dev.message("Entering libComm.getAddress()");
    Dev.message("ID: $id");

    return db.avo.readById(Address, id);
  }

  static Future<List<Email_Address>> getEmails({filters: null}) {
    Dev.message("Entering libPer.getEmails()");
    Dev.message("Filters: " + filters.toString());

    if (filters == null) {
      Dev.message("Returning all emails");
      return db.avo.read(Email_Address);
    }
    Dev.message("Returning emails matching filters");
    return db.avo.read(Email_Address, filters: filters);
  }

  static Future<List<Phone_Number>> getPhones({filters: null}) {
    Dev.message("Entering libPer.getPhones()");
    Dev.message("Filters: " + filters.toString());

    if (filters == null) {
      Dev.message("Returning all phones");
      return db.avo.read(Phone_Number);
    }
    Dev.message("Returning phones matching filters");
    return db.avo.read(Phone_Number, filters: filters);
  }

  static Future<List<Address>> getAddresses({filters: null}) {
    Dev.message("Entering libPer.getAddresses()");
    Dev.message("Filters: " + filters.toString());

    if (filters == null) {
      Dev.message("Returning all addresses");
      return db.avo.read(Address);
    }
    Dev.message("Returning addresses matching filters");
    return db.avo.read(Address, filters: filters);
  }

  //direction has three allowed options, "to", "from", and "both".
  static Future<List<Shipment>> getShipments(int id,
      [String direction = 'both']) {}

  /*
   *  UPDATE
   */

  static Future<bool> setEmail(int id, String newEmail) {
    return true;
  }

  static Future<bool> setPhoneName(int id, String newName) {
    return true;
  }

  static Future<bool> setPhoneNumber(int id, String newNumber) {
    return true;
  }

  static Future<bool> setAddress(int id, String newAddress,
      [String newAddress2 = null]) {
    return true;
  }

  static Future<bool> setAddress2(int id, String newAddress) {
    return true;
  }

  static Future<bool> setCity(int id, String newCity) {
    return true;
  }

  static Future<bool> setState(int id, String newState) {
    return true;
  }

  static Future<bool> setZip(int id, String newZip) {
    return true;
  }

  /*
   *  DELETE
   */

  static Future<bool> dropEmail(int id, [bool mech_also = true]) {}
  static Future<bool> dropPhone(int id, [bool mech_also = true]) {}
  static Future<bool> dropAddress(int id, [bool mech_also = true]) {}
}
