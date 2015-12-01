/// apiObject.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective

/// apiObject
/// This abstract class is used as a base for different objects that will be leveraged by the API.
///
abstract class apiObject {
  int _id;
  int _parentid;

  /// Returns the int [id] of [this].
  int getid() {
    return this._id;
  }

  Type getType() {
    return this.getType();
  }
}