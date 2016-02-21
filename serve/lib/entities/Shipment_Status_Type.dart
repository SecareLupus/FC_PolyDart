/// Shipment_Status_Type.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Shipment_Status_Type
/// This is an autogenerated class mapping the MySQL Table Shipment_Status_Type to an AvacadORM Entity.

/// List of status types to be linked to by Shipment_Status.
@Table('Shipment_Status_Type')
class Shipment_Status_Type extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('description')
	String description;

	// ***Table Foreign Key Entities***
	@Column.OneToManyForeignKey('Shipment_Status_Type_id')
	List<Shipment_Status> shipment_statuss;
}