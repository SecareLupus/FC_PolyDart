
import "apiObject.dart";

abstract class ObjectCache<T> {
  List<T> _cache = new List<T>();

  bool addToCache(T addendum) {
    if (addendum is apiObject) {
      if (!_cache.contains(addendum))
        _cache.add(addendum);
    } else {
      throw new AbstractClassInstantiationError("Addendum to list is not of type ${T}");
    }
  }
  apiObject getFromCache(int index) {
    for (apiObject i in _cache) {
      if (i.getid() == index) {
        _cache.remove(i);
        return i;
      }
    }
    return null;
  }
}