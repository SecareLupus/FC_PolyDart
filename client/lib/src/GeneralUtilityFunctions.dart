/// GeneralUtilityFunctions.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective

/// GeneralUtilityFunctions
/// This file has several functions for checking and modifying inputs

import '../../../packages/validator/validator.dart';

bool isAlphanumerical(String alphanum) {
  //TODO test isAlphaNumerical in GeneralUtilityFunctions
  return isAlphanumeric(alphanum);
}

bool isNumerical(String numb) {
  //TODO test isNumerical in GeneralUtilityFunctions
  return isNumeric(numb);
}

bool isAlphabet(String alpha) {
  //TODO test isAlphabet in GeneralUtilityFunctions
  return isAlpha(alpha);
}

bool isDateTime(String date) {
  //TODO test isDateTime in GeneralUtilityFunctions
  return isDate(date);
}

bool isEMail(String address) {
  //TODO test isEMail in GeneralUtilityFunctions
  return isEmail(address);
}

DateTime formatDate(String datetime) {
  //TODO test formatDate in GeneralUtilityFunctions
  return toDate(datetime);
}
String cleanString(String dirty) {
  //TODO implement cleanString in GeneralUtilityFunctions
  return dirty;
}
int daysBetweenDates(DateTime past, DateTime future) {
  //TODO test daysBetweenDates in GeneralUtilityFunctions
  Duration difference = past.difference(future);
  return difference.inDays;
}
bool isDatesEqual(DateTime past, DateTime future) {
  //TODO test isDatesEqual in GeneralUtilityFunctions
  return past.isAtSameMomentAs(future);
}
String getDayOfWeek(int month) {
  //TODO test getDayOfWeek in GeneralUtilityFunctions
  if (month ==1){return 'January';}
  if (month ==2){return 'February';}
  if (month ==3){return 'March';}
  if (month ==4){return 'April';}
  if (month ==5){return 'May';}
  if (month ==6){return 'June';}
  if (month ==7){return 'July';}
  if (month ==8){return 'August';}
  if (month ==9){return 'September';}
  if (month ==10){return 'October';}
  if (month ==11){return 'November';}
  if (month ==12){return 'December';}
  return null;
}
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
String formatPhoneNumber(int number) {
  //TODO implement formatPhoneNumber in GeneralUtilityFunctions
  return toDate(datetime);
}
int getDaysInMonth(String month) {
  //TODO implement getDaysInMonth in GeneralUtilityFunctions
  return toDate(datetime);
}
String formatMoney(num money) {
//TODO implement formatMoney in GeneralUtilityFunctions
  return toDate(datetime);
}