/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/
/****************
 * # Some code ripped from:
 * - https://github.com/Daij-Djan/DDCalendarView
 * - http://stackoverflow.com/questions/4739483/number-of-days-between-two-nsdates#4739650
 * - http://stackoverflow.com/questions/8087900/how-to-retrieve-number-of-hours-past-midnight-from-an-nsdate-object
 ****************/
 

#import <Foundation/Foundation.h>

@interface NSDate (KFXAdditions)

//--------------------------------------------------------
#pragma mark - Comparison 
//--------------------------------------------------------
/// Returns YES if the receiver is earlier than anotherDate, otherwise will return NO
-(BOOL)kfx_isEarlierThanDate:(NSDate*)anotherDate;

/// Returns YES if the receiver is later than anotherDate, otherwise will return NO
-(BOOL)kfx_isLaterThanDate:(NSDate*)anotherDate;

/// Returns YES if the receiver is earlier than or equal to anotherDate, otherwise will return NO
-(BOOL)kfx_isEarlierThanOrEqualToDate:(NSDate*)anotherDate;

/// Returns YES if the receiver is later than or equal to anotherDate, otherwise will return NO
-(BOOL)kfx_isLaterThanOrEqualToDate:(NSDate*)anotherDate;

/// Returns YES if the receiver is later than startDate and earlier than endDate, otherwise will return NO
-(BOOL)kfx_isBetweenStartDate:(NSDate*)startDate andEndDate:(NSDate*)endDate;

/// Returns YES if the receiver is within seconds of anotherDate (earlier or later)
-(BOOL)kfx_isCloseToDate:(NSDate *)anotherDate withinSeconds:(NSTimeInterval)seconds;

//--------------------------------------------------------
#pragma mark Equality
//--------------------------------------------------------
/// Returns YES is the receiver's day value is equal to anotherDate's day value, otherwise will return NO
-(BOOL)kfx_isDayEqualToDate:(NSDate*)anotherDate;

/// Returns YES is the receiver's hour value is equal to anotherDate's hour value, otherwise will return NO
-(BOOL)kfx_isHourEqualToDate:(NSDate*)anotherDate;

/// Returns YES is the receiver's minute value is equal to anotherDate's minute value, otherwise will return NO
-(BOOL)kfx_isMinuteEqualToDate:(NSDate*)anotherDate;

/// Returns YES is the receiver's time (hour & minute, not seconds) value is equal to anotherDate's time value, otherwise will return NO
-(BOOL)kfx_isTimeEqualToDate:(NSDate*)anotherDate;

//--------------------------------------------------------
#pragma mark Queries
//--------------------------------------------------------
/// Returns YES is the receiver takes place in today
-(BOOL)kfx_isToday;

/// Returns YES is the receiver takes place this month
-(BOOL)kfx_isThisMonth;

/// Returns YES is the receiver takes place this year
-(BOOL)kfx_isThisYear;



//--------------------------------------------------------
#pragma mark Components/difference between dates
//--------------------------------------------------------
/**
 * Determine the number of days between the receiver and otherDate
 * @param otherDate The other date to compare with the reciever
 * @param includeToday If YES the the return value will include 1 for the partial day if there is one
 * @return The number of days between the receiver and the anotherDate parameter. If the receiver is earlier than anotherDate, the return value is negative. If anotherDate is nil, the results are undefined.
 **/
-(NSInteger)kfx_daysSinceDate:(NSDate*)otherDate
  includeCurrentIncompleteDay:(BOOL)includeToday;

/**
 * Determine the number of hours between the receiver and otherDate
 * @param otherDate The other date to compare with the reciever
 * @param includeToday If YES the the return value will include 1 for the partial day if there is one
 * @return The number of hours between the receiver and the anotherDate parameter. If the receiver is earlier than anotherDate, the return value is negative. If anotherDate is nil, the results are undefined.
 **/
-(NSInteger)kfx_hoursSinceDate:(NSDate*)otherDate
  includeCurrentIncompleteHour:(BOOL)includeToday;

/**
 * Determine the number of hours between the receiver and the previous midnight
 * @return The number of hours between the receiver and the previous midnight. If the receiver is earlier than anotherDate, the return value is negative. If anotherDate is nil, the results are undefined.
 **/
-(NSInteger)hoursSinceMidnight;


//--------------------------------------------------------
#pragma mark Components
//--------------------------------------------------------
/// Returns the date components from the receiver using the current NSCalendar
-(NSDateComponents*)kfx_currentCalendarDateComponents;

//--------------------------------------------------------
#pragma mark New Dates
//--------------------------------------------------------
/// Create a new date with the receiver's date & time but adding the days
-(NSDate*)kfx_dateByAddingDays:(NSInteger)days;

/// Create a new date with the receiver's day, month and year but updating the hour, minute and second to the given values
-(NSDate*)kfx_dateWithHour:(NSInteger)hour minute:(NSInteger)min second:(NSInteger)sec;

/// Create a new date with the receiver's month and year but updating the hour, minute and second to the given values and adding the days value
-(NSDate*)kfx_dateByAddingDays:(NSInteger)days withHour:(NSInteger)hour minute:(NSInteger)min second:(NSInteger)sec;

/// Create a new date set to midnight
-(NSDate*)kfx_midnight;


@end







