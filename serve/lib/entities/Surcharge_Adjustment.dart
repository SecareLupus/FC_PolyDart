/// Surcharge_Adjustment.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Surcharge_Adjustment
/// This is an autogenerated class mapping the MySQL Table Surcharge_Adjustment to an AvacadORM Entity.

/// Subclass of Order_Adjustment, this adjustment is due to surcharges levied.
@Table('Surcharge_Adjustment')
class Surcharge_Adjustment extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Order_Adjustment_id')
	int Order_Adjustment_id;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Order_Adjustment_id')
	Order_Adjustment order_adjustment;
}