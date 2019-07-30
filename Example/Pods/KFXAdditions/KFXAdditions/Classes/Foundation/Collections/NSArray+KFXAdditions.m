/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import "NSArray+KFXAdditions.h"
// Other Categories
#import "NSDictionary+KFXAdditions.h"
#import "NSSet+KFXAdditions.h"


@implementation NSArray (KFXAdditions)

-(NSArray *)kfx_shuffledArray{
    NSUInteger i = self.count;
    NSMutableArray *shuffledArray = [self mutableCopy];
    
    while (i) {
        NSUInteger randomIndex = arc4random_uniform((u_int32_t)i);
        [shuffledArray exchangeObjectAtIndex:randomIndex withObjectAtIndex:--i];
    }
    
    return [shuffledArray copy];
}

-(NSArray *)kfx_reversedArray{
    
    return [[self reverseObjectEnumerator] allObjects];
}

-(id)kfx_randomObject {
    if (self.count <= (uint32_t)-1) {
        uint32_t count = (uint32_t)self.count;
        return [self objectAtIndex:arc4random_uniform(count)];
    }else{
        return [self objectAtIndex:arc4random() % self.count];
    }
}

+(NSArray *)kfx_arrayByCombingObjectsFromArrays:(NSArray<NSArray *> *)arrays{
    
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:10];
    for (NSArray *anArray in arrays) {
        [mutArray addObjectsFromArray:anArray];
    }
    return mutArray.copy;
}


-(NSUInteger)kfx_depth{
    
    NSUInteger highestCount = 0;
    NSUInteger currentCount = 0;
    for (id obj in self) {
        
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
