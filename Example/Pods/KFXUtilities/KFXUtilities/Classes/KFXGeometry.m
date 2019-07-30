/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXUtilities
 *
 ************************************/


#import "KFXGeometry.h"

@implementation KFXGeometry


//--------------------------------------------------------
#pragma mark CGRect
//--------------------------------------------------------
/// Returns a new CGRect with the same size as the original but with the given origin
CGRect kfx_CGRectWithNewOrigin(CGRect rect, CGPoint origin){
    return (CGRect){origin,rect.size};
}

/// Returns a new CGRect with the same origin as the original but with the given size
CGRect kfx_CGRectWithNewSize(CGRect rect, CGSize size){
    return (CGRect){rect.origin,size};
}

/// Returns a new CGRect the same as the original but with the new x origin
CGRect kfx_CGRectWithNewOriginX(CGRect rect, CGFloat xOrigin){
    return (CGRect){(CGPoint){xOrigin,rect.origin.y},rect.size};
}

/// Returns a new CGRect the same as the original but with the new y origin
CGRect kfx_CGRectWithNewOriginY(CGRect rect, CGFloat yOrigin){
    return (CGRect){(CGPoint){rect.origin.x,yOrigin},rect.size};
}

/// Returns a new CGRect the same as the original but with the new width
CGRect kfx_CGRectWithNewWidth(CGRect rect, CGFloat width){
    return (CGRect){rect.origin,(CGSize){width,rect.size.height}};
}

/// Returns a new CGRect the same as the original but with the new height
CGRect kfx_CGRectWithNewHeight(CGRect rect, CGFloat height){
    return (CGRect){rect.origin,(CGSize){rect.size.width,height}};
}

/// Returns a new CGRect with the given size and origin calculated from the centre
CGRect kfx_CGRectMakeWithCentreAndSize(CGPoint centre, CGSize size){
    CGPoint origin = (CGPoint){
        centre.x - size.width*0.5,
        centre.y - size.height*0.5
    };
    return (CGRect){origin,size};
}

/// Returns a CGRect with all values floored from the original
CGRect kfx_CGRectFloor(CGRect rect){
    return CGRectMake(floor(rect.origin.x),
                      floor(rect.origin.y),
                      floor(rect.size.width),
                      floor(rect.size.height));
}

/// Returns a CGRect with all values ceiling-ed from the original
CGRect kfx_CGRectCeiling(CGRect rect){
    return CGRectMake(ceil(rect.origin.x),
                      ceil(rect.origin.y),
                      ceil(rect.size.width),
                      ceil(rect.size.height));
}

/// Returns a CGRect with all values rounded from the original
CGRect kfx_CGRectRounded(CGRect rect){
    return CGRectMake((CGFloat)round(rect.origin.x),
                      (CGFloat)round(rect.origin.y),
                      (CGFloat)round(rect.size.width),
                      (CGFloat)round(rect.size.height));
}

//------------------------
#pragma mark CGPoints from Rects
//------------------------
//---------------
// Centres
//---------------
/// Returns a CGPoint which is the centre of the rect
CGPoint kfx_CGRectGetCentre(CGRect rect){
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}


/// Return a CGPoint for the left centre
CGPoint kfx_CGRectCentreLeft(CGRect rect){
    return CGPointMake(rect.origin.x, CGRectGetMidY(rect));
}

/// Return a CGPoint for the top centre
CGPoint kfx_CGRectCentreTop(CGRect rect){
    return CGPointMake(CGRectGetMidX(rect), rect.origin.y);
}

/// Return a CGPoint for the right centre
CGPoint kfx_CGRectCentreRight(CGRect rect){
    return CGPointMake(rect.origin.x + rect.size.width, CGRectGetMidY(rect));
}

/// Return a CGPoint for the bottom centre
CGPoint kfx_CGRectCentreBottom(CGRect rect){
    return CGPointMake(CGRectGetMidX(rect), rect.origin.y + rect.size.height);
}

