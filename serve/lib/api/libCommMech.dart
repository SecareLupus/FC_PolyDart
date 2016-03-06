import "dart:async";
import "dbObject.dart";
import "DateUtil.dart";

class libCommMech {
  /*
   *  CREATE
   */

  static Future<Email_Address> createEmailMechanism([String addr = ""]) {
    Dev.message("Entering libCommMech.createEmailMechanism()");

    Communication_Mechanism mcnsm = new Communication_Mechanism();
    return db.avo.create(mcnsm).then((mcnsmPK) {
      Dev.message("Communication_Mechanism created, ID $mcnsmPK");
      Email_Address email = new Email_Address()
        ..Communication_Mechanism_id = mcnsmPK
        ..email = addr;
      return db.avo.create(email).then((emailPK) {
        Dev.message("Email_Address created, ID $emailPK");
        return getEmail(emailPK);
      });
    });
  }

  static Future<Address> createAddressMechanism(
      {String street: "",
      String street2: "",
      String city: "",
      String state: "",
      String zip: ""}) {
    Dev.message("Entering libCommMech.createAddressMechanism()");

    Communication_Mechanism mcnsm = new Communication_Mechanism();
    return db.avo.create(mcnsm).then((mcnsmPK) {
      Dev.message("Communication_Mechanism created, ID $mcnsmPK");
      Address address = new Address()
        ..Communication_Mechanism_id = mcnsmPK
        ..street_address = street
        ..street_address_2 = street2
        ..city = city
        ..state = state
        ..zip = zip;
      return db.avo.create(address).then((addressPK) {
        Dev.message("Address created, ID $addressPK");
        return getAddress(addressPK);
      });
    });
  }

