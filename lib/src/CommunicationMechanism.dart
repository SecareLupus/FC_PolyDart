
class CommunicationMechanism{
  int _id;
  
  int getid();
  List<Party> getPartyAssociations();
  void addPartyAssociation();
  void endPartyAssociation();
  List<Facility> getFacilityAssociation();
  void addFacilityAssociation();
  void endFacilityAssociation();
}

class Address extends CommunicationMechanism{
  int _id;
  
  int getid();
  String getAddress();
  List<String> getFullAddress();
}
class Email_Address extends CommunicationMechanism{
  int _id;
  
  int getid();
  String getEMail();
}
class Phone_Number extends CommunicationMechanism{
  int _id;
  
  int getid();
  String getPhoneNumber();
}