/// Order_Status_Type.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Order_Status_Type
/// This is an autogenerated class mapping the MySQL Table Order_Status_Type to an AvacadORM Entity.

/// List of potential statuses to be applied to an Order or Order_Item.
@Table('Order_Status_Type')
class Order_Status_Type extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('description')
	String description;

	// ***Table Foreign Key Entities***
	@Column.OneToManyForeignKey('Order_Status_Type_id')
	List<Order_Status> order_statuss;
}