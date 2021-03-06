/// Person.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Person
/// This is an autogenerated class mapping the MySQL Table Person to an AvacadORM Entity.

/// Person entity, of the type Party. Indicates that this party is a single person.
@Table('Person')
class Person extends Party {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Party_id')
	int Party_id;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Party_id')
	Party party;
	@Column.OneToManyForeignKey('Person_id')
	List<Organization_Person_Association> organization_person_associations;
	@Column.OneToManyForeignKey('Person_id')
	List<Person_Name> person_names;
	@Column.OneToManyForeignKey('Person_id')
	List<Gender_Association> gender_associations;
}
