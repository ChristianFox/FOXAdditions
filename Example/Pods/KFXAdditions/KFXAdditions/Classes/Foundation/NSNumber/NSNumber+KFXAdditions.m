/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import "NSNumber+KFXAdditions.h"

@implementation NSNumber (KFXAdditions)



//--------------------------------------------------------
#pragma mark Comparison Convienence Methods
//--------------------------------------------------------
/// Returns the lowest number out of the receiver and anotherNumber
- (NSNumber *)kfx_lowestNumber:(NSNumber *)anotherNumber{
	return [self kfx_isLessThanNumber:anotherNumber] ? self : anotherNumber;
}

/// Returns the lowest number from the array of numbers
+(NSNumber *)kfx_lowestNumberFromNumbers:(NSArray<NSNumber*>*)otherNumbers{
    
    NSArray *sorted = [otherNumbers sortedArrayUsingSelector:@selector(compare:)];
    return sorted.firstObject;
}

/// Returns the highest number out of the receiver and anotherNumber
- (NSNumber *)kfx_highestNumber:(NSNumber *)anotherNumber{
	return [self kfx_isGreaterThanNumber:anotherNumber] ? self : anotherNumber;
}

/// Returns the highest number from the array of numbers
+(NSNumber *)kfx_highestNumberFromNumbers:(NSArray<NSNumber*>*)otherNumbers{
    NSArray *sorted = [otherNumbers sortedArrayUsingSelector:@selector(compare:)];
    return sorted.lastObject;
}

/// Returns YES if the receiver == anotherNumber
-(BOOL)kfx_isEqualToNumber:(NSNumber *)anotherNumber{
	return [self compare:anotherNumber] == NSOrderedSame;
}


/// Returns YES if the receiver is < anotherNumber
-(BOOL)kfx_isLessThanNumber:(NSNumber *)anotherNumber{
	return [self compare:anotherNumber] == NSOrderedAscending;
}


/// Returns YES if the receiver is <= anotherNumber
-(BOOL)kfx_isLessThanOrEqualToNumber:(NSNumber *)anotherNumber{
	return [self compare:anotherNumber] != NSOrderedDescending;
}


/// Returns YES if the receiver is > anotherNumber
-(BOOL)kfx_isGreaterThanNumber:(NSNumber *)anotherNumber{
	return [self compare:anotherNumber] == NSOrderedDescending;
}


/// Returns YES if the receiver is >= anotherNumber
-(BOOL)kfx_isGreaterThanOrEqualToNumber:(NSNumber *)anotherNumber{
	return [self compare:anotherNumber] != NSOrderedAscending;
}






@end
