/// Order_Item_Role.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Order_Item_Role
/// This is an autogenerated class mapping the MySQL Table Order_Item_Role to an AvacadORM Entity.

/// Links a party to the Order_Item as an arbitrary role, allowing for easy referencing parties involved in individual items from a larger order.
@Table('Order_Item_Role')
class Order_Item_Role extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Party_id')
	int Party_id;
	@Column('Order_Item_id')
	int Order_Item_id;
	@Column('Order_Item_Role_Type_id')
	int Order_Item_Role_Type_id;
	@Column('comment')
	String comment;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Order_Item_Role_Type_id')
	Order_Item_Role_Type order_item_role_type;
	@Column.ManyToOneForeignKey('Order_Item_id')
	Order_Item order_item;
	@Column.ManyToOneForeignKey('Party_id')
	Party party;
}