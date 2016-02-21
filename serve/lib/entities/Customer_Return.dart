/// Customer_Return.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Customer_Return
/// This is an autogenerated class mapping the MySQL Table Customer_Return to an AvacadORM Entity.

/// Subclass of Incoming_Shipment, representing returns of goods from customers to the business.
@Table('Customer_Return')
class Customer_Return extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Incoming_Shipment_id')
	int Incoming_Shipment_id;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Incoming_Shipment_id')
	Incoming_Shipment incoming_shipment;
}