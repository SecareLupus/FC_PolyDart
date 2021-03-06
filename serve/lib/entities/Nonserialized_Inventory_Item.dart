/// Nonserialized_Inventory_Item.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Nonserialized_Inventory_Item
/// This is an autogenerated class mapping the MySQL Table Nonserialized_Inventory_Item to an AvacadORM Entity.

/// Subclass of Inventory_Item, representing Products which are only identified in bulk. Quantity on hand is tracked for these items.
@Table('Nonserialized_Inventory_Item')
class Nonserialized_Inventory_Item extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Inventory_Item_id')
	int Inventory_Item_id;
	@Column('quantity_on_hand')
	int quantity_on_hand;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Inventory_Item_id')
	Inventory_Item inventory_item;
}