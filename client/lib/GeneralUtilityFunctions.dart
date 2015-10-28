/// GeneralUtilityFunctions.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective

/// GeneralUtilityFunctions
/// This file has several functions for checking and modifying inputs

import '../../../packages/validator/validator.dart';

/// Determines whether a [String] is alphanumeric.
///
/// Takes a [String] and passes it through a function that checks if it is alphanumeric.
/// returns true if and only if [alphanum] is made of only alphabet and number characters.
bool isAlphanumerical(String alphanum) {
  //TODO test isAlphaNumerical in GeneralUtilityFunctions
  return isAlphanumeric(alphanum);
}

/// Determines whether a [String] is numeric.
///
/// Takes a [String] and passes it through a function that checks if it is numeric.
/// returns true if and only if [numb] is made of only number characters.
bool isNumerical(String numb) {
  //TODO test isNumerical in GeneralUtilityFunctions
  return isNumeric(numb);
}

/// Determines whether a [String] is made of alphabet characters.
///
/// Takes a [String] and passes it through a function that checks if it is made of alphabet characters.
/// returns true if and only if [alpha] is made of only alphabet characters.
bool isAlphabet(String alpha) {
  //TODO test isAlphabet in GeneralUtilityFunctions
  return isAlpha(alpha);
}

/// Determines whether a [String] is a DateTime object.
///
/// Takes a [String] and passes it through a function that checks if it is a Date.
/// returns true if and only if [date] is a Date.
bool isDateTime(String date) {
  //TODO test isDateTime in GeneralUtilityFunctions
  return isDate(date);
}

/// Determines whether a [String] is an Email address.
///
/// Takes a [String] and passes it through a function that checks if it is an Email address.
/// returns true if and only if [address] is an Email address.
bool isEmail(String address) {
  //TODO test isEMail in GeneralUtilityFunctions
  return isEmail(address);
}

/// Formats a [String] as a Date.
///
/// Takes a [String] and passes it through a function that checks if it is an Email address.
/// returns true if and only if [address] is an Email address.
DateTime formatDate(String datetime) {
  //TODO test formatDate in GeneralUtilityFunctions
  return toDate(datetime);
}

/// Formats a [String] for safe use in both HTML and SQL.
///
/// Takes a [String] and passes it through a function that makes it safe for use in both HTML and SQL.
/// returns the cleaned [String].
String cleanString(String dirty) {
  //TODO implement cleanString in GeneralUtilityFunctions
  return dirty;
}

/// Returns an [int] representing number of whole days between two [DateTimes].
///
/// Takes two [DateTimes] and creates a [Duration] that is the difference between the two [DateTimes].
/// It then returns the number of days between them as an [int] by using the method 'inDays'.
int daysBetweenDates(DateTime past, DateTime future) {
  //TODO test daysBetweenDates in GeneralUtilityFunctions
  Duration difference = past.difference(future);
  return difference.inDays;
}

/// Determines whether two dates are equal.
///
/// Takes two [DateTimes] and uses the method isAtSameMomentAs on one [DateTime], passing in the other.
/// It then returns true if and onlly if the two [DateTimes] are equal.
bool isDatesEqual(DateTime past, DateTime future) {
  //TODO test isDatesEqual in GeneralUtilityFunctions
  return past.isAtSameMomentAs(future);
}

/// Returns a [String] representing the day of the week, to which the [DateTime] corresponds.
///
/// Takes an [DateTime] and returns the name of the day of the week as a [String].
String getDayOfWeek(DateTime day) {
  //TODO implement getDayOfWeek in GeneralUtilityFunctions
  return "";
}
/// Returns a [String] of the numbers in [alphanum].
///
/// Takes an [String] and scans it for numbers adding the number characters to [numbers] before returning [numbers]
String extractNums(String alphanum) {
  //TODO test extractNums in GeneralUtilityFunctions
  String numbers;
  for (int i =0 ; i <= (alphanum.length) ; i++){
    if (isNumeric(alphanum[i]) ==true){
      numbers = numbers + alphanum[i];
    }
  }
  return numbers;
}
/// Returns a [String] formatted as a telephone number.
///
/// Takes an [int] and formats it as a [String] formatted as a telephone number.
String formatPhoneNumber(int number) {
  //TODO implement formatPhoneNumber in GeneralUtilityFunctions
  return toDate(datetime);
}
/// Returns an [int] representing how many days are in the [month].
///
/// Takes a [String] and Returns an [int] representing how many days are in the [month].
int getDaysInMonth(String month) {
  //TODO implement getDaysInMonth in GeneralUtilityFunctions
  return toDate(datetime);
}
/// Returns a [String] formatted as a dollar amount.
///
/// Takes a [number] and formats it as a [String] formatted as a dollar amount.
String formatMoney(num money) {
//TODO implement formatMoney in GeneralUtilityFunctions
  return toDate(datetime);
}