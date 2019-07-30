/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import "UIView+KFXAdditions.h"

@implementation UIView (KFXAdditions)

//--------------------------------------------------------
#pragma mark Init
//--------------------------------------------------------
+(instancetype)kfx_instantiateFromNib{
	return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class])
										owner:nil
									  options:nil].firstObject;
}


//--------------------------------------------------------
#pragma mark Dimensions Convienence Accessors
//--------------------------------------------------------
-(CGFloat)x{
    return self.frame.origin.x;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(CGFloat)left{
    return self.x;
}

-(CGFloat)top{
    return self.y;
}

-(CGFloat)right{
    return self.x + self.width;
}

-(CGFloat)bottom{
    return self.y + self.height;
}

-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(void)setOrigin:(CGPoint)origin{
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}

-(void)setSize:(CGSize)size{
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}


//--------------------------------------------------------
#pragma mark - First Responder
//--------------------------------------------------------
-(UIView *)kfx_findFirstResponder{
    
    // Found it first time - yay!
    if ([self isFirstResponder]) {
        return self;
    }
    
    // Look through subviews
    for (UIView *subview in [self subviews]) {
        UIView *firstResponder = [subview kfx_findFirstResponder];
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    
    // Cannot be found
    return nil;
}



//--------------------------------------------------------
#pragma mark - Border
//--------------------------------------------------------
-(void)kfx_addBorderWithRadius:(CGFloat)radius width:(CGFloat)borderWidth colour:(UIColor *)colour{
	
	self.layer.cornerRadius = radius;
	self.layer.borderWidth = borderWidth;
	self.layer.masksToBounds = YES;
	self.layer.borderColor = colour.CGColor;
	
}

-(void)kfx_addRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius{
    
    CGRect rect = self.bounds;
    
    // Create the path
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the view's layer
    self.layer.mask = maskLayer;
}

//--------------------------------------------------------
#pragma mark Animation
//--------------------------------------------------------
-(void)kfx_fadeInWithDuration:(NSTimeInterval)duration
               completion:(void(^)(BOOL))completion{
    self.alpha = 0.0;
    [UIView animateWithDuration:duration
                     animations:^{
                         self.alpha = 1.0;
                     } completion:completion];
}

-(void)kfx_fadeOutWithDuration:(NSTimeInterval)duration
                completion:(void(^)(BOOL))completion{
    self.alpha = 1.0;
    [UIView animateWithDuration:duration
                     animations:^{
                         self.alpha = 0.0;
                     } completion:completion];
    
}


//--------------------------------------------------------
#pragma mark Images
//--------------------------------------------------------
-(UIImage*)kfx_imageRepresentation{
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



//--------------------------------------------------------
#pragma mark Hierarchy
//--------------------------------------------------------
-(UIView*)kfx_superviewOfClass:(Class)theClass{
    return [self kfx_superviewOfClass:theClass strict:NO];
}

-(UIView*)kfx_superviewOfClass:(Class)theClass strict:(BOOL)strict{
    
    UIView *superview;
    UIView *view = self.superview;
    while (view != nil) {
        if(strict && [view isMemberOfClass:theClass]) {
            superview = view;
            break;
        } else if(!strict && [view isKindOfClass:theClass]) {
            superview = view;
            break;
        } else {
            view = view.superview;
        }
    }
    return superview;
}

-(UIView *)kfx_subviewOfClass:(Class)theClass{
    return [self kfx_subviewOfClass:theClass strict:NO];
}

-(UIView *)kfx_subviewOfClass:(Class)theClass strict:(BOOL)strict{
    
    UIView *subview;
    for (UIView *child in self.subviews) {
        if(strict && [child isMemberOfClass:theClass]) {
            subview = child;
            break;
        } else if(!strict && [child isKindOfClass:theClass]) {
            subview = child;
            break;
        }
    }
    return subview;
}

-(BOOL)kfx_removeSubview:(UIView *)view{
    if ([self.subviews containsObject:view]) {
        [view removeFromSuperview];
        return YES;
    }
    return NO;
}

-(void)kfx_removeAllSubviews{
    while (self.subviews.count > 0) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}


//--------------------------------------------------------
#pragma mark Background
//--------------------------------------------------------
-(void)kfx_setBackgroundGradientWithTopColor:(UIColor *)top
                             bottomColor:(UIColor *)bottom{
    
    NSArray *colors = [NSArray arrayWithObjects:(id)top.CGColor, bottom.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.colors = colors;
    gradient.locations = locations;
    gradient.frame = self.bounds;
    [self.layer insertSublayer:gradient atIndex:0];
}

- (void)kfx_setShadowWithOffset:(CGSize)offset radius:(CGFloat)radius opacity:(CGFloat)opacity {
    
    CALayer *layer = self.layer;
    layer.masksToBounds = NO;
    layer.shadowOffset = offset;
    layer.shadowRadius = radius;
    layer.shadowOpacity = opacity;
}












@end
