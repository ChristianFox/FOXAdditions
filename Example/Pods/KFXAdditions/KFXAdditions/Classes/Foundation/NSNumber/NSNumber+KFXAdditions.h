/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import <Foundation/Foundation.h>

@interface NSNumber (KFXAdditions)


//--------------------------------------------------------
#pragma mark Comparison Convienence Methods
//--------------------------------------------------------
/// Returns the lowest number out of the receiver and anotherNumber
-(NSNumber *)kfx_lowestNumber:(NSNumber *)anotherNumber;

/// Returns the lowest number from the array of numbers
+(NSNumber *)kfx_lowestNumberFromNumbers:(NSArray<NSNumber*>*)otherNumbers;

/// Returns the highest number out of the receiver and anotherNumber
-(NSNumber *)kfx_highestNumber:(NSNumber *)anotherNumber;

/// Returns the highest number from the array of numbers
+(NSNumber *)kfx_highestNumberFromNumbers:(NSArray<NSNumber*>*)otherNumbers;

/// Returns YES if the receiver == anotherNumber
-(BOOL)kfx_isEqualToNumber:(NSNumber *)anotherNumber;

/// Returns YES if the receiver is < anotherNumber
-(BOOL)kfx_isLessThanNumber:(NSNumber *)anotherNumber;

/// Returns YES if the receiver is <= anotherNumber
-(BOOL)kfx_isLessThanOrEqualToNumber:(NSNumber *)anotherNumber;

/// Returns YES if the receiver is > anotherNumber
-(BOOL)kfx_isGreaterThanNumber:(NSNumber *)anotherNumber;

/// Returns YES if the receiver is >= anotherNumber
-(BOOL)kfx_isGreaterThanOrEqualToNumber:(NSNumber *)anotherNumber;



@end
