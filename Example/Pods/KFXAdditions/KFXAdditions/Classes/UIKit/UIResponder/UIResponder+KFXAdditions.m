/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import "UIResponder+KFXAdditions.h"
static __weak id currentFirstResponder;

@implementation UIResponder (KFXAdditions)

+(id)kfx_currentFirstResponder {
    currentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(kfx_findFirstResponder:) to:nil from:nil forEvent:nil];
    return currentFirstResponder;
}

-(void)kfx_findFirstResponder:(id)sender {
    currentFirstResponder = self;
}


@end
