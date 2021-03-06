/// Organization.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Organization
/// This is an autogenerated class mapping the MySQL Table Organization to an AvacadORM Entity.

/// Organization entity, of the type Party. Indicates that this party is an organization of some structure.
@Table('Organization')
class Organization extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('Party_id')
	int Party_id;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Party_id')
	Party party;
	@Column.OneToManyForeignKey('Organization_id')
	List<Legal_Organization> legal_organizations;
	@Column.OneToManyForeignKey('Organization_id')
	List<Organization_Person_Association> organization_person_associations;
	@Column.OneToManyForeignKey('Organization_id')
	List<Informal_Organization> informal_organizations;
	@Column.OneToManyForeignKey('Organization_id')
	List<Organization_Name> organization_names;
	@Column.OneToManyForeignKey('Organization_id')
	List<Facility_Organization_Association> facility_organization_associations;
	@Column.OneToManyForeignKey('Organization_id')
	List<Supplier_Product> supplier_products;
	@Column.OneToManyForeignKey('Organization_id')
	List<Cost_Organization_Association> cost_organization_associations;
}