//---------------
// Corners
//---------------
/// Return a CGPoint for the top left corner (yes origin)
CGPoint kfx_CGRectCornerTopLeft(CGRect rect){
    return rect.origin;
}

/// Return a CGPoint for the top right corner
CGPoint kfx_CGRectCornerTopRight(CGRect rect){
    return  CGPointMake(rect.origin.x + rect.size.width, rect.origin.y);
}

/// Return a CGPoint for the bottom right corner
CGPoint kfx_CGRectCornerBottomRight(CGRect rect){
    return  CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
}

/// Return a CGPoint for the bottom left corner
CGPoint kfx_CGRectCornerBottomLeft(CGRect rect){
    return  CGPointMake(rect.origin.x, rect.origin.y + rect.size.height);
}


//--------------------------------------------------------
#pragma mark CGPoint
//--------------------------------------------------------
/// Returns a CGPoint with all values rounded from the original
CGPoint kfx_CGPointRounded(CGPoint point){
    return CGPointMake((CGFloat)round(point.x), (CGFloat)round(point.y));
}

/// Return a CGPoint by adding two points
CGPoint kfx_CGPointAdd(CGPoint a, CGPoint b){
    return CGPointMake(a.x + b.x, a.y + b.y);
}

/// Return a CGPoint by subtracting one point from the other
CGPoint kfx_CGPointSubtract(CGPoint a, CGPoint b){
    return CGPointMake(a.x - b.x, a.y - b.y);
}

/// Return a CGPoint by multiplying a point by the float
CGPoint kfx_CGPointMultiply(CGPoint a, CGFloat f){
    return CGPointMake(f * a.x, f * a.y);
}



//--------------------------------------------------------
#pragma mark CGSize
//--------------------------------------------------------
/// Returns a CGSize with all values rounded from the original
CGSize kfx_CGSizeRounded(CGSize size){
    return CGSizeMake((CGFloat)round(size.width), (CGFloat)round(size.height));
}

//--------------------------------------------------------
#pragma mark Distance
//--------------------------------------------------------
/// Calculates the distance between two CGPoints
CGFloat kfx_distanceBetweenCGPoints(CGPoint p1, CGPoint p2){
    CGFloat dx = p1.x - p2.x;
    CGFloat dy = p1.y - p2.y;
    
    return (CGFloat)sqrt(dx*dx+dy*dy);
}

//--------------------------------------------------------
#pragma mark Aspect Ratio
//--------------------------------------------------------
/// Returns a CGSize scaled to another size by keeping the aspect ratio
CGSize kfx_CGSizeAspectScaleToSize(CGSize size, CGSize toSize){
    
    CGFloat aspect = 1.f;
    aspect = toSize.width / size.width;
    aspect = MIN(toSize.height / size.height, aspect);
    
    return CGSizeMake(size.width * aspect, size.height * aspect);
}

/// Returns a CGSize that is the original size resized to fit in the targetSize but also keeping size with the AspectFit rule
CGSize kfx_CGSizeScaledWithAspectFitFromSize(CGSize size, CGSize targetSize){
    
    CGFloat targetRatio = targetSize.width / targetSize.height;
    CGFloat ratio = size.width / size.height;
    
    CGFloat scale = isgreaterequal(ratio, targetRatio) ? targetSize.width / size.width : targetSize.height / size.height;
    return CGSizeMake(size.width * scale, size.height * scale);
    
}

/// Returns a CGSize that is the original size resized to fit in the targetSize but also keeping size with the AspectFill rule
CGSize kfx_CGSizeScaledWithAspectFillFromSize(CGSize size, CGSize targetSize){
    
    CGFloat targetRatio = targetSize.width / targetSize.height;
    CGFloat ratio = size.width / size.height;
    
    CGFloat scale = isgreaterequal(ratio, targetRatio) ? targetSize.height / size.height : targetSize.width / size.width;
    return CGSizeMake(size.width * scale, size.height * scale);
    
}





@end
