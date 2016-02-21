/// Quantity_Break.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Quantity_Break
/// This is an autogenerated class mapping the MySQL Table Quantity_Break to an AvacadORM Entity.

/// Ranges of values to be used for restricting Price_Component applicability by quantity. If thru_quantity is null or below from_quantity, there is no upper bound to the restriction.
@Table('Quantity_Break')
class Quantity_Break extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('from_quantity')
	int from_quantity;
	@Column('thru_quantity')
	int thru_quantity;

	// ***Table Foreign Key Entities***
	@Column.OneToManyForeignKey('Quantity_Break_id')
	List<Price_Quantity_Dependency> price_quantity_dependencys;
}