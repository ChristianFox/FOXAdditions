/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import "UIImageView+KFXAdditions.h"

@implementation UIImageView (KFXAdditions)



//--------------------------------------------------------
#pragma mark Animation
//--------------------------------------------------------
-(void)kfx_crossDissolveToImage:(UIImage*)image
                   withDuration:(NSTimeInterval)duration{
    
    [UIView transitionWithView:self
                      duration:duration
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.image = image;
                    } completion:nil];
}


//--------------------------------------------------------
#pragma mark Effects
//--------------------------------------------------------
/*
 -kfx_makeCircleAndShadow; & -kfx_makeBlackAndWhite from https://github.com/alexito4/AMPAdditions
 */
/// Add circle border with a shadow
-(void)kfx_addCircleMaskAndShadowWithColour:(UIColor *)colour{
    
    // need to make the operations in other imageview because the self.layer is readonly
    UIImageView *copy = [[UIImageView alloc] initWithFrame:self.bounds];
    copy.image = self.image;
    copy.highlightedImage = self.highlightedImage;
    
    // make new layer to contain shadow and masked image
    CALayer* containerLayer = [CALayer layer];
    containerLayer.shadowColor = colour.CGColor;
    containerLayer.shadowRadius = 2.0f;
    containerLayer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    containerLayer.shadowOpacity = 0.8f;
    
    // use the image's layer to mask the image into a circle
    copy.layer.cornerRadius = roundf(copy.frame.size.width/2.0);
    copy.layer.masksToBounds = YES;
    
    // add masked image layer into container layer so that it's shadowed
    [containerLayer addSublayer:copy.layer];
    
    // add container including masked image and shadow into original imageview
    //self.layer = containerLayer; READONLY!
    self.image = nil;
    self.highlightedImage = nil;
    [self.layer addSublayer:containerLayer];
}

/// Make the image black & white
-(void)kfx_blackAndWhite{
    
    CIImage *beginImage = [CIImage imageWithCGImage:self.image.CGImage];
    CIImage *blackAndWhite = [CIFilter filterWithName:@"CIColorMonochrome" keysAndValues:
                              kCIInputImageKey, beginImage,
                              @"inputColor", [CIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1.0],
                              @"inputIntensity", [NSNumber numberWithFloat:1.0],
                              nil].outputImage;
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgiimage = [context createCGImage:blackAndWhite fromRect:blackAndWhite.extent];
    UIImage *newImage = [UIImage imageWithCGImage:cgiimage];
    CGImageRelease(cgiimage);
    [self setImage:newImage];
}




@end