  static Future<Phone_Number> createPhoneMechanism(
      {String number: "", String name: ""}) {
    Dev.message("Entering libCommMech.createPhoneMechanism()");

    Communication_Mechanism mcnsm = new Communication_Mechanism();
    return db.avo.create(mcnsm).then((mcnsmPK) {
      Dev.message("Communication_Mechanism created, ID $mcnsmPK");
      Phone_Number phone = new Phone_Number()
        ..Communication_Mechanism_id = mcnsmPK
        ..phone_name = name
        ..phone_number = number;
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
    Dev.message("Entering libCommMech.getEmail()");
    Dev.message("ID: $id");

    return db.avo.readById(Email_Address, id);
  }

  static Future<Phone_Number> getPhone(int id) {
    Dev.message("Entering libCommMech.getPhone()");
    Dev.message("ID: $id");

    return db.avo.readById(Phone_Number, id);
  }

  static Future<Address> getAddress(int id) {
    Dev.message("Entering libCommMech.getAddress()");
    Dev.message("ID: $id");

    return db.avo.readById(Address, id);
  }

  static Future<List<Email_Address>> getEmails({filters: null}) {
    Dev.message("Entering libCommMech.getEmails()");
    Dev.message("Filters: " + filters.toString());

    if (filters == null) {
      Dev.message("Returning all emails");
      return db.avo.read(Email_Address);
    }
    Dev.message("Returning emails matching filters");
    return db.avo.read(Email_Address, filters: filters);
  }

  static Future<List<Phone_Number>> getPhones({filters: null}) {
    Dev.message("Entering libCommMech.getPhones()");
    Dev.message("Filters: " + filters.toString());

    if (filters == null) {
      Dev.message("Returning all phones");
      return db.avo.read(Phone_Number);
    }
    Dev.message("Returning phones matching filters");
    return db.avo.read(Phone_Number, filters: filters);
  }

  static Future<List<Address>> getAddresses({filters: null}) {
    Dev.message("Entering libCommMech.getAddresses()");
    Dev.message("Filters: " + filters.toString());

    if (filters == null) {
      Dev.message("Returning all addresses");
      return db.avo.read(Address);
    }
    Dev.message("Returning addresses matching filters");
    return db.avo.read(Address, filters: filters);
  }
/* I think this is the best place for this shipments function, but I need to look at
 * it in more depth later.
  //direction has three allowed options, "to", "from", and "both".
  static Future<List<Shipment>> getShipments(int addr_id,
      [String direction = 'both']) {
    Dev.message("Entering libCommMech.getShipments()");
    Dev.message("direction: $direction");

    if (direction == 'both') {
      Dev.message("Returning all shipments for Communication Mechanism #$addr_id");
      var filters = [new Filter('', '')];
      return db.avo.read(Shipment);
    }
    Dev.message("Returning addresses matching filters");
    return db.avo.read(Address, filters: filters);
  }
*/

  /*
   *  UPDATE
   */

  static Future<bool> setEmail(int id, String newEmail) {
    Dev.message("Entering libCommMech.setEmail()");
    Dev.message("New Email: $newEmail");

    var filters = [new Filter('Communication_Mechanism_id', id)];

    return db.avo.read(Email_Address, filters: filters).then(
        (List<Email_Address> e) {
      e.first.email = newEmail;
      e.first.update();
      Dev.message("Successfully changed email for Mechanism #$id");
      return true;
    }, onError: (e) {
      print("Error setting email address E($e)");
    });
  }

  static Future<bool> setPhoneName(int id, String newName) {
    Dev.message("Entering libCommMech.setPhoneName()");
    Dev.message("New Name: $newName");

    var filters = [new Filter('Communication_Mechanism_id', id)];

    return db.avo.read(Phone_Number, filters: filters).then(
        (List<Phone_Number> e) {
      e.first.phone_name = newName;
      e.first.update();
      Dev.message("Successfully changed phone_name for Mechanism #$id");
      return true;
    }, onError: (e) {
      print("Error setting phone name E($e)");
    });
  }

  static Future<bool> setPhoneNumber(int id, String newNumber) {
    Dev.message("Entering libCommMech.setPhoneNumber()");
    Dev.message("New Number: $newNumber");

    var filters = [new Filter('Communication_Mechanism_id', id)];

    return db.avo.read(Phone_Number, filters: filters).then(
        (List<Phone_Number> e) {
      e.first.phone_number = newNumber;
      e.first.update();
      Dev.message("Successfully changed phone_number for Mechanism #$id");
      return true;
    }, onError: (e) {
      print("Error setting phone number E($e)");
    });
  }

  static Future<bool> setAddress(int id, String newAddress,
      [String newAddress2 = null]) {
    Dev.message("Entering libCommMech.setAddress()");
    Dev.message("New Address: $newAddress");
    Dev.message("New Address2: $newAddress2");

    var filters = [new Filter('Communication_Mechanism_id', id)];

    return db.avo.read(Address, filters: filters).then((List<Address> e) {
      e.first.street_address = newAddress;
      if (newAddress2 != null) {
        e.first.street_address_2 = newAddress2;
      }
      e.first.update();
      Dev.message("Successfully changed address for Mechanism #$id");
      return true;
    }, onError: (e) {
      print("Error setting address E($e)");
    });
  }

  static Future<bool> setAddress2(int id, String newAddress) {
    Dev.message("Entering libCommMech.setAddress2()");
    Dev.message("New Address2: $newAddress");

    var filters = [new Filter('Communication_Mechanism_id', id)];

    return db.avo.read(Address, filters: filters).then((List<Address> e) {
      e.first.street_address_2 = newAddress;
      e.first.update();
      Dev.message("Successfully changed address2 for Mechanism #$id");
      return true;
    }, onError: (e) {
      print("Error setting address2 E($e)");
    });
  }

  static Future<bool> setCity(int id, String newCity) {
    Dev.message("Entering libCommMech.setCity()");
    Dev.message("New City: $newCity");

    var filters = [new Filter('Communication_Mechanism_id', id)];

    return db.avo.read(Address, filters: filters).then((List<Address> e) {
      e.first.city = newCity;
      e.first.update();
      Dev.message("Successfully changed city for Mechanism #$id");
      return true;
    }, onError: (e) {
      print("Error setting city E($e)");
    });
  }

  static Future<bool> setState(int id, String newState) {
    Dev.message("Entering libCommMech.setState()");
    Dev.message("New State: $newState");

    var filters = [new Filter('Communication_Mechanism_id', id)];

    return db.avo.read(Address, filters: filters).then((List<Address> e) {
      e.first.state = newState;
      e.first.update();
      Dev.message("Successfully changed state for Mechanism #$id");
      return true;
    }, onError: (e) {
      print("Error setting state E($e)");
    });
  }

  static Future<bool> setZip(int id, String newZip) {
    Dev.message("Entering libCommMech.setZip()");
    Dev.message("New Zip Code: $newZip");

    var filters = [new Filter('Communication_Mechanism_id', id)];

    return db.avo.read(Address, filters: filters).then((List<Address> e) {
      e.first.zip = newZip;
      e.first.update();
      Dev.message("Successfully changed zip for Mechanism #$id");
      return true;
    }, onError: (e) {
      print("Error setting zip E($e)");
    });
  }

  /*
   *  DELETE
   */

  static Future<bool> dropEmail(int id, [bool mech_also = true]) async {
    int mech_id = null;

    if (mech_also) {
      await db.avo.readById(Email_Address, id).then((Email_Address e) {
        mech_id = e.Communication_Mechanism_id;
      });
    }
    await db.avo.deleteById(Email_Address, id);
    if (mech_also) {
      await db.avo.deleteById(Communication_Mechanism, mech_id);
    }
    return true;
  }

  static Future<bool> dropPhone(int id, [bool mech_also = true]) async {
    int mech_id = null;

    if (mech_also) {
      await db.avo.readById(Phone_Number, id).then((Phone_Number e) {
        mech_id = e.Communication_Mechanism_id;
      });
    }
    await db.avo.deleteById(Phone_Number, id);
    if (mech_also) {
      await db.avo.deleteById(Communication_Mechanism, mech_id);
    }
    return true;
  }

  static Future<bool> dropAddress(int id, [bool mech_also = true]) async {
    int mech_id = null;

    if (mech_also) {
      await db.avo.readById(Address, id).then((Address e) {
        mech_id = e.Communication_Mechanism_id;
      });
    }
    await db.avo.deleteById(Address, id);
    if (mech_also) {
      await db.avo.deleteById(Communication_Mechanism, mech_id);
    }
    return true;
  }
}
