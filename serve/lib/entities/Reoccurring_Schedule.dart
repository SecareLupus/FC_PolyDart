/// Reoccurring_Schedule.dart
/// Version 0.0.1a
/// Copyright 2016 Programmers for a Better Tomorrow, Yesterday

part of entities;

/// Reoccurring_Schedule
/// This is an autogenerated class mapping the MySQL Table Reoccurring_Schedule to an AvacadORM Entity.

/// If an event will occur on some regular days of the week or month, an event should be linked to by this table.
@Table('Reoccurring_Schedule')
class Reoccurring_Schedule extends Entity {
	// ***Table Columns***
	@Column.PrimaryKey('id')
	int id;
	@Column('from_date')
	DateTime from_date;
	@Column('thru_date')
	DateTime thru_date;
	@Column('Event_Schedule_id')
	int Event_Schedule_id;

	// ***Table Foreign Key Entities***
	@Column.ManyToOneForeignKey('Event_Schedule_id')
	Event_Schedule event_schedule;
	@Column.OneToManyForeignKey('Reoccurring_Schedule_id')
	List<RS_Day_of_Week> rs_day_of_weeks;
	@Column.OneToManyForeignKey('Reoccurring_Schedule_id')
	List<RS_Day_of_Month> rs_day_of_months;
	@Column.OneToManyForeignKey('Reoccurring_Schedule_id')
	List<RS_Scheduled_Time> rs_scheduled_times;
}