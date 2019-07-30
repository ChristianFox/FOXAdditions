/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

//-----------------------------------------------------------
#pragma mark - Float & Double equality
//-----------------------------------------------------------
#define clLoc_fequal(a,b) (fabsf((a) - (b)) < FLT_EPSILON)
#define clLoc_fequalzero(a) (fabsf(a) < FLT_EPSILON)
#define clLoc_dequal(a,b) (fabs((a) - (b)) < DBL_EPSILON)
#define clLoc_dequalzero(a) (fabs(a) < DBL_EPSILON)

//--------------------------------------------------------
#pragma mark - GeoLocation Constants
//--------------------------------------------------------
double const k_MetresPerDegreeLatitude = 110574.27608210722;
double const k_MetresPerDegreeLongitude = 111319.2895857656;
double const k_DegreesPerMetreLatitude = 0.0000090437;
double const k_DegreesPerMetreLongitude = 0.0000089832;

#import "CLLocation+KFXAdditions.h"
#import "NSDate+KFXAdditions.h"

@implementation CLLocation (KFXAdditions)


//======================================================
#pragma mark - ** Public Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - Initilisation
//--------------------------------------------------------
+(instancetype)kfx_locationWithCoordinates:(CLLocationCoordinate2D)coordinates{
    
    if (!CLLocationCoordinate2DIsValid(coordinates)) {
        return nil;
    }
    
    CLLocation *location = [[CLLocation alloc]initWithLatitude:coordinates.latitude
                                                     longitude:coordinates.longitude];
    return location;
}

+(instancetype)kfx_locationFromString:(NSString *)coordStr withSeparator:(NSString *)sepStr{
    
    if (coordStr.length == 0 || coordStr.length < sepStr.length) {
        return nil;
    }
    NSArray *components = [coordStr componentsSeparatedByString:sepStr];
    if (components.count != 2) {
        return nil;
    }
    CLLocationDegrees latitude = [components.firstObject doubleValue];
    CLLocationDegrees longitude = [components.lastObject doubleValue];
    CLLocation *location = [[CLLocation alloc]initWithLatitude:latitude
                                                     longitude:longitude];
    return location;
}

-(instancetype)locationByAdjustingCoordinatesInDegreesWithLatitude:(CLLocationDegrees)latitudeAdjustment
                                                         longitude:(CLLocationDegrees)longitudeAdjustment{
    
    CLLocationDegrees newLat = self.coordinate.latitude + latitudeAdjustment;
    CLLocationDegrees newLong = self.coordinate.longitude + longitudeAdjustment;
    if (newLat > 90.000000000000 || newLat < -90.000000000000) {
        return nil;
    }else if (newLong > 180.000000000000 || newLong < -180.000000000000){
        return nil;
    }

    CLLocationCoordinate2D newCoord = CLLocationCoordinate2DMake(newLat, newLong);
    if (!CLLocationCoordinate2DIsValid(newCoord)) {
        return nil;
    }
    CLLocation *location = [[CLLocation alloc]initWithCoordinate:newCoord
                                                        altitude:self.altitude
                                              horizontalAccuracy:self.horizontalAccuracy
                                                verticalAccuracy:self.verticalAccuracy
                                                          course:self.course
                                                           speed:self.speed
                                                       timestamp:self.timestamp];
    return location;
}

-(instancetype)locationByAdjustingCoordinatesInMetresWithLatitude:(double)latitudeAdjustment
                                                        longitude:(double)longitudeAdjustment{
    
    CLLocationDegrees latDegrees = latitudeAdjustment * k_DegreesPerMetreLatitude;
    CLLocationDegrees longDegrees = longitudeAdjustment * k_DegreesPerMetreLongitude;
    return [self locationByAdjustingCoordinatesInDegreesWithLatitude:latDegrees
                                                           longitude:longDegrees];
}

//--------------------------------------------------------
#pragma mark - Queries
//--------------------------------------------------------
#pragma mark Accuracy
-(BOOL)kfx_isDesiredHorizontalAccuracy:(CLLocationAccuracy)desiredAccuracy{
    
    return self.horizontalAccuracy <= desiredAccuracy;
}

-(BOOL)kfx_isDesiredVerticalAccuracy:(CLLocationAccuracy)desiredAccuracy{
    
    return self.verticalAccuracy <= desiredAccuracy;
}

