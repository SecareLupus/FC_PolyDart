/// Product_Category_Classification.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Product_Category_Classification
/// This is an autogenerated class mapping the MySQL Table Product_Category_Classification to an AvacadORM Entity.

/// Association of Products and Product_Categories, applying categorical labels to products. Has date ranges to designate the time the product should be considered a part of the category, as well as a flag indicating whether it should be considered the primary category of that Product.
@Table('Product_Category_Classification')
class Product_Category_Classification extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Product_id')
	int Product_id;
	@Column('Product_Category_id')
	int Product_Category_id;
	@Column('from_date')
	DateTime from_date;
	@Column('thru_date')
	DateTime thru_date;
	@Column('primary_flag')
		@Column('comment')
	String comment;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Product_id')
	Product product;
	@Column.ManyToOneForeignKey('Product_Category_id')
	Product_Category product_category;
}