/// Required_Feature.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Required_Feature
/// This is an autogenerated class mapping the MySQL Table Required_Feature to an AvacadORM Entity.

/// Subclass of Product_Feature_Applicability, this indicates the associated Product_Feature is mandatory on the associated Product.
@Table('Required_Feature')
class Required_Feature extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Product_Feature_Applicability_id')
	int Product_Feature_Applicability_id;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Product_Feature_Applicability_id')
	Product_Feature_Applicability product_feature_applicability;
}