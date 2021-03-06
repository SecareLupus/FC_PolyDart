/// Price_Quantity_Dependency.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Price_Quantity_Dependency
/// This is an autogenerated class mapping the MySQL Table Price_Quantity_Dependency to an AvacadORM Entity.

/// Entries in this table restrict a Price_Component to applying only to a particular range of quantities.
@Table('Price_Quantity_Dependency')
class Price_Quantity_Dependency extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Price_Component_id')
	int Price_Component_id;
	@Column('Quantity_Break_id')
	int Quantity_Break_id;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Price_Component_id')
	Price_Component price_component;
	@Column.ManyToOneForeignKey('Quantity_Break_id')
	Quantity_Break quantity_break;
}