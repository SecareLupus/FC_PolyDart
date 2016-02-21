/// Price_Component.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Price_Component
/// This is an autogenerated class mapping the MySQL Table Price_Component to an AvacadORM Entity.

/// Final prices of sold goods are often an amalgamation of several pricing brackets and discounts. To support this, we create Price_Component entities for each part of our final price, and sum all the appropriate ones at the time of calculation. We will only use either the price or percent columns in any given row, never both.
@Table('Price_Component')
class Price_Component extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('from_date')
	DateTime from_date;
	@Column('thru_date')
	DateTime thru_date;
	@Column('price')
		@Column('percent')
		@Column('comment')
	String comment;

	// ***Table Foreign Key Entities***
	@Column.OneToManyForeignKey('Price_Component_id')
	List<Base_Price> base_prices;
	@Column.OneToManyForeignKey('Price_Component_id')
	List<Discount_Component> discount_components;
	@Column.OneToManyForeignKey('Price_Component_id')
	List<Surcharge_Component> surcharge_components;
	@Column.OneToManyForeignKey('Price_Component_id')
	List<MSRP> msrps;
	@Column.OneToManyForeignKey('Price_Component_id')
	List<Price_Component_Party_Dependency> price_component_party_dependencys;
	@Column.OneToManyForeignKey('Price_Component_id')
	List<Price_Component_Product_Category_Dependency> price_component_product_category_dependencys;
	@Column.OneToManyForeignKey('Price_Component_id')
	List<Price_Sale_Type_Dependency> price_sale_type_dependencys;
	@Column.OneToManyForeignKey('Price_Component_id')
	List<Price_Quantity_Dependency> price_quantity_dependencys;
	@Column.OneToManyForeignKey('Price_Component_id')
	List<Price_Order_Value_Dependency> price_order_value_dependencys;
	@Column.OneToManyForeignKey('Price_Component_id')
	List<Price_Component_Product_Association> price_component_product_associations;
	@Column.OneToManyForeignKey('Price_Component_id')
	List<Price_Component_Feature_Association> price_component_feature_associations;
}