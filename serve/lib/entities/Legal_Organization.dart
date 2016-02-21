/// Legal_Organization.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Legal_Organization
/// This is an autogenerated class mapping the MySQL Table Legal_Organization to an AvacadORM Entity.

/// Subtype of organizations, used for organizations that possess legal rights as an entity, and likely have a tax id.
@Table('Legal_Organization')
class Legal_Organization extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Organization_id')
	int Organization_id;
	@Column('federal_tax_id')
	String federal_tax_id;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Organization_id')
	Organization organization;
}