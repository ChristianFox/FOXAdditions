/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import "NSMutableArray+KFXAdditions.h"

@implementation NSMutableArray (KFXAdditions)

-(BOOL)kfx_addObject:(id)object{
    
    if (object != nil) {
        [self addObject:object];
        return YES;
    }
    return NO;
}

-(void)kfx_removeObjectsMatchingPredicate:(NSPredicate *)pred{
    
    NSArray *matching = [self filteredArrayUsingPredicate:pred];
    [self removeObjectsInArray:matching];
}


@end
