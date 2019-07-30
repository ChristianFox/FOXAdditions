/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import "UITouch+KFXAdditions.h"

@implementation UITouch (KFXAdditions)

+(CGPoint)kfx_centroidOfTouches:(NSSet *)touches inView:(UIView *)view{
	
	CGFloat sumX = 0.f;
	CGFloat sumY = 0.f;
	
	for (UITouch *touch in touches) {
		NSAssert([touch isKindOfClass:[UITouch class]],
				 @"Touches must be a set of UITouch objects");
		
		CGPoint location = [touch locationInView:view];
		sumX += location.x;
		sumY += location.y;
	}
	
	return CGPointMake((CGFloat)round(sumX / touches.count), (CGFloat)round(sumY / touches.count));
}



@end
