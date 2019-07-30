/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import <CoreLocation/CoreLocation.h>

@interface CLLocation (KFXAdditions)


//--------------------------------------------------------
#pragma mark - Initilisation
//--------------------------------------------------------
/**
 * @brief Create a new CLLocation with latitude and longitude set from the given coordinates
 * @param coordinates A CLLocationCoordinates2D
 * @return A new CLLocation. If any of the combined values are invalid then nil will be returned.
 **/
+(instancetype)kfx_locationWithCoordinates:(CLLocationCoordinate2D)coordinates;

/**
 * @brief Create a new CLLocation with latitude and longitude set from the coordinates found in coordStr
 * @param coordStr An NSString containing two coordinates separated using the same symbol/s as specified in sepStr
 * @param sepStr An NSString which should match the symbol/s used to separate latitude and longitude in coordStr
 * @return A new CLLocation. If any of the arguments are invalid then nil will be returned.
 **/
+(instancetype)kfx_locationFromString:(NSString*)coordStr withSeparator:(NSString*)sepStr;

/**
 * @brief Create a new CLLocation by combining the coordinates and adjusting them with given coordinates
 * @param latitudeAdjustment The latitude in degrees to adjust the originalCoordinates by
 * @param longitudeAdjustment The longitude in degrees to adjust the originalCoordinates by
 * @return A new CLLocation. If any of the combined values are invalid then nil will be returned.
 **/
-(instancetype)locationByAdjustingCoordinatesInDegreesWithLatitude:(CLLocationDegrees)latitudeAdjustment
                                                         longitude:(CLLocationDegrees)longitudeAdjustment;

/**
 * @brief Create a new CLLocation by combining the coordinates and adjusting the with given coordinates
 * @param latitudeAdjustment The latitude in metres to adjust the originalCoordinates by
 * @param longitudeAdjustment The longitude in metres to adjust the originalCoordinates by
 * @return A new CLLocation. If any of the combined values are invalid then nil will be returned.
 **/
-(instancetype)locationByAdjustingCoordinatesInMetresWithLatitude:(double)latitudeAdjustment
                                                        longitude:(double)longitudeAdjustment;




//--------------------------------------------------------
#pragma mark - Queries
//--------------------------------------------------------
#pragma mark Accuracy
/// Returns YES if the receiver's horizontal accuracy is less than the desired maximum accuracy, ie. Acceptable
-(BOOL)kfx_isDesiredHorizontalAccuracy:(CLLocationAccuracy)desiredAccuracy;

/// Returns YES if the receiver's vertical accuracy is less than the desired maximum accuracy, ie. Acceptable
-(BOOL)kfx_isDesiredVerticalAccuracy:(CLLocationAccuracy)desiredAccuracy;

#pragma mark Freshness
/// Returns YES if the receiver's age is less than the desired maximum age, ie. Acceptable
-(BOOL)kfx_isFresh:(NSTimeInterval)desiredAge;

/// Returns YES if the receiver's age is greater than the desired maximum age, ie. Unacceptable
-(BOOL)kfx_isStale:(NSTimeInterval)desiredAge;

/// Returns YES if the receiver's timestamp is more recent than the date
-(BOOL)kfx_isMoreRecentThan:(NSDate*)date;

/// The age of the receiver in seconds
-(NSTimeInterval)kfx_age;

#pragma mark Coordinate Validity
/// Returns YES if the receiver's coordinate property is valid using CLLocationCoordinate2DIsValid()
-(BOOL)kfx_isCoordinateValid;

/// Returns YES if the receiver's coordinate property is 0.0,0.0
-(BOOL)kfx_isCoordinateZeroZero;

#pragma mark Compare Locations
/// /// Returns YES if the receiver's timestamp is equal to the other's
-(BOOL)kfx_isSameTimestampAs:(CLLocation*)otherLocation;

/// /// Returns YES if the receiver's coordinate is equal to the other's
-(BOOL)kfx_isSameCoordinatesAs:(CLLocation*)otherLocation;

/// /// Returns YES if the receiver's horizontal accuracy is equal to the other's
-(BOOL)kfx_isGreaterHorizontalAccuracyThan:(CLLocation*)otherLocation;

/// /// Returns YES if the receiver's vertical accuracy is equal to the other's
-(BOOL)kfx_isGreaterVerticalAccuracyThan:(CLLocation*)otherLocation;

//--------------------------------------------------------
#pragma mark - Formatting
//--------------------------------------------------------
#pragma mark Combined
/// Returns an NSString with the coordinates and horizontal accuracy
-(NSString*)kfx_descriptionShort;

/// Returns an NSString with the coordinates, horizontal accuracy & speed
-(NSString*)kfx_descriptionMedium;

/// Returns an NSString with the coordinates, horizontal accuracy, vertical accuracy, speed, course & timestamp
-(NSString*)kfx_descriptionFull;

#pragma mark Single Properties
/// Returns an NSString with the coordiantes in the following format: '<12.345, 67.890>'
-(NSString*)kfx_formattedCoordinates;

/// Returns an NSString with the horizontal accuracy in the following format: '<HozAcc: +/- 123.45m>'
-(NSString*)kfx_formattedHorizontalAccuracy;

/// Returns an NSString with the vertical accuracy in the following format: '<VertAcc: +/- 123.45m>'
-(NSString*)kfx_formattedVerticalAccuracy;

/// Returns an NSString with the speed in the following format: 'Speed: 560.40mps'
-(NSString*)kfx_formattedSpeed;

/// Returns an NSString with the course in the following format: 'Course 25.9>'
-(NSString*)kfx_formattedCourse;

/// Returns an NSString with the timestamp as a standard date description format
-(NSString*)kfx_formattedTimeStamp;

/// Returns an NSString with the age of the location in the following format: 'Age: 234.5 secs'
-(NSString*)kfx_formattedAge;





@end













