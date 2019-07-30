/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

/*
 Credits:
 -kfx_makeCircleAndShadow; & -kfx_makeBlackAndWhite from https://github.com/alexito4/AMPAdditions
 */


#import <UIKit/UIKit.h>

@interface UIImageView (KFXAdditions)


//--------------------------------------------------------
#pragma mark Animation
//--------------------------------------------------------
-(void)kfx_crossDissolveToImage:(UIImage*)image
                   withDuration:(NSTimeInterval)duration;



//--------------------------------------------------------
#pragma mark Effects
//--------------------------------------------------------
/// Add circle mask with a shadow
-(void)kfx_addCircleMaskAndShadowWithColour:(UIColor*)colour;

/// Make the image black & white
-(void)kfx_blackAndWhite;




@end
