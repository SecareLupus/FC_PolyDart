import "dart:async";
import "dbObject.dart";
import "DateUtil.dart";

export "dbObject.dart";

class libFacility {
  /*
   * CREATE
   * - Create building
   * - Create room in building
   * - Create Organization Association
   * - Create Communication Mechanism Association
   */

  /*
   * READ
   * - Find an existing Facilty of a given ID
   * - Find all facilities meeting a given criterea
   * - Find Organization Associations referencing a given Facility
   * - Find Communication Mechanism Associations referencing a given Facility
   * - Find detailed information of a given Facility (multipart)
   */

  /*
   * UPDATE
   * - Alter dates for a given Organization Association
   * - Alter dates for a given Communication Mechanism Association
   * - Terminate an Organization Association
   * - Terminate a Communication Mechanism Association
   * - Set the name of a given Facility
   */

  /*
   * DELETE
   * - Delete a given Building
   * - Delete a given Room
   * - Delete an Organization Association
   * - Delete a Communication Mechanism Association
   */
}
