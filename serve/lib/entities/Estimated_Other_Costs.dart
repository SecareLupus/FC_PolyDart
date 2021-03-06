/// Estimated_Other_Costs.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Estimated_Other_Costs
/// This is an autogenerated class mapping the MySQL Table Estimated_Other_Costs to an AvacadORM Entity.

/// Subclass of Estimated_Product_Cost, this represents other costs implicit in the composite total.
@Table('Estimated_Other_Costs')
class Estimated_Other_Costs extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Estimated_Product_Cost_id')
	int Estimated_Product_Cost_id;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Estimated_Product_Cost_id')
	Estimated_Product_Cost estimated_product_cost;
}