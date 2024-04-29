import '../entities/person_entity.dart';

abstract class PersonRepository {
  Future<List<PersonEntity>> getPersons();
  Future<PersonEntity> getPerson(int id);
}