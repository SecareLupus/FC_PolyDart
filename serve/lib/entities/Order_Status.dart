/// Order_Status.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Order_Status
/// This is an autogenerated class mapping the MySQL Table Order_Status to an AvacadORM Entity.

/// Stores status updates for orders, accepting either an Order or Order_Item as the target, but not both. The description for the statuses exist in Order_Status_Type.
@Table('Order_Status')
class Order_Status extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Order_id')
	int Order_id;
	@Column('Order_Item_id')
	int Order_Item_id;
	@Column('Order_Status_Type_id')
	int Order_Status_Type_id;
	@Column('status_datetime')
	DateTime status_datetime;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Order_Item_id')
	Order_Item order_item;
	@Column.ManyToOneForeignKey('Order_id')
	Order order;
	@Column.ManyToOneForeignKey('Order_Status_Type_id')
	Order_Status_Type order_status_type;
}