#pragma mark Freshness
-(BOOL)kfx_isFresh:(NSTimeInterval)desiredAge{
    
    return [self kfx_age] <= desiredAge;
}

-(BOOL)kfx_isStale:(NSTimeInterval)desiredAge{
    
    return [self kfx_age] > desiredAge;
}

-(BOOL)kfx_isMoreRecentThan:(NSDate *)date{
    
    return [self.timestamp kfx_isEarlierThanDate:date];
}

-(NSTimeInterval)kfx_age{
    NSTimeInterval locationAge = -[self.timestamp timeIntervalSinceNow];
    return locationAge;
}

#pragma mark Coordinate Validity
-(BOOL)kfx_isCoordinateValid{
    return CLLocationCoordinate2DIsValid(self.coordinate);
}

-(BOOL)kfx_isCoordinateZeroZero{
    
    if (clLoc_dequalzero(self.coordinate.latitude)) {
        
        if (clLoc_dequalzero(self.coordinate.longitude)) {
            return YES;
        }
    }
    return NO;
}

#pragma mark Compare Locations
-(BOOL)kfx_isSameTimestampAs:(CLLocation*)otherLocation{
    
    return [self.timestamp compare:otherLocation.timestamp] == NSOrderedSame;
}

-(BOOL)kfx_isSameCoordinatesAs:(CLLocation*)otherLocation{
    
    if (clLoc_dequal(self.coordinate.latitude, otherLocation.coordinate.latitude)) {
        
        if (clLoc_dequal(self.coordinate.longitude, otherLocation.coordinate.longitude)) {
            return YES;
        }
    }
    return NO;
}

-(BOOL)kfx_isGreaterHorizontalAccuracyThan:(CLLocation*)otherLocation{
 
    return self.horizontalAccuracy > otherLocation.horizontalAccuracy;
}

-(BOOL)kfx_isGreaterVerticalAccuracyThan:(CLLocation*)otherLocation{
    
    return self.verticalAccuracy > otherLocation.verticalAccuracy;
}



//--------------------------------------------------------
#pragma mark - Formatting
//--------------------------------------------------------
#pragma mark Combined
-(NSString*)kfx_descriptionShort{
    return [NSString stringWithFormat:@"%@ %@",
            [self kfx_formattedCoordinates],
            [self kfx_formattedHorizontalAccuracy]];
}

-(NSString*)kfx_descriptionMedium{
    return [NSString stringWithFormat:@"%@ %@ %@",
            [self kfx_formattedCoordinates],
            [self kfx_formattedHorizontalAccuracy],
            [self kfx_formattedSpeed]];

}

-(NSString*)kfx_descriptionFull{
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@",
            [self kfx_formattedCoordinates],
            [self kfx_formattedHorizontalAccuracy],
            [self kfx_formattedVerticalAccuracy],
            [self kfx_formattedSpeed],
            [self kfx_formattedCourse],
            [self kfx_formattedTimeStamp]];
}

#pragma mark Single Properties
-(NSString*)kfx_formattedCoordinates{
    return [NSString stringWithFormat:@"<%@%f, %@%f>",
            (self.coordinate.latitude < 0.0) ? @"":@"+",
            self.coordinate.latitude,
            (self.coordinate.longitude < 0.0) ? @"":@"+",
            self.coordinate.longitude];
}

-(NSString*)kfx_formattedHorizontalAccuracy{
    return [NSString stringWithFormat:@"<HozAcc: +/- %.2fm>",
            self.horizontalAccuracy];
}

-(NSString*)kfx_formattedVerticalAccuracy{
    return [NSString stringWithFormat:@"<VertAcc: +/- %.2fm>",
            self.verticalAccuracy];
}

-(NSString*)kfx_formattedSpeed{
    return [NSString stringWithFormat:@"Speed: %.2fmps>",
            self.speed];
}

-(NSString*)kfx_formattedCourse{
    return [NSString stringWithFormat:@"Course: %.2f>",
            self.course];

}

-(NSString*)kfx_formattedTimeStamp{
    return self.timestamp.description;
}

-(NSString *)kfx_formattedAge{
    return [NSString stringWithFormat:@"Age: %.1f secs",[self kfx_age]];
}








@end


















