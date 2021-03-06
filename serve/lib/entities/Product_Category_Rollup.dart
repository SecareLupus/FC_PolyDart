/// Product_Category_Rollup.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Product_Category_Rollup
/// This is an autogenerated class mapping the MySQL Table Product_Category_Rollup to an AvacadORM Entity.

/// When a category can be considered a subcategory of another, we can represent this with a Rollup designating the Parent-Child relationship of arbitrary categories.
@Table('Product_Category_Rollup')
class Product_Category_Rollup extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Product_Category_id_parent')
	int Product_Category_id_parent;
	@Column('Product_Category_id_child')
	int Product_Category_id_child;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Product_Category_id_parent')
	Product_Category product_category_parent;
	@Column.ManyToOneForeignKey('Product_Category_id_child')
	Product_Category product_category_child;
}
