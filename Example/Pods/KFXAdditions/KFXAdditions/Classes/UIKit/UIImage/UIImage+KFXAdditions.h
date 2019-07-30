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

NS_ASSUME_NONNULL_BEGIN
@interface UIImage (KFXAdditions)


//--------------------------------------------------------
#pragma mark Initilise
//--------------------------------------------------------
+(instancetype)kfx_imageWithColour:(UIColor*)colour size:(CGSize)size;



//--------------------------------------------------------
#pragma mark Resizing & Cropping
//--------------------------------------------------------
/**
 *  Returns a copy of this image that is cropped to the given bounds. This method ignores the image's imageOrientation setting.
 *
 *  @param bounds The bounds will be adjusted using CGRectIntegral.
 *
 *  @return A new UIImage cropped to bounds.
 */
- (UIImage *)kfx_croppedImage:(CGRect)bounds;


/**
 *  If transparentBorder is non-zero, a transparent border of the given size will be added around the edges of the thumbnail. (Adding a transparent border of at least one pixel in size has the side-effect of antialiasing the edges of the image when rotating it using Core Animation.)
 *
 *  @return a copy of this image that is squared to the thumbnail size.
 */
- (UIImage *)kfx_thumbnailImage:(NSInteger)thumbnailSize
          transparentBorder:(NSUInteger)borderSize
               cornerRadius:(NSUInteger)cornerRadius
       interpolationQuality:(CGInterpolationQuality)quality;


/**
 *  The image will be scaled disproportionately if necessary to fit the bounds specified by the parameter
 *
 *  @return a rescaled copy of the image, taking into account its orientation
 */
- (UIImage *)kfx_resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;


/**
 *  Resizes the image according to the given content mode, taking into account the image's orientation & preserving aspect ratio. Essentially resize + crop.
 *
 */
- (UIImage *)kfx_resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;

/**
 *  Resizes the image to the specified size
 * @param size the size to make the final image
 * @return a new image, scaled to the appropriate size
 */
-(UIImage*)kfx_resizedImageToSize:(CGSize)size;


/**
 *  Resizes the image to fit in the specified size.
 * @param boundingSize the size that the final image should fit within
 * @param scale Should the image be scaled up if it is already smaller than the bounding size
 * @return a new image, scaled to the appropriate size
 */
-(UIImage*)kfx_resizedImageToFitInSize:(CGSize)boundingSize scaleIfSmaller:(BOOL)scale;


//--------------------------------------------------------
#pragma mark Alpha Channels
//--------------------------------------------------------
/**
 *  @return Returns true if the image has an alpha layer
 */
- (BOOL)kfx_hasAlpha;

/**
 *  @return Returns a copy of the given image, adding an alpha channel if it doesn't already have one
 */
- (UIImage *)kfx_imageWithAlpha;

/**
 *  If the image has no alpha layer, one will be added to it.
 *
 *  @return Returns a copy of the image with a transparent border of the given size added around its edges
 */
- (UIImage *)kfx_transparentBorderImage:(NSUInteger)borderSize;

//--------------------------------------------------------
#pragma mark Rounded Corners
//--------------------------------------------------------
/**
 *  Creates a copy of this image with rounded corners
 *
 *  @param cornerSize Size of the corners
 *  @param borderSize If borderSize is non-zero, a transparent border of the given size will also be added
 *
 *  @return a copy of this image with rounded corners
 */
- (UIImage *)kfx_roundedCornerImage:(NSInteger)cornerSize borderSize:(NSInteger)borderSize;


//--------------------------------------------------------
#pragma mark - Blurs
//--------------------------------------------------------
- (UIImage *)kfx_applyBlurWithRadius:(CGFloat)blurRadius;


//--------------------------------------------------------
#pragma mark Tint Image
//--------------------------------------------------------
+(UIImage*)kfx_tintImage:(UIImage *)image withColor:(UIColor *)color;
-(UIImage*)kfx_tintedImageWthColor:(UIColor *)color;


//--------------------------------------------------------
#pragma mark Masks
//--------------------------------------------------------
/**
 *  Creates a copy of this image masked with the given image
 *
 *  @param maskImage The image to use as a mask. This image should contain grayscale pixesl. 100% result in the receiver's pixels being opaque, 0% black result in total transparency
 *
 *  @return a copy of this image masked by the given image
 */
-(UIImage*)kfx_imageMaskedWithImage:(UIImage *)maskImage;

//--------------------------------------------------------
#pragma mark Generate Images
//--------------------------------------------------------
+(UIImage*)kfx_imageWithColour:(UIColor*)colour;


@end

NS_ASSUME_NONNULL_END









