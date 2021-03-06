/// Event_Party_Association.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Event_Party_Association
/// This is an autogenerated class mapping the MySQL Table Event_Party_Association to an AvacadORM Entity.

/// Associates a party with an event in some role defined by Event_Party_Association_Role.
@Table('Event_Party_Association')
class Event_Party_Association extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Party_id')
	int Party_id;
	@Column('Event_id')
	int Event_id;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Party_id')
	Party party;
	@Column.ManyToOneForeignKey('Event_id')
	Event event;
	@Column.OneToManyForeignKey('Event_Party_Association_id')
	List<Event_Party_Association_Role> event_party_association_roles;
}