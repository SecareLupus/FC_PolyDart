library Repository;
part 'OrganizationRepository.dart';
part 'PersonRepository.dart';

class PartyRepository{

Party fetch();
List<Party> fetchall();
List<int> search();
List<int> searchByName();
List<int> searchByDesc();
List<int> searchByRole();
List<int> searchByRelationship();
List<int> searchByShipment();
List<int> searchByCommunicationMechanism();
List<int> searchByCommunicationEvent();
List<int> searchByEvent();
}