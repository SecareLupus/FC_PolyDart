/// Order_Role.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Order_Role
/// This is an autogenerated class mapping the MySQL Table Order_Role to an AvacadORM Entity.

/// Links a party to the Order as an arbitrary role, allowing for easy referencing parties involved in the entire order.
@Table('Order_Role')
class Order_Role extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Party_id')
	int Party_id;
	@Column('Order_id')
	int Order_id;
	@Column('Order_Role_Type_id')
	int Order_Role_Type_id;
	@Column('percent_contribution')
	
	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Order_id')
	Order order;
	@Column.ManyToOneForeignKey('Order_Role_Type_id')
	Order_Role_Type order_role_type;
	@Column.ManyToOneForeignKey('Party_id')
	Party party;
}