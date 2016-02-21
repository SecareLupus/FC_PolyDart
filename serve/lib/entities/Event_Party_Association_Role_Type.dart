/// Event_Party_Association_Role_Type.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Event_Party_Association_Role_Type
/// This is an autogenerated class mapping the MySQL Table Event_Party_Association_Role_Type to an AvacadORM Entity.

/// List of Roles that might be associated with an Event-Party relationship.
@Table('Event_Party_Association_Role_Type')
class Event_Party_Association_Role_Type extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('description')
	String description;

	// ***Table Foreign Key Entities***
	@Column.OneToManyForeignKey('Event_Party_Association_Role_Type_id')
	List<Event_Party_Association_Role> event_party_association_roles;
}