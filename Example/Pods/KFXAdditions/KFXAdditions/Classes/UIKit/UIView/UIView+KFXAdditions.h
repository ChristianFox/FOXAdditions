/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import <UIKit/UIKit.h>

@interface UIView (KFXAdditions)


//--------------------------------------------------------
#pragma mark Dimensions Convienence Accessors
//--------------------------------------------------------
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic,readonly) CGFloat top;
@property (nonatomic,readonly) CGFloat left;
@property (nonatomic,readonly) CGFloat bottom;
@property (nonatomic,readonly) CGFloat right;

-(void)setOrigin:(CGPoint)origin;
-(void)setSize:(CGSize)size;


//--------------------------------------------------------
#pragma mark Init
//--------------------------------------------------------
/// Assumes the nib has the same name as the class. Loads nib with nil owner and options
+(instancetype)kfx_instantiateFromNib;

//--------------------------------------------------------
#pragma mark - First Responder
//--------------------------------------------------------
/// Returns a UIView that is the first responder
-(UIView*)kfx_findFirstResponder;


//--------------------------------------------------------
#pragma mark - Border
//--------------------------------------------------------
/// Adds a border to the receiver
-(void)kfx_addBorderWithRadius:(CGFloat)radius
						 width:(CGFloat)borderWidth
						colour:(UIColor*)colour;
/*
 https://coderwall.com/p/rxat4a/uiview-category-for-rounding-just-the-corners-which-you-want-not-all-like-calayer-cornerradius
 */
/// Round only the specified corners
-(void)kfx_addRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius;


//--------------------------------------------------------
#pragma mark Animation
//--------------------------------------------------------
/// Set the alpha value of the receiver to 0.0 before increasing its alpha value to 1.0 over time
-(void)kfx_fadeInWithDuration:(NSTimeInterval)duration
               completion:(void(^)(BOOL))completion;

/// Set the alpha value of the receiver to 1.0 before increasing its alpha value to 0.0 over time
-(void)kfx_fadeOutWithDuration:(NSTimeInterval)duration
                completion:(void(^)(BOOL))completion;


//--------------------------------------------------------
#pragma mark Images
//--------------------------------------------------------
/// Returns a UIImage representation of the receiver's layer
-(UIImage*)kfx_imageRepresentation;


//--------------------------------------------------------
#pragma mark Hierarchy
//--------------------------------------------------------
/// Find the first superview of the receiver that is a kind of the given class
-(UIView*)kfx_superviewOfClass:(Class)theClass;

/// Find the first superview of the receiver that is a member or kind of the given class. If strict = YES then only member of class is good enough, otherwise member or kind is acceptable.
-(UIView*)kfx_superviewOfClass:(Class)theClass strict:(BOOL)strict;

/// Find the first subview of the receiver that is a kind of the given class
-(UIView*)kfx_subviewOfClass:(Class)theClass;

/// Find the first subview of the receiver that is a member or kind of the given class. If strict = YES then only member of class is good enough, otherwise member or kind is acceptable.
-(UIView*)kfx_subviewOfClass:(Class)theClass strict:(BOOL)strict;

/// Remove the view from the receiver if the view is a subview
-(BOOL)kfx_removeSubview:(UIView*)view;

/// Remove all subviews from the reciever
-(void)kfx_removeAllSubviews;

//--------------------------------------------------------
#pragma mark Background
//--------------------------------------------------------
/// Add gradient layer at index 0
-(void)kfx_setBackgroundGradientWithTopColor:(UIColor *)top
                                 bottomColor:(UIColor *)bottom;

/// Add a shadow to the receiver
-(void)kfx_setShadowWithOffset:(CGSize)offset
                        radius:(CGFloat)radius
                       opacity:(CGFloat)opacity;


@end














