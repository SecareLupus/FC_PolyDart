/// Surcharge_Component.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Surcharge_Component
/// This is an autogenerated class mapping the MySQL Table Surcharge_Component to an AvacadORM Entity.

/// Subclass of Price_Component, this represents a surcharge that may modify the base price of a Product. This may be restricted by any of the _Dependency tables, to selective apply the surcharge.
@Table('Surcharge_Component')
class Surcharge_Component extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Price_Component_id')
	int Price_Component_id;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Price_Component_id')
	Price_Component price_component;
}