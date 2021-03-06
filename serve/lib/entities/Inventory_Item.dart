/// Inventory_Item.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Inventory_Item
/// This is an autogenerated class mapping the MySQL Table Inventory_Item to an AvacadORM Entity.

/// This entity represents the physical occurence of a good, which can be tracked, counted, and sold.

/// TODO: Add connection to Facility to indicate when inventory is stored in a particular place.
@Table('Inventory_Item')
class Inventory_Item extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Good_id')
	int Good_id;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Good_id')
	Good good;
	@Column.OneToManyForeignKey('Inventory_Item_id')
	List<Serialized_Inventory_Item> serialized_inventory_items;
	@Column.OneToManyForeignKey('Inventory_Item_id')
	List<Nonserialized_Inventory_Item> nonserialized_inventory_items;
	@Column.OneToManyForeignKey('Inventory_Item_id')
	List<Inventory_Variance> inventory_variances;
	@Column.OneToManyForeignKey('Inventory_Item_id')
	List<Shipment_Receipt> shipment_receipts;
	@Column.OneToManyForeignKey('Inventory_Item_id')
	List<Item_Issuance> item_issuances;
	@Column.OneToManyForeignKey('Inventory_Item_id')
	List<Picklist_Item> picklist_items;
}
