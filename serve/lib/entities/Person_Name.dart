/// Person_Name.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Person_Name
/// This is an autogenerated class mapping the MySQL Table Person_Name to an AvacadORM Entity.

/// A list of people's names, and the dates those names are relevant. This table allows records for Person entities that change names during their business with us.
@Table('Person_Name')
class Person_Name extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Person_id')
	int Person_id;
	@Column('name')
	String name;
	@Column('from_date')
	String from_date;
	@Column('thru_date')
	String thru_date;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Person_id')
	Person person;
}
