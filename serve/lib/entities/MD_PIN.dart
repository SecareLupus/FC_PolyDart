/// MD_PIN.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// MD_PIN
/// This is an autogenerated class mapping the MySQL Table MD_PIN to an AvacadORM Entity.

/// Mobile device parts are a singularly tricky beast, so MRRU developed the MD-PIN identification system. Support for this identification system is built into this table.
@Table('MD_PIN')
class MD_PIN extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Good_Identification_id')
	int Good_Identification_id;
	@Column('md_pin_manufacturer')
	String md_pin_manufacturer;
	@Column('md_pin_handset')
	String md_pin_handset;
	@Column('md_pin_subsystem')
	String md_pin_subsystem;
	@Column('md_pin_origin')
	String md_pin_origin;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Good_Identification_id')
	Good_Identification good_identification;
	@Column.OneToManyForeignKey('MD_PIN_id_this')
	List<MD_PIN_Child_Reference> md_pin_this;
	@Column.OneToManyForeignKey('MD_PIN_id_child')
	List<MD_PIN_Child_Reference> md_pin_child;
}
