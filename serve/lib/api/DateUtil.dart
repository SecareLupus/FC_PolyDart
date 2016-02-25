class DateUtil {
  static DateTime get today {
    return cullTime(new DateTime.now());
  }

  static DateTime cullTime(DateTime fullDT) {
    return new DateTime(fullDT.year, fullDT.month, fullDT.day);
  }

  static DateTime parseText(String text) {
    return DateTime.parse(text);
  }

  static String tokenize(DateTime dt) {
    if (dt != null) return dt.toIso8601String();
    return null;
  }
}
