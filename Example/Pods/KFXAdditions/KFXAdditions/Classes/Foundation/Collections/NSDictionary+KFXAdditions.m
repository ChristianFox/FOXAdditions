/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import "NSDictionary+KFXAdditions.h"
// Other Categories
#import "NSArray+KFXAdditions.h"
#import "NSSet+KFXAdditions.h"

@implementation NSDictionary (KFXAdditions)

-(NSUInteger)kfx_depth{
    
    NSUInteger highestCount = 0;
    NSUInteger currentCount = 0;
    for (id key in self) {
        id obj = self[key];
        currentCount = 0;
        if (![obj respondsToSelector:@selector(kfx_depth)]) {
            currentCount = 1;
        }else{
            currentCount = [self kfx_depthOfCollection:obj];
        }
        if (currentCount > highestCount) {
            highestCount = currentCount;
        }
    }
    return highestCount;
}

-(NSUInteger)kfx_depthOfCollection:(id)collection{
    
    NSUInteger count = 0;
    if ([collection respondsToSelector:@selector(count)]) {
        
        if ([collection respondsToSelector:@selector(kfx_depth)]) {
            
            count++;
            count += [collection kfx_depth];
        }
    }
    return count;
}


@